from django.urls import path
from shop.views import CartView, FavoriteView, OrderView, ProductView, RegisterView
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path("products/", ProductView.as_view()),
    path("favorite/", FavoriteView.as_view()),
    path("login/", obtain_auth_token),
    path("register/", RegisterView.as_view()),
    path("cart/", CartView.as_view()),
    path("order/", OrderView.as_view()),
]
