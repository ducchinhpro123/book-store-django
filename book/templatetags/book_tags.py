from django import template
from django.db.models import Avg, Sum

from book.models import Book, Sale

register = template.Library()


@register.inclusion_tag('book/deals_of_the_week.html')
def deals_of_the_week():
    books = Book.objects.filter(deal_of_the_week=True)[:4]
    for book in books:
        avg_rating = book.reviews.aggregate(Avg('rating'))['rating__avg'] or 0
        book.avg_rating = round(avg_rating)
        book.sold_quantity = Sale.objects.filter(book=book).aggregate(Sum('quantity'))['quantity__sum'] or 0
        book.total_sold = book.stock
        for sale in Sale.objects.filter(book=book):
            book.total_sold += sale.quantity

        book.percentage_sold = round((book.sold_quantity / book.stock) * 100)
    return {'books': books}


@register.inclusion_tag('book/trending.html')
def get_book_trending():
    books = Book.objects.filter(reviews__rating__gt=3).annotate(avg_rating=Avg('reviews__rating')).order_by(
        'avg_rating')[:4]
    return {'books': books}


@register.inclusion_tag('book/popular.html')
def get_book_popular():
    books = Book.objects.filter(stock__gt=0)[:8]
    return {'books': books}


@register.simple_tag()
def get_next_book_slug(book_id):
    try:
        next_book = Book.objects.get(pk=book_id + 1)
        return next_book.slug
    except Book.DoesNotExist:
        return ''


@register.simple_tag()
def get_prev_book_slug(book_id):
    try:
        prev_book = Book.objects.get(pk=book_id - 1)
        return prev_book.slug
    except Book.DoesNotExist:
        return ''


@register.simple_tag()
def get_max_price(books):
    return

@register.simple_tag()
def get_rating_count(rating_star):
    return Book.objects.filter(reviews__rating=rating_star).count()