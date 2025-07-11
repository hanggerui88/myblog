from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.timezone import now


class UserProfile(AbstractUser):
    image = models.ImageField(verbose_name="用户头像", upload_to="head_image/%Y/%m", default="img.png")
    creation_time = models.DateTimeField(verbose_name='用户创建时间', default=now)
    likes = models.PositiveIntegerField(verbose_name="作者点赞量", default=0)

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name
