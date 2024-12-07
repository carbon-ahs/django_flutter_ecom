from django.shortcuts import render
from django.views.generic import TemplateView


# Create your views here.
def home(request):
    context = {
        "test": "TEST",
    }
    return render(request, "core/home.html", context=context)


def something_cool(request):
    """This function does something.

    :param arg1: The first argument.
    :param arg2: The second argument.
    :return: The result of the operation.
    """
    # Do something
    context = {
        "test": "something_cool",
    }
    return render(request, "core/something_cool.html", context=context)


class SomethingCoolView(TemplateView):
    template_name = "something_cool.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        title = "Something Cool View"
        context["page_title"] = title
        return context
