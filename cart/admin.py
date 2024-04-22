from django.contrib import admin

from .models import Cart, CartBook

# Register your models here.

admin.site.register(Cart)
admin.site.register(CartBook)