from django.db import models
from django.contrib.auth.models import User

from project.middleware import get_current_user


class BaseModel(models.Model):
    is_active = models.BooleanField(default=True)
    is_deleted = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    created_by = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="created_%(class)s",
    )
    updated_by = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="updated_%(class)s",
    )

    def save(self, *args, **kwargs):
        user = get_current_user()
        if not self.pk and not self.created_by:  # Set only for new objects
            self.created_by = user
        self.updated_by = user
        super().save(*args, **kwargs)

    # def delete(self, *args, **kwargs):
    #     """Soft delete the object by setting is_deleted to True."""
    #     self.is_deleted = True
    #     self.save()

    # def restore(self):
    #     """Restore a soft-deleted object."""
    #     self.is_deleted = False
    #     self.save()

    class Meta:
        abstract = True


class Category(BaseModel):
    title = models.CharField(max_length=100)

    def __str__(self):
        return self.title


class Product(BaseModel):
    title = models.CharField(max_length=100)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True)
    image = models.ImageField(upload_to="products/")
    market_price = models.PositiveBigIntegerField()
    selling_price = models.PositiveBigIntegerField()
    description = models.TextField()

    def __str__(self):
        return self.title


class Favorite(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True)
    is_favorite = models.BooleanField(default=False)

    def __str__(self):
        return (
            f"User: {self.user} - Product: {self.product} - is_fav: {self.is_favorite}"
        )


class Cart(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    total = models.PositiveIntegerField()
    is_complete = models.BooleanField(default=False)

    def __str__(self):
        return (
            f"User: {self.user} - total: {self.total} - is_complete: {self.is_complete}"
        )


class CartProduct(BaseModel):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE, null=True)
    product = models.ManyToManyField(Product)
    price = models.PositiveBigIntegerField()
    quantity = models.PositiveIntegerField(default=1)
    subtotal = models.PositiveBigIntegerField()

    def __str__(self):
        return (
            f"Cart: {self.cart} - Product: {self.product} - Quantity: {self.quantity}"
        )


class Order(BaseModel):
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE, null=True)
    email = models.CharField(max_length=150)
    phone = models.CharField(max_length=50)
    address = models.CharField(max_length=100)

    def __str__(self):
        return f"Cart: {self.cart} - Email: {self.email}"
