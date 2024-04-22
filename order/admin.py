from django.contrib import admin

# Register your models here.

from .models import Order, OrderBook

admin.site.register(Order)
admin.site.register(OrderBook)
