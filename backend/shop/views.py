from .serializers import *
from .models import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication


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
