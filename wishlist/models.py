from django.db import models

from customer.models import Customer
from book.models import Book


# Create your models here.
class Wishlist(models.Model):
    customer = models.ForeignKey(Customer, on_delete=models.CASCADE, null=True)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.customer.user.username} - {self.book.title}'