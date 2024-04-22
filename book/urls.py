from django.urls import path
from . import views

app_name = 'book'

urlpatterns = [
    path('', views.Index.as_view(), name='index'),
    path('shop/', views.ShopNow.as_view(), name='shop-now'),
    path('create-book/', views.CreateBook.as_view(), name='create-book'),
    path('detail-view/<slug:slug>/', views.ViewProductDetail.as_view(), name='detail-view'),
    path('create-publisher/', views.CreatePublisher.as_view(), name='create-publisher'),
    path('create-genre/', views.CreateGenre.as_view(), name='create-genre'),
    path('delete-book/<slug:slug>/', views.DeleteBook.as_view(), name='delete-book'),
    path('update-book/<slug:slug>/', views.UpdateBook.as_view(), name='update-book'),

    path('search-book/', views.SearchBook.as_view(), name='search-book'),

    path('filter/', views.FilterBook.as_view(), name='filter'),
    path('rating/<slug:slug>/', views.rating, name='rating'),
    path('filter-by-price/', views.FilterBookByPrice.as_view(), name='filter-by-price'),
    path('filter-by-author/', views.FilterBookByAuthor.as_view(), name='filter-by-author'),
    path('add-review/<slug:slug>/', views.AddReviewComment.as_view(), name='add-review'),
]
