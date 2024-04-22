from django.urls import reverse_lazy
from django.views import generic
from django.contrib import messages

from author.forms import AuthorForm
from author.models import Author


# Create your views here.
class CreateAuthor(generic.CreateView):
    template_name = 'author/create_author.html'
    model = Author
    form_class = AuthorForm
    success_url = reverse_lazy('book:create-book')

    success_message = 'Author created successfully'

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, self.success_message)
        return response


class AuthorDetail(generic.DetailView):
    template_name = 'author/detail.html'
    model = Author
    context_object_name = 'author'
