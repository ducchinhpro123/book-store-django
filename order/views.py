from django.db.models import F, Sum
# Create your views here.
from django.shortcuts import render
from django.views import generic
from book.models import Sale, Book

from .models import Order, OrderBook


# Create your views here.


class Index(generic.View):
    def get(self, request):
        customer = request.user.customer
        order = Order.objects.filter(customer=customer).last()
        if order:
            return render(request, 'order/my_order.html', {'order': order})
        else:
            return render(request, 'order/my_order.html')


# class OrderDetail(generic.DetailView):
#     model = Order
#     template_name = 'order/detail.html'
#     context_object_name = 'order'
#
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['order_books'] = OrderBook.objects.filter(order=self.object)
#
#         return context
#
#
def order_detail(request, order_id):
    order = Order.objects.get(pk=order_id)
    order_books = order.orderbook_set.all()
    return render(request, 'order/detail.html', {'order': order, 'order_books': order_books})


def create_order(request):
    """
    This view creates an order from the cart
    """
    customer = request.user.customer
    cart = request.user.cart

    # Save all the books from the cart to the order
    total = cart.cartbook_set.aggregate(total=Sum(F('quantity') * F('book__price')))['total']
    total = round(total, 2)
    order = Order.objects.create(customer=customer, total=total)

    for cart_book in cart.cartbook_set.all():
        OrderBook.objects.create(order=order, book=cart_book.book, quantity=cart_book.quantity)

        book = cart_book.book
        sale = Sale.objects.create(book=book, quantity=cart_book.quantity)
        sale.save()

        cart_book.delete()

    return render(request, 'order/my_order.html', {'order': order})


class OrderHistoryView(generic.ListView):
    template_name = 'order/history.html'
    context_object_name = 'orders'

    model = Order

    def get_queryset(self):
        return Order.objects.filter(customer=self.request.user.customer)
