from django.urls import path

from shop.views import (
    AddToCartView,
    CartView,
    FavoriteView,
    OrderView,
    ProductView,
    RegisterView,
    IncreaseCartProductQuantityView,
    DecreaseCartProductQuantityView,
    CheckoutView,
    CancelOrderView,
    CompleteOrderView,
    DeleteProductFromCartView,
)


from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path("products/", ProductView.as_view()),
    path("favorite/", FavoriteView.as_view()),
    path("login/", obtain_auth_token),
    path("register/", RegisterView.as_view()),
    path("cart/", CartView.as_view()),
    path("order/", OrderView.as_view()),
    path("add-to-cart/", AddToCartView.as_view()),
    path("remove-from-cart/", AddToCartView.as_view()),
    path("increase-quantity/", IncreaseCartProductQuantityView.as_view()),
    path("decrease-quantity/", DecreaseCartProductQuantityView.as_view()),
    path("delete-from-cart/", DeleteProductFromCartView.as_view()),
    path("checkout/", CheckoutView.as_view()),
    path("cancel-order/", CancelOrderView.as_view()),
    path("complete-order/", CompleteOrderView.as_view()),
]
