from django.shortcuts import render

from django.urls import reverse_lazy
from django.views import generic
from django.contrib import messages

from customer.forms import RegisterSellerForm
from customer.models import Customer, Seller


# Create your views here.
class AccountView(generic.TemplateView):
    template_name = 'customer/account.html'


class UpdateProfile(generic.UpdateView):
    template_name = 'customer/update_profile.html'
    model = Customer
    fields = ['address', 'phone', 'img_profile']

    success_url = reverse_lazy('customer:account')

    def form_valid(self, form):
        form.instance.user = self.request.user
        messages.success(self.request, "Profile updated successfully")
        return super().form_valid(form)

    def form_invalid(self, form):
        response = super().form_invalid(form)
        response.status_code = 400
        messages.error(self.request, "There was an error in the form")
        return response


def update_avatar(request):
    customer = request.user.customer
    if request.method == 'POST':
        customer.img_profile = request.FILES['avatar']
        customer.save()
        messages.success(request, "Avatar updated successfully")
    return render(request, 'customer/account.html')


def address(request):
    customer = request.user.customer
    if request.method == "POST":
        address = request.POST['address']
        customer.address = address
        customer.save()
    address_customer = customer.address
    return render(request, 'customer/address.html', {'address': address_customer})


class RegisterSellerView(generic.FormView):
    template_name = 'customer/register_seller.html'
    form_class = RegisterSellerForm
    success_url = reverse_lazy('index:index')

    def form_valid(self, form):
        # This form called when valid form data has been posted.
        seller = form.save(commit=False)
        seller.customer = self.request.user.customer
        seller.save()

        return super().form_valid(form)


class SellerView(generic.DetailView):
    """
    A class based view to display the shop of a seller.
    """
    template_name = 'customer/shop.html'
    model = Seller
    context_object_name = 'seller'
    slug_field = 'shop_name'
    slug_url_kwarg = 'shop_name'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['books'] = self.object.books.all()
        if len(context['books']) == 0:
            context['empty'] = True
        return context

    def get_object(self, queryset=None):
        return Seller.objects.get(shop_name=self.kwargs['shop_name'])


def map(request):
    return render(request, 'customer/map.html')
