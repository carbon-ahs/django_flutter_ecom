from venv import create
from rest_framework import serializers
from .models import *


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
