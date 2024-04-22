from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class Customer(models.Model):
    user = models.OneToOneField('auth.User', on_delete=models.CASCADE, null=True, blank=True)
    address = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    purchased_books = models.ManyToManyField('book.Book', blank=True)
    img_profile = models.ImageField(upload_to='customer_images', blank=True, null=True)

    def __str__(self):
        return self.user.username


class Seller(models.Model):
    customer = models.OneToOneField(Customer, on_delete=models.CASCADE, null=True, blank=True)
    banner = models.ImageField(upload_to='seller_banner', blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    rating = models.FloatField(default=0)
    shop_name = models.CharField(max_length=100)
    # earnings = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    revenue = models.DecimalField(max_digits=10, decimal_places=2, default=0)

    def __str__(self):
        return self.shop_name

    def get_avg_rating(self):
        return round(self.rating, 1)

    def get_total_products(self):
        return self.books.count()

    def calculate_revenue(self):
        revenue = 0
        for book in self.books.all():
            # revenue += book.sale_set.aggregate(models.Sum('quantity'))['quantity__sum'] * book.price
            quantity_sum = book.sale_set.aggregate(models.Sum('quantity'))['quantity__sum']
            if quantity_sum is None:
                quantity_sum = 0
            revenue += quantity_sum * book.price
        self.revenue = revenue
        self.save() 

        return revenue
