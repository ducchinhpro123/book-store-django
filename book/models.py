import uuid

from django.db import models
from django.utils.text import slugify
from django_ckeditor_5.fields import CKEditor5Field

from customer.models import Seller


# Create your models here.
class Book(models.Model):
    title = models.CharField(max_length=100)
    image = models.ImageField(upload_to='book_images')
    author = models.ManyToManyField('author.Author',
                                    blank=True)
    price = models.DecimalField(max_digits=5,
                                decimal_places=2)
    stock = models.IntegerField()
    deal_of_the_week = models.BooleanField(default=False)
    publisher = models.ForeignKey('publisher.Publisher',
                                  on_delete=models.CASCADE),
    description = CKEditor5Field('Text',
                                 config_name='extends')
    genre = models.ManyToManyField('Genre', blank=True)
    slug = models.SlugField(unique=True, default=None)
    seller = models.ForeignKey(Seller, on_delete=models.CASCADE,
                               related_name='books', null=True)

    def get_avg_rating(self):
        return self.reviews.aggregate(models.Avg('rating'))['rating__avg'] or 0

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.title)
        super().save(*args, **kwargs)
        if Book.objects.filter(slug=self.slug).exclude(id=self.id).exists():
            self.slug = f"{self.slug}-{uuid.uuid4()}"
            super().save(*args, **kwargs)

    def __str__(self):
        return self.title


class Genre(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class Review(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE, related_name='reviews')
    user = models.ForeignKey('auth.User', on_delete=models.CASCADE, related_name='reviews')
    rating = models.IntegerField()
    review = models.TextField(null=True, blank=True)
    date = models.DateTimeField(auto_now_add=True, null=True)

    def __str__(self):
        return f"{self.book.title} - {self.rating}"


class Sale(models.Model):
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=0)
    sale_date = models.DateTimeField(auto_now_add=True)

    def save(self, *args, **kwargs):
        if self.quantity > self.book.stock:
            raise ValueError('Sale quantity cannot be greater than stock')
        else:
            self.book.stock -= self.quantity
            self.book.save()
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.book.title} - {self.quantity} - {self.book.title}"
