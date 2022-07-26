from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.parsers import JSONParser
from rest_framework import status

from xayrehsonapp.models import XayrEhson
from .serializers import CategorySerializer, DarsSerializer, XayrEhsonSerializer
from darslikapp.models import Category, Dars


@api_view(['GET'])
def getRoutes(request):
    routes = [
        {'POST': '/api/create-category/'},
        {'GET': '/api/categories-darslik/'},
        {'GET': '/api/category-darsliklar/categoryId/'},
        {'GET': '/api/category-darsliklar/categoryId/darslikId'},
        {'GET': '/api/xayr-ehsonlar/'}
    ]
    return Response(routes)


# +++++ XayrEhson +++++
@api_view(['GET'])
def getXayrEhsonlar(request):
    xayrehsonlar = XayrEhson.objects.all()
    serializer = XayrEhsonSerializer(xayrehsonlar, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getXayrEhson(request, id_):
    xayrehson = XayrEhson.objects.get(id=id_)
    serializer = XayrEhsonSerializer(xayrehson, many=False)
    return Response(serializer.data)


# +++++ Darsliklar +++++
@api_view(['GET'])
def getCategories(request):
    categories = Category.objects.all()
    serializer = CategorySerializer(categories, many=True)
    return Response(serializer.data)


@api_view(['POST'])
def createCategory(request):
    if request.method == 'POST':
        # print(JSONParser().parse(request))
        new_category = JSONParser().parse(request)
        serializer = CategorySerializer(data=new_category)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
        return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def getDarsliklar(request, id_):
    category = Category.objects.get(id=id_)
    darsliklar = category.darslik_category.all()
    serializer = DarsSerializer(darsliklar, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getDarslik(request, category_id, id_):
    darslik = Dars.objects.get(category_id=category_id, id=id_)
    serializer = DarsSerializer(darslik, many=False)
    return Response(serializer.data)

# @api_view(['GET'])
# def getDarsliklar(request):
#     darsliklar = Dars.objects.all()
#     serializer = DarsSerializer(darsliklar, many=True)
#     return Response(serializer.data)
