"""
URL configuration for djangoProject_books project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
                  path('myadmin/', admin.site.urls),
                  path("ckeditor5/", include('django_ckeditor_5.urls'), name="ck_editor_5_upload_file"),
                  path('author/', include('author.urls')),
                  # path('publisher/', include('publisher.urls')),
                  path('book/', include('book.urls')),
                  path('seller/', include('customer.urls')),
                  path('cart/', include('cart.urls')),
                  path('wishlist/', include('wishlist.urls')),
                  path('order/', include('order.urls')),
                  path('authentication/', include('authentication.urls')),
                  path('myadmin-management/', include('myadmin.urls')),
                  path('', include('index.urls')),
                  path('admin/', admin.site.urls),
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
