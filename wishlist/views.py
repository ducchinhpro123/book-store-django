from django.shortcuts import redirect
from django.views import generic
from django.contrib import messages

from book.models import Book
from wishlist.models import Wishlist


# Create your views here.
class WishlistView(generic.TemplateView):
    template_name = 'wishlist/my_wishlist.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        user = self.request.user
        if user.is_anonymous:
            return context
        context['wishlist'] = user.customer.wishlist_set.all()
        context['wishlist_num'] = len(context['wishlist'])
        return context


def remove_from_wishlist(request, slug):
    book = Book.objects.get(slug=slug)
    wishlist = request.user.customer.wishlist_set.filter(book=book).first()

    if wishlist:
        wishlist.delete()
    return redirect('wishlist:my-wishlist')


class AddToWishList(generic.View):
    def post(self, request, *args, **kwargs):
        book_slug = self.request.POST['slug']
        book = Book.objects.get(slug=book_slug)
        # Wishlist.objects.create(book=book, seller=request.user.seller)
        wishlist, created = Wishlist.objects.get_or_create(book=book, customer=request.user.customer)

        if not created:
            messages.warning(request, 'Book already added to the wishlist.')
            return redirect('book:detail-view', slug=book_slug)
        return redirect('wishlist:my-wishlist')
