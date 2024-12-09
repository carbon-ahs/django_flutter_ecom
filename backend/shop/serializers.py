from rest_framework import serializers
from .models import Cart, CartProduct, Category, Product
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = [
            "id",
            "title",
            "created_at",
        ]


class ProductSerializer(serializers.ModelSerializer):
    category = CategorySerializer()

    class Meta:
        model = Product
        fields = [
            "id",
            "title",
            "created_at",
            "image",
            "market_price",
            "selling_price",
            "description",
            "category",
        ]
        depth = 1


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ["id", "username", "password", "first_name", "last_name", "email"]
        extra_kwargs = {"password": {"write_only": True, "required": True}}

    def create(self, validated_data):
        user = get_user_model().objects.create_user(**validated_data)
        Token.objects.create(user=user)
        return user


class CartSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cart
        fields = [
            "id",
            "user",
            "total",
            "is_complete",
            "created_at",
        ]


class CartProductSerializer(serializers.ModelSerializer):
    # product = ProductSerializer()
    product = ProductSerializer(many=True)
    cart = CartSerializer()

    class Meta:
        model = CartProduct
        fields = [
            "id",
            "cart",
            "product",
            "price",
            "quantity",
            "subtotal",
        ]
        depth = 1
