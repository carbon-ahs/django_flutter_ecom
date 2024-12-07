from django.urls import path

from shop.views import ProductView


urlpatterns = [
    path("products/", ProductView.as_view()),
]
