from django.shortcuts import render
from django.views.generic import View
from django.http import JsonResponse
from apps.operations.forms import UserFavForm, CommentsForm
from apps.operations.models import UserFavorite, CourseComments
from apps.blog.models import Blog
from apps.user.models import UserProfile


class CommentView(View):
    def post(self, request, curr_article_id, *args, **kwargs):
        """
        用户评论
        """
        if not request.user.is_authenticated:
            return JsonResponse({
                "status": "fail",
                "msg": "用户未登录"
            })

        comment_form = CommentsForm(request.POST)
        if comment_form.is_valid():
            # 必须要有is_valid才能用cleaned_data
            post = Blog.objects.get(id=curr_article_id)
            content = comment_form.cleaned_data["content"]
            # form里面 fields = [ "content"]有几个或者有几个属性，就要都获取 对应的cleaned_data
            comment = CourseComments()
            comment.author = request.user
            comment.content = content
            comment.post = post
            comment.save()

            return JsonResponse({
                "status": "success",
            })
        else:
            return JsonResponse({
                "status": "fail",
                "msg": "参数错误"
            })


class AddFavView(View):
    def get(self, request, *args, **kwargs):
        """
        获取用户收藏状态
        """
        has_fav_post = UserFavorite.objects.filter(user=request.user, fav_type=1).exists()
        has_fav_author = UserFavorite.objects.filter(user=request.user, fav_type=2).exists()

        return render(request, 'detail.html', {
            'has_fav_post': has_fav_post,
            'has_fav_author': has_fav_author
        })

    def post(self, request, *args, **kwargs):
        """
        用户收藏和取消收藏
        """
        # 先判断用户是否登录
        if not request.user.is_authenticated:
            return JsonResponse({
                "status": "fail",
                "msg": "用户未登录"
            })

        user_fav_form = UserFavForm(request.POST)
        if user_fav_form.is_valid():
            fav_id = user_fav_form.cleaned_data["fav_id"]
            fav_type = user_fav_form.cleaned_data["fav_type"]

            # 查找用户的收藏记录
            existing_fav = UserFavorite.objects.filter(user=request.user, fav_id=fav_id, fav_type=fav_type).first()

            if existing_fav:
                # 取消收藏
                existing_fav.delete()

                # 更新点赞数
                if fav_type == 1:
                    post = Blog.objects.get(id=fav_id)
                    post.likes -= 1
                    post.save()
                elif fav_type == 2:
                    user = UserProfile.objects.get(id=fav_id)
                    user.likes -= 1
                    user.save()

                return JsonResponse({
                    "status": "success",
                    "msg": "已取消点赞"
                })
            else:
                # 添加收藏
                user_fav = UserFavorite(
                    fav_id=fav_id,
                    fav_type=fav_type,
                    user=request.user
                )
                user_fav.save()

                # 更新点赞数
                if fav_type == 1:
                    post = Blog.objects.get(id=fav_id)
                    post.likes += 1
                    post.save()
                elif fav_type == 2:
                    user = UserProfile.objects.get(id=fav_id)
                    user.likes += 1
                    user.save()

                return JsonResponse({
                    "status": "success",
                    "msg": "已点赞"
                })
        else:
            return JsonResponse({
                "status": "fail",
                "msg": "参数错误"
            })
