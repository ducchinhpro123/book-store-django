from django.urls import path
from . import views

app_name = 'customer'

urlpatterns = [
    path('account/', views.AccountView.as_view(), name='account'),
    path('address/', views.address, name='address'),
    path('update-profile/<int:pk>/', views.UpdateProfile.as_view(), name='update_profile'),
    path('update-avatar/', views.update_avatar, name='update_avatar'),
    path('register-seller/', views.RegisterSellerView.as_view(), name='register_seller'),
    path('shop/<str:shop_name>/', views.SellerView.as_view(), name='shop'),
    path('map/', views.map, name='map'),
]
