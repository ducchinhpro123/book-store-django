from django.urls import path

from . import views

app_name = 'wishlist'

urlpatterns = [
    path('my-wishlist/', views.WishlistView.as_view(), name='my-wishlist'),
    path('add-to-wishlist/', views.AddToWishList.as_view(), name='add-to-wishlist'),
    path('remove-from-wishlist/<slug:slug>/', views.remove_from_wishlist, name='remove-from-wishlist'),
]
