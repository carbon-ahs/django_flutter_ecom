from django.contrib import admin
from django.urls import path, include, re_path
from django.conf import settings
from django.conf.urls.static import static
# from rest_framework_swagger.views import get_swagger_view

# schema_view = get_swagger_view(title="Pastebin API")

urlpatterns = []
urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include("shop.urls")),
    # re_path(r"^$", schema_view),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
