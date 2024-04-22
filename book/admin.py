from django.contrib import admin

# Register your models here.

from .models import *


class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'stock', 'slug')
    prepopulated_fields = {'slug': ('title',)}


admin.site.register(Book, BookAdmin)
admin.site.register(Sale)
admin.site.register(Genre)
admin.site.register(Review)
