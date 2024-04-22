from django.shortcuts import render

from django.views import generic


# Create your views here.
class Index(generic.TemplateView):
    template_name = 'index/index.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Welcome to Book Store'
        return context
