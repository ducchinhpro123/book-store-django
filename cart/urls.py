
from django.urls import path
from . import views

app_name = 'cart'

urlpatterns = [
    path('cart/', views.CartView.as_view(), name='cart'),
    path('add-to-cart/', views.AddToCart.as_view(), name='add_to_cart'),
    path('remove-from-cart/', views.RemoveFromCart.as_view(), name='remove_from_cart'),
    path('update_quantity/<int:book_id>/', views.change_quantity, name='update_quantity'),
]
