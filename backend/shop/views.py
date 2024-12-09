from yaml import serialize
from .serializers import ProductSerializer, UserSerializer
from .models import Favorite, Product
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
