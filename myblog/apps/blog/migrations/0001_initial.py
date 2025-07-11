# Generated by Django 4.2.15 on 2024-09-27 08:46

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name="Category",
            fields=[
                ("id", models.AutoField(primary_key=True, serialize=False)),
                ("name", models.CharField(max_length=100, verbose_name="种类名")),
            ],
            options={
                "verbose_name": "种类信息",
                "verbose_name_plural": "种类信息",
            },
        ),
        migrations.CreateModel(
            name="Tag",
            fields=[
                ("id", models.AutoField(primary_key=True, serialize=False)),
                ("name", models.CharField(max_length=100, verbose_name="标签名")),
            ],
            options={
                "verbose_name": "标签信息",
                "verbose_name_plural": "标签信息",
            },
        ),
        migrations.CreateModel(
            name="Blog",
            fields=[
                ("id", models.AutoField(primary_key=True, serialize=False)),
                ("title", models.CharField(max_length=200, verbose_name="文章题目")),
                ("content", models.TextField(max_length=1000, verbose_name="文章内容")),
                (
                    "simple_content",
                    models.TextField(default="", max_length=1000, verbose_name="文章简介"),
                ),
                (
                    "image",
                    models.ImageField(
                        default="blog.png",
                        upload_to="post_image/%Y/%m",
                        verbose_name="博客封面图片",
                    ),
                ),
                (
                    "created_at",
                    models.DateTimeField(auto_now_add=True, verbose_name="文章创建时间"),
                ),
                (
                    "updated_at",
                    models.DateTimeField(auto_now=True, verbose_name="文章更新时间"),
                ),
                ("likes", models.PositiveIntegerField(default=0, verbose_name="文章点赞量")),
                (
                    "author",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                        verbose_name="文章作者",
                    ),
                ),
                (
                    "categories",
                    models.ManyToManyField(
                        related_name="posts", to="blog.category", verbose_name="文章种类"
                    ),
                ),
                (
                    "tags",
                    models.ManyToManyField(
                        related_name="posts", to="blog.tag", verbose_name="文章标签"
                    ),
                ),
            ],
            options={
                "verbose_name": "文章信息",
                "verbose_name_plural": "文章信息",
            },
        ),
    ]
