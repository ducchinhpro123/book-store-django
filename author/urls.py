from django.urls import path
from . import views

app_name = 'author'

urlpatterns = [
    path('create-author/', views.CreateAuthor.as_view(), name='create-author'),
    path('show-detail/<int:pk>/', views.AuthorDetail.as_view(), name='author-detail'),
]
