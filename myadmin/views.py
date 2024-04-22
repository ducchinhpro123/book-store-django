from django.contrib.auth.models import User
from django.http import JsonResponse
from django.shortcuts import render
from django.views import generic
from customer.models import Seller


# Create your views here.


class Index(generic.View):
    def get(self, request):
        return render(request, 'myadmin/index.html')


class ProfileVieW(generic.View):
    def get(self, request):
        return render(request, 'myadmin/profile.html')


class TableVieW(generic.View):
    def get(self, request):
        users = User.objects.all()
        return render(request, 'myadmin/table.html', {'users': users})


class RegisterView(generic.View):
    def get(self, request):
        return render(request, 'myadmin/register.html')


def get_sellers(request):
    sellers = Seller.objects.all()
    sellers = sorted(sellers, key=lambda x: x.revenue, reverse=True)
    all_shop_name = [seller.shop_name for seller in sellers]
    return JsonResponse({
        "title": "Sellers",
        "data": {
            "labels": all_shop_name,
            "datasets": [{
                "label": "Revenue",
                "data": [seller.revenue for seller in sellers],
                "backgroundColor": [
                    "rgba(255, 99, 132, 0.2)",
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(255, 206, 86, 0.2)",
                    "rgba(75, 192, 192, 0.2)",
                    "rgba(153, 102, 255, 0.2)",
                    "rgba(255, 159, 64, 0.2)"
                ],
                "borderColor": [
                    "rgba(255, 99, 132, 1)",
                    "rgba(54, 162, 235, 1)",
                    "rgba(255, 206, 86, 1)",
                    "rgba(75, 192, 192, 1)",
                    "rgba(153, 102, 255, 1)",
                    "rgba(255, 159, 64, 1)"
                ],
                "borderWidth": 1
            }]

        }
    })
