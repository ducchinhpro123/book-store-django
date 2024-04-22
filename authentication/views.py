from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.shortcuts import render, redirect

# from .models import Customer
from django.views import generic

from customer.models import Customer


# Create your views here.
class LoginView(generic.TemplateView):
    template_name = 'authentication/login.html'

    def post(self, request, *args, **kwargs):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            return redirect('index:index')
        else:
            return render(request, self.template_name,
                          {'error': 'Invalid username or password'})


class LogoutView(generic.View):
    def get(self, request, *args, **kwargs):
        logout(request)
        return redirect('index:index')


class RegisterView(generic.TemplateView):
    template_name = 'authentication/register.html'

    def post(self, request, *args, **kwargs):
        username = request.POST['username']  # username is the name of the input in the form
        password = request.POST['password']  # password is the name of the input in the form
        repeat_password = request.POST['repeat_password']  # repeat password is the name of the input in the form
        email = request.POST['email']  # email is the name of the input in the form

        if password != repeat_password:
            return render(request, self.template_name, {'error': 'Passwords do not match'})

        user = User.objects.create_user(username=username, password=password, email=email)
        user.save()

        customer = Customer.objects.create(user=user)
        customer.save()

        login(request, user)

        return redirect('index:index')
