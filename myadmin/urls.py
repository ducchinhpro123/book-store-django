from django.urls import path
from . import views

app_name = 'myadmin'

urlpatterns = [
    path('', views.Index.as_view(), name='index'),
    path('profile/', views.ProfileVieW.as_view(), name='profile'),
    path('table/', views.TableVieW.as_view(), name='table'),
    path('register/', views.RegisterView.as_view(), name='register'),
    path('chart/get-seller/', views.get_sellers, name='get-sellers'),

]
