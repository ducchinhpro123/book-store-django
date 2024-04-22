from django.db import models


# Create your models here.
class Cart(models.Model):
    user = models.OneToOneField('auth.User', on_delete=models.CASCADE)
    #  Cart model is creating a many-to-many relationship between Cart and Book through the CartBook model.
    books = models.ManyToManyField('book.Book', blank=True, through='CartBook')

    def __str__(self):
        return self.user.username


class CartBook(models.Model):
    cart = models.ForeignKey('Cart', on_delete=models.CASCADE)
    book = models.ForeignKey('book.Book', on_delete=models.CASCADE)
    quantity = models.IntegerField()

    def __str__(self):
        return self.book.title
