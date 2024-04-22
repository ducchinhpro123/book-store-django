import json

from django.contrib import messages
from django.db.models import Avg, Sum, Max, Min
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views import generic
from django.core.cache import cache
from django.core.paginator import Paginator

from author.models import Author
from book.forms import BookForm
from book.models import Book, Genre, Review
from publisher.models import Publisher
from order.models import Order, OrderBook


# Create your views here.


def get_genres():
    genres = cache.get('genres')
    if not genres:
        genres = list(Genre.objects.all())
        cache.set('genres', genres, 60 * 60 * 24)  # cache for 24 hours
    return genres


def get_authors():
    authors = cache.get('authors')
    if not authors:
        authors = list(Author.objects.all())
        cache.set('authors', authors, 60 * 60 * 24)  # cache for 24 hours
    return authors


class Index(generic.View):
    def get(self, request):
        return render(request, 'index/index.html')


class ViewProductDetail(generic.DetailView):
    model = Book
    template_name = 'book/detail.html'
    context_object_name = 'book'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        avg_rating = self.object.reviews.aggregate(Avg('rating'))['rating__avg'] or 0
        context['avg_rating'] = round(avg_rating)
        context['sold_quantity'] = self.object.sale_set.aggregate(Sum('quantity'))['quantity__sum'] or 0
        context['percentage_sold'] = round((context['sold_quantity'] / self.object.stock) * 100)
        return context


class ShopNow(generic.TemplateView):
    template_name = 'book/shop_now_filters.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        books = Book.objects.all()
        # context['books'] = Book.objects.all()
        paginator = Paginator(books, 12)

        page_number = self.request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        context['books'] = page_obj

        context['genres'] = get_genres()
        context['authors'] = get_authors()

        max_price = Book.objects.aggregate(Max('price'))['price__max']
        min_price = Book.objects.aggregate(Min('price'))['price__min']
        context['max_price'] = round(max_price, 2)
        context['min_price'] = round(min_price, 2)

        # book_list = []
        # for book in books:
        #     book.avg_rating = round(book.reviews.aggregate(Avg('rating'))['rating__avg'] or 0)
        #     book_list.append(book)

        # context['books'] = book_list
        return context


class CreateBook(generic.CreateView):
    template_name = 'book/create_book.html'
    model = Book
    form_class = BookForm
    success_url = reverse_lazy('book:shop-now')
    success_message = 'Added Book successfully'

    def form_valid(self, form):
        form.instance.seller = self.request.user.customer.seller
        response = super().form_valid(form)
        messages.success(self.request, self.success_message)
        return response


class CreateGenre(generic.CreateView):
    template_name = 'book/create_genre.html'
    model = Genre
    fields = '__all__'

    success_message = 'Genre created successfully'
    success_url = reverse_lazy('book:create-book')

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, self.success_message)
        return response


class CreatePublisher(generic.CreateView):
    template_name = 'book/create_publisher.html'
    model = Publisher
    fields = '__all__'

    success_message = 'Publisher created successfully'

    success_url = reverse_lazy('book:create-book')

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, self.success_message)
        return response


class DeleteBook(generic.DeleteView):
    model = Book
    success_url = reverse_lazy('book:shop-now')

    def delete(self, request, *args, **kwargs):
        messages.success(self.request, 'Book deleted successfully')
        return super().delete(request, *args, **kwargs)


class UpdateBook(generic.UpdateView):
    template_name = 'book/update_book.html'
    model = Book
    form_class = BookForm
    success_url = reverse_lazy('book:shop-now')
    success_message = 'Book updated successfully'

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, self.success_message)
        return response


class SearchBook(generic.ListView):
    template_name = 'book/search_book.html'
    context_object_name = 'books'
    q = ''

    def get_queryset(self):
        query = self.request.GET.get('q')
        self.q = query
        books = Book.objects.filter(title__icontains=query)
        if len(books) == 0:
            messages.warning(self.request, f'There is no result for this {self.q}')
        return books

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["query"] = self.q
        return context


# Filter by genre
class FilterBook(generic.ListView):
    template_name = 'book/shop_now_filters.html'
    context_object_name = 'books'
    genres = []

    def get_queryset(self):
        genres = self.request.GET.getlist('genres')
        self.genres = genres
        books = Book.objects.filter(genre__name__in=genres)
        return books

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        context['genres'] = get_genres()
        context['authors'] = get_authors()
        context['genres_filtered'] = self.genres
        return context


# Filter by price
class FilterBookByPrice(generic.ListView):
    template_name = 'book/shop_now_filters.html'
    context_object_name = 'books'

    def get_queryset(self):
        price = self.request.GET.get('value_price_input')
        books = Book.objects.filter(price__lte=price)

        return books

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        context['genres'] = get_genres()
        context['authors'] = get_authors()
        return context


class FilterBookByAuthor(generic.ListView):
    template_name = 'book/shop_now_filters.html'
    context_object_name = 'books'

    def get_queryset(self):
        authors = self.request.GET.getlist('authors')
        print(authors)
        books = Book.objects.filter(author__name__in=authors)
        return books

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        context['genres'] = get_genres()
        context['authors'] = get_authors()
        return context


def rating(request, slug):
    if request.user.is_anonymous:
        return redirect('authentication:login')
    book = Book.objects.get(slug=slug)
    data = json.loads(request.body)
    rating_value = data.get('rating')
    book.reviews.update_or_create(user=request.user, defaults={'rating': rating_value})

    return JsonResponse(
        {'status': 'success', 'message': 'Rating added successfully', 'rating_total': book.reviews.all().count()})


class AddReviewComment(generic.View):
    def post(self, request, *args, **kwargs):
        if request.user.is_anonymous:
            return redirect('authentication:login')
        # If user already purchased the book then only he can review the book
        if OrderBook.objects.filter(order__customer=request.user.customer, book__slug=self.kwargs['slug']).exists():
            book = Book.objects.get(slug=self.kwargs['slug'])
            review = request.POST.get('review')
            rating = request.POST.get('rating')
            book.reviews.update_or_create(user=request.user, defaults={'rating': rating, 'review': review})
            return redirect('book:detail-view', slug=self.kwargs['slug'])
        else:
            messages.error(request, 'You can only review the book after purchasing it')
            return redirect('book:detail-view', slug=self.kwargs['slug'])

        # return redirect('book:detail-view', slug=self.kwargs['slug'])
