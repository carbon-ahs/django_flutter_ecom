from django.urls import path
from shop.views import FavoriteView, ProductView


urlpatterns = [
    path("products/", ProductView.as_view()),
    path("favorite/", FavoriteView.as_view()),
]
