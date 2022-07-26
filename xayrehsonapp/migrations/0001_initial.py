# Generated by Django 4.0.6 on 2022-07-17 08:01

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='XayrEhson',
            fields=[
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False, unique=True)),
                ('title', models.CharField(max_length=200)),
                ('body', models.TextField()),
                ('card_number', models.CharField(max_length=16)),
                ('phonenumber', models.CharField(max_length=12)),
                ('address', models.CharField(max_length=200)),
                ('images', models.ImageField(upload_to='xayrehson/')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
            ],
        ),
    ]