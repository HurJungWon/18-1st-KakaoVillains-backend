# Generated by Django 3.1.7 on 2021-03-18 05:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0002_character_product'),
        ('feed', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='feed',
            name='product',
            field=models.ManyToManyField(through='feed.RecommendedProduct', to='product.Product'),
        ),
    ]