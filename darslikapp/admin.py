from django.contrib import admin

from .models import Category, Dars


# Register your models here.
@admin.register(Dars)
class DarsAdmin(admin.ModelAdmin):
    pass


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    pass
