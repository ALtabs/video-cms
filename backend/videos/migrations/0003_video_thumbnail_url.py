# Generated by Django 3.2.25 on 2024-10-17 12:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('videos', '0002_video_created_at'),
    ]

    operations = [
        migrations.AddField(
            model_name='video',
            name='thumbnail_url',
            field=models.URLField(blank=True, null=True),
        ),
    ]
