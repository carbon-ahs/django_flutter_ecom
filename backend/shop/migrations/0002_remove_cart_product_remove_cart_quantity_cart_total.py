# Generated by Django 4.0 on 2024-12-07 06:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cart',
            name='product',
        ),
        migrations.RemoveField(
            model_name='cart',
            name='quantity',
        ),
        migrations.AddField(
            model_name='cart',
            name='total',
            field=models.PositiveIntegerField(default=1),
            preserve_default=False,
        ),
    ]
