import uuid

from django.db import models


# Create your models here.
class XayrEhson(models.Model):
    id = models.UUIDField(default=uuid.uuid4, primary_key=True, editable=False, unique=True)
    title = models.CharField(max_length=200)
    body = models.TextField()
    card_number = models.CharField(max_length=16)
    phone_number = models.CharField(max_length=12)
    address = models.CharField(max_length=200)
    images = models.ImageField(upload_to='xayrehson/')
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return str(self.title)

    class Meta:
        app_label = 'xayrehsonapp'
