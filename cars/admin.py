from django.contrib import admin

from .models import Brand, Car


@admin.register(Car)
class CarAdmin(admin.ModelAdmin):
    pass


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    pass
