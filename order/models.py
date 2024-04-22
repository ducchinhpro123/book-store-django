from django.db import models


# Create your models here.

class Order(models.Model):
    customer = models.ForeignKey('customer.Customer', on_delete=models.CASCADE, null=True)
    books = models.ManyToManyField('book.Book', blank=True, through='OrderBook')
    date = models.DateTimeField(auto_now_add=True)
    total = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f'Order {self.id}'

    def get_shop_name(self):
        return self.customer.seller.shop_name


class OrderBook(models.Model):
    order = models.ForeignKey('Order', on_delete=models.CASCADE)
    book = models.ForeignKey('book.Book', on_delete=models.CASCADE)
    quantity = models.IntegerField()

    def __str__(self):
        return self.book.title
