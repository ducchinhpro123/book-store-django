from django.shortcuts import render, redirect
from django.views import generic
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from django.contrib.auth.decorators import login_required

from book.models import Book
from .models import *

import json


# Create your views here.
class CartView(generic.TemplateView):
    template_name = 'cart/my_cart.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        if self.request.user.is_anonymous:
            return context
        if not hasattr(self.request.user, 'cart'):
            Cart.objects.create(user=self.request.user)
        context['cart'] = self.request.user.cart

        context['total'] = sum(
            [cart_book.book.price * cart_book.quantity for cart_book in context['cart'].cartbook_set.all()])

        return context


@login_required
@csrf_exempt
@require_POST
def change_quantity(request, book_id):
    data = json.loads(request.body)
    new_quantity = data.get('quantity')
    user = request.user
    cart = Cart.objects.get(user=user)
    book = Book.objects.get(pk=book_id)
    cart_item = CartBook.objects.get(cart=cart, book=book)
    cart_item.quantity = new_quantity
    cart_item.save()
    return JsonResponse({'status': 'success', 'message': 'Quantity updated successfully'})


class AddToCart(generic.View):
    def post(self, request, *args, **kwargs):

        if request.user.is_anonymous:
            return redirect('authentication:login')

        book = Book.objects.get(pk=request.POST['book_id'])

        # cart = request.user.cart
        cart = Cart.objects.get_or_create(user=request.user)[0]
        cart_book = CartBook.objects.filter(cart=cart, book=book).first()

        quantity = int(request.POST['quantity'])

        if cart_book:
            cart_book.quantity += quantity
            cart_book.save()
        else:
            CartBook.objects.create(cart=cart, book=book, quantity=quantity)

        return redirect('cart:cart')


class RemoveFromCart(generic.View):
    def post(self, request, *args, **kwargs):
        book = Book.objects.get(pk=request.POST['book_id'])
        cart = request.user.cart
        cart_book = CartBook.objects.filter(cart=cart, book=book).first()

        if cart_book:
            cart_book.delete()

        return redirect('cart:cart')
