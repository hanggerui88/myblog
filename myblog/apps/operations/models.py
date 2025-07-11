from django.db import models
from apps.user.models import UserProfile
from apps.blog.models import Blog
from django.utils.timezone import now


class CourseComments(models.Model):
    id = models.AutoField(primary_key=True)
    author = models.ForeignKey(UserProfile, verbose_name="评论的人", on_delete=models.CASCADE)
    post = models.ForeignKey(Blog, on_delete=models.CASCADE, verbose_name="评论的博客")
    content = models.TextField(verbose_name="评论内容", )
    created_at = models.DateTimeField(verbose_name="评论时间", default=now)

    class Meta:
        verbose_name = "课程评论"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.content


class UserFavorite(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE, verbose_name="用户")
    fav_id = models.IntegerField(verbose_name="数据id")
    fav_type = models.IntegerField(choices=((1, "文章"), (2, "作者")), default=1, verbose_name="收藏类型")

    class Meta:
        verbose_name = "用户点赞"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "{user}_{id}".format(user=self.user.username, id=self.fav_id)
