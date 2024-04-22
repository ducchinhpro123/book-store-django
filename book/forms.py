from django import forms
from django_ckeditor_5.widgets import CKEditor5Widget

from .models import Book, Genre, Review


class BookForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['description'].required = False

    class Meta:
        model = Book
        exclude = ['slug', 'seller']


class GenreForm(forms.ModelForm):
    class Meta:
        model = Genre
        fields = '__all__'


class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = ['rating', 'review']

