from django.contrib import admin
from .models import XayrEhson


# Register your models here.
@admin.register(XayrEhson)
class XayrEhsonAdmin(admin.ModelAdmin):
    pass
