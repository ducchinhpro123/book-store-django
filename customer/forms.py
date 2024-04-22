from django import forms

from customer.models import Seller


class RegisterSellerForm(forms.ModelForm):
    class Meta:
        model = Seller
        fields = ['shop_name', 'description', 'banner']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 3})
        }
