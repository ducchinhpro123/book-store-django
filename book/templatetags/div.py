from django import template

register = template.Library()


@register.filter
def div(value, avg):
    try:
        return round(int(value) / int(avg))
    except (ValueError, ZeroDivisionError):
        return 0
