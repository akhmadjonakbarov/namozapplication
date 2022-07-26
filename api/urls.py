from django.urls import path
from . import views

urlpatterns = [
    path('', views.getRoutes),
    path('create-category/', views.createCategory),
    path('categories-darslik/', views.getCategories),
    path('category-darsliklar/<str:id_>/', views.getDarsliklar),
    path('category-darsliklar/<str:category_id>/<str:id_>/', views.getDarslik),
    path('xayr-ehsonlar/', views.getXayrEhsonlar),
    path('xayr-ehsonlar/<str:id_>/', views.getXayrEhson)
]
