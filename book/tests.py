from django.test import TestCase
from .models import Book, Genre


# Create your tests here.
# Test filter book by genre
class BookTestCase(TestCase):
    def book_filter(self):
        book = Book.objects.filter(genre__name__exact='Novel')
        print(book)
        self.assertIsNotNone(book)

