import uuid
from django.db import models


# Create your models here.
class Category(models.Model):
    id = models.UUIDField(
        default=uuid.uuid4, primary_key=True, unique=True, editable=False),
    name = models.CharField(max_length=200)
    body = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.name)

    class Meta:
        app_label = 'darslikapp'


class Dars(models.Model):
    category = models.ForeignKey(
        Category, on_delete=models.CASCADE, related_name='darslik_category')
    id = models.UUIDField(
        default=uuid.uuid4, primary_key=True, unique=True, editable=False),
    title = models.CharField(max_length=200)
    body = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title

    class Meta:
        app_label = 'darslikapp'
