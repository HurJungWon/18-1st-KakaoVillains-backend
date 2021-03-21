# Generated by Django 3.1.7 on 2021-03-18 05:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='character',
            name='product',
            field=models.ManyToManyField(related_name='hero', through='product.CharacterProduct', to='product.Product'),
        ),
    ]