from django.db import models
from apps.user.models import UserProfile


class Category(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(verbose_name="种类名", max_length=100)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "种类信息"
        verbose_name_plural = verbose_name


class Tag(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(verbose_name="标签名", max_length=100)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "标签信息"
        verbose_name_plural = verbose_name


class Blog(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(verbose_name="文章题目", max_length=200)
    content = models.TextField(verbose_name="文章内容", max_length=1000)
    simple_content = models.TextField(verbose_name="文章简介", max_length=1000, default="")
    image = models.ImageField(verbose_name="博客封面图片", upload_to="post_image/%Y/%m", default="blog.png")
    author = models.ForeignKey(UserProfile, verbose_name="文章作者", on_delete=models.CASCADE)
    categories = models.ManyToManyField(Category, verbose_name="文章种类", related_name='posts')
    tags = models.ManyToManyField(Tag, verbose_name="文章标签", related_name='posts')
    created_at = models.DateTimeField(verbose_name="文章创建时间", auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name="文章更新时间", auto_now=True)
    likes = models.PositiveIntegerField(verbose_name="文章点赞量", default=0)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "文章信息"
        verbose_name_plural = verbose_name
