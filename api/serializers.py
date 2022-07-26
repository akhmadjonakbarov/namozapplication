from rest_framework import serializers
from darslikapp.models import Category, Dars
from xayrehsonapp.models import XayrEhson


class DarsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dars
        fields = ['id', 'title', 'body']


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('id', 'name')


class XayrEhsonSerializer(serializers.ModelSerializer):
    class Meta:
        model = XayrEhson
        fields = ('id', 'title', 'body', 'card_number', 'phone_number', 'address', 'images')
