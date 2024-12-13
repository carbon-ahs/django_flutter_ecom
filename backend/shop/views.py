from calendar import c
from sys import exception
from yaml import serialize
from .serializers import (
    CartProductSerializer,
    CartSerializer,
    OrderSerializer,
    ProductSerializer,
    UserSerializer,
)
from .models import Cart, CartProduct, Favorite, Order, Product
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication

from shop import serializers


class ProductView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get(self, request):
        query = Product.objects.all()
        data = []
        serializers = ProductSerializer(query, many=True)

        for product in serializers.data:
            favorite_query = Favorite.objects.filter(user=request.user.id).filter(
                product=product["id"]
            )
            if favorite_query:
                product["is_favorite"] = favorite_query[0].is_favorite
            else:
                product["is_favorite"] = False
            data.append(product)
        return Response(data)


class FavoriteView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        data = request.data["id"]

        try:
            user = request.user
            product = Product.objects.get(id=data)
            favorite_product = (
                Favorite.objects.filter(user=user).filter(product=product).first()
            )

            if favorite_product:
                print(favorite_product)
                favorite_product.is_favorite = not favorite_product.is_favorite
                favorite_product.save()
            else:
                favorite = Favorite.objects.create(
                    user=user, product=product, is_favorite=True
                )
                favorite.save()
            response_msg = {
                "error": False,
            }

        except Exception as e:
            response_msg = {
                "error": True,
            }

        print(response_msg)

        return Response(response_msg)


class RegisterView(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"error": False})

        return Response({"error": True})


class CartView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get(self, request):
        user = request.user
        print(user)
        try:
            cart_object = Cart.objects.filter(user=user, is_complete=False)
            data = []
            cart_serializer = CartSerializer(cart_object, many=True)
            print(cart_object)
            for cart in cart_serializer.data:
                cart_product_object = CartProduct.objects.filter(cart=cart["id"])
                cart_product_object_serializer = CartProductSerializer(
                    cart_product_object,
                    many=True,
                )
                cart["cart_products"] = cart_product_object_serializer.data
                data.append(cart)
            response_msg = {
                "error": False,
                "data": data,
            }

        except Exception as e:
            response_msg = {
                "error": True,
                "data": "No data found",
            }

        print(response_msg)

        return Response(response_msg)


class OrderView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def get(self, request):
        user = request.user
        print(user)
        try:
            query = Order.objects.filter(cart__user=request.user)
            print(query)
            serializer = OrderSerializer(query, many=True)
            response_msg = {
                "error": False,
                "data": serializer.data,
            }

        except Exception as e:
            response_msg = {
                "error": True,
                "data": "No data found",
            }

        return Response(response_msg)


class AddToCartView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        product_id = request.data["id"]

        user = request.user
        try:
            product = Product.objects.get(id=product_id)
            print("Product: ", product)
            cart = Cart.objects.filter(user=user, is_complete=False).first()
            print("Cart: ", cart)

            if not cart:
                cart = Cart.objects.create(
                    user=user,
                    total=0,
                    is_complete=False,
                )
                print("Cart created: ", cart)
            cart_product = CartProduct.objects.filter(
                product__id=product_id, cart=cart
            ).first()

            if not cart_product:
                cart_product = CartProduct.objects.create(
                    cart=cart,
                    price=product.selling_price,
                    quantity=1,
                    subtotal=product.selling_price,
                )
                cart_product.product.add(product)
                print("No product in cart, product added: ", cart_product)
                cart_product.save()
                cart.total += product.selling_price
                cart.save()
            else:
                print("Product already in cart, quantity updated: ", cart_product)
                cart_product.quantity += 1

                cart_product.subtotal += product.selling_price
                cart_product.save()
                cart.total += product.selling_price
                cart.save()

            response_msg = {
                "error": False,
                "message": "Product added to cart",
            }

        except Exception as e:
            print(e)
            response_msg = {
                "error": True,
                "message": "Product not added to cart, Something went wrong!",
            }

        return Response(response_msg)


class IncreaseCartProductQuantityView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        product_id = request.data["id"]

        user = request.user
        try:
            product = Product.objects.get(id=product_id)
            print("Product: ", product)
            cart = Cart.objects.filter(user=user, is_complete=False).first()
            print("Cart: ", cart)

            if not cart:
                print("No Cart.", cart)

            cart_product = CartProduct.objects.filter(
                product__id=product_id, cart=cart
            ).first()

            if not cart_product:
                print("No product in Cart.", cart)

            else:
                print("Product already in cart, quantity updated: ", cart_product)
                cart_product.quantity += 1

                cart_product.subtotal += product.selling_price
                cart_product.save()
                cart.total += product.selling_price
                cart.save()

            response_msg = {
                "error": False,
                "message": "Product quantity increased to cart",
            }

        except Exception as e:
            print(e)
            response_msg = {
                "error": True,
                "message": "Something went wrong!",
            }

        return Response(response_msg)


class DecreaseCartProductQuantityView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        product_id = request.data["id"]

        user = request.user
        try:
            product = Product.objects.get(id=product_id)
            print("Product: ", product)
            cart = Cart.objects.filter(user=user, is_complete=False).first()
            print("Cart: ", cart)

            if not cart:
                print("No Cart.", cart)
                exception("No Cart.")

            cart_product = CartProduct.objects.filter(
                product__id=product_id, cart=cart
            ).first()

            if not cart_product:
                print("No product in Cart.", cart)

            else:
                print("Product in cart, quantity decreased: ", cart_product)
                cart_product.quantity -= 1

                cart_product.subtotal -= product.selling_price
                cart_product.save()
                cart.total -= product.selling_price
                cart.save()

            response_msg = {
                "error": False,
                "message": "Product quantity decreased to cart",
            }

        except Exception as e:
            print(e)
            response_msg = {
                "error": True,
                "message": "Something went wrong! " + str(e),
            }

        return Response(response_msg)


class DeleteProductFromCartView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        product_id = request.data["id"]

        user = request.user
        try:
            product = Product.objects.get(id=product_id)
            print("Product: ", product)
            cart = Cart.objects.filter(user=user, is_complete=False).first()
            print("Cart: ", cart)

            if not cart:
                print("No Cart.", cart)
                exception("No Cart.")

            cart_product = CartProduct.objects.filter(
                product__id=product_id, cart=cart
            ).first()

            if not cart_product:
                print("No product in Cart.", cart)
                exception("No product in Cart.")

            else:
                print("Product in cart found, deleted ", cart_product)
                cart.total -= cart_product.subtotal
                cart_product.delete()

            response_msg = {
                "error": False,
                "message": "Product deleted from cart",
            }

        except Exception as e:
            print(e)
            response_msg = {
                "error": True,
                "message": "Something went wrong! " + str(e),
            }

        return Response(response_msg)


class CheckoutView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        pass


class CompleteOrderView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        pass


class CancelOrderView(APIView):
    permission_classes = [IsAuthenticated]
    authentication_classes = [TokenAuthentication]

    def post(self, request):
        pass
