from django import template

from customer.models import Seller

register = template.Library()


# Function to get all sellers and sort them by revenue
@register.simple_tag
def get_sellers():
    sellers = Seller.objects.all()
    sellers = sorted(sellers, key=lambda x: x.revenue, reverse=True)
    return sellers
