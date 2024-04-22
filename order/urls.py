
from django.urls import path
from . import views

app_name='order'

urlpatterns = [
    path('', views.Index.as_view(), name='index'),
    path('create-order/', views.create_order, name='create_order'),
    path('history-order-view/', views.OrderHistoryView.as_view(), name='history_order'),
    path('detail-order/<int:order_id>/', views.order_detail, name='order_detail'),
]
