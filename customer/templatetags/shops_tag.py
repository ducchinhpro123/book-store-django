from django import template

from customer.models import Seller

register = template.Library()


# Get all the sellers
@register.simple_tag()
def get_sellers():
    sellers = Seller.objects.all()
    return sellers

