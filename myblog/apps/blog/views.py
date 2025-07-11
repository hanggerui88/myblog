from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404
from django.views.generic.base import View
from apps.blog.models import Blog, Category, Tag
from apps.blog.forms import PostForm, UploadBlogImageForm
from pure_pagination import Paginator, PageNotAnInteger

from apps.operations.models import CourseComments


class IndexView(View):
    def get(self, request, *args, **kwargs):

        hot_post = Blog.objects.order_by("-likes")[:5]
        post = Blog.objects.all().order_by("-id")

        # 分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(post, per_page=4, request=request)

        posts = p.page(page)

        return render(request, "index.html", {
            "posts": posts,
            "hot_post": hot_post,
        })


class DetailView(View):
    def get(self, request, article_id, *args, **kwargs):
        all_article = Blog.objects.all().order_by("-id")

        curr_article = None
        previous_article = None
        next_article = None

        for index, article in enumerate(all_article):
            if index == 0:
                previous_index = 0
                next_index = index + 1
            elif index == len(all_article) - 1:
                previous_index = index - 1
                next_index = index
            else:
                previous_index = index - 1
                next_index = index + 1
            if article.id == article_id:
                curr_article = article
                previous_article = all_article[previous_index]
                next_article = all_article[next_index]
                break
        # 评论
        comments = CourseComments.objects.filter(post=curr_article)
        return render(request, 'detail.html', {
            'curr_article': curr_article,
            'previous_article': previous_article,
            'next_article': next_article,
            "comments": comments
        })


class UserDetailView(View):
    #会从userpost自己跳转到post,列表不是永久变量，更新就不行了
    def get(self, request, *args, **kwargs):
        article_id = kwargs.get('article_id')
        curr_article = get_object_or_404(Blog, id=article_id, author=request.user)
        all_articles = Blog.objects.filter(author=request.user).order_by("-id")
        article_ids = list(all_articles.values_list('id', flat=True))

        try:
            curr_index = article_ids.index(curr_article.id)
        except ValueError:
            curr_index = None

        # 初始化前一篇和后一篇文章
        previous_article = None
        next_article = None

        # 确保前一篇和后一篇文章索引不越界
        if curr_index is not None:
            if curr_index == 0:
                # 如果是第一个文章，前一篇文章的索引和当前索引相同
                previous_article_id = article_ids[curr_index]
                previous_article = all_articles.get(id=previous_article_id)
                next_article_id = article_ids[curr_index + 1]
                next_article = all_articles.get(id=next_article_id)
            elif curr_index == len(article_ids) - 1:
                # 如果是最后一个文章，下一篇文章的索引和当前索引相同
                next_article_id = article_ids[curr_index]
                next_article = all_articles.get(id=next_article_id)
                previous_article_id = article_ids[curr_index - 1]
                previous_article = all_articles.get(id=previous_article_id)
            else:
                previous_article_id = article_ids[curr_index - 1]
                previous_article = all_articles.get(id=previous_article_id)
                next_article_id = article_ids[curr_index + 1]
                next_article = all_articles.get(id=next_article_id)
        return render(request, 'user_detail.html', {
            'curr_article': curr_article,
            'previous_article': previous_article,
            'next_article': next_article
        })


class ArchivesView(View):
    def get(self, request, *args, **kwargs):
        # 基本查询集
        all_articles = Blog.objects.filter(author=request.user).order_by("-id")
        all_categories = Category.objects.all()
        all_tags = Tag.objects.all()

        # 获取 URL 参数
        category_id = request.GET.get("category", "")
        tag_id = request.GET.get("tag", "")
        sort = request.GET.get("sort", "")

        # 分类筛选
        if category_id:
            try:
                category = Category.objects.get(id=category_id)
                all_articles = all_articles.filter(categories=category)
                category_id = int(category_id)
            except Category.DoesNotExist:
                pass

        # 标签筛选
        if tag_id:
            try:
                tag = Tag.objects.get(id=tag_id)
                all_articles = all_articles.filter(tags=tag)
                tag_id = int(tag_id)
            except Tag.DoesNotExist:
                pass

        # 排序
        if sort == "likes":
            all_articles = all_articles.order_by("-likes")
        elif sort == "id":
            all_articles = all_articles.order_by("-id")

        # 分页
        page = request.GET.get('page', 1)
        paginator = Paginator(all_articles, per_page=4)
        try:
            posts = paginator.page(page)
        except PageNotAnInteger:
            posts = paginator.page(1)

        # 返回渲染上下文
        return render(request, "archives.html", {
            "posts": posts,
            "all_articles": all_articles,  # 不需要在模板中使用这个变量，已由 posts 替代
            "all_tags": all_tags,
            "all_categories": all_categories,
            "category_id": category_id,  # 用于模板中分类的高亮显示
            "tag_id": tag_id,  # 用于模板中标签的高亮显示
            "sort": sort,  # 用于模板中排序的高亮显示
        })


class WritesView(View):
    def get(self, request, *args, **kwargs):
        return render(request, 'write.html')

    def post(self, request, *args, **kwargs):
        postform = PostForm(request.POST)
        if postform.is_valid():
            title = postform.cleaned_data["title"]
            simple_content = postform.cleaned_data["simple_content"]
            content = postform.cleaned_data["content"]
            post = Blog(title=title, content=content, author=request.user, simple_content=simple_content)
            post.save()
            return JsonResponse({"status": "success"})
        else:
            return JsonResponse({"status": "fail"})


class UploadBlogImageView(LoginRequiredMixin, View):
    def get(self, request, blog_id, *args, **kwargs):
        return render(request, 'upload_blog_image.html', {
            "blog_id": blog_id,
        })

    def post(self, request, blog_id, *args, **kwargs):
        blog_instance = Blog.objects.get(id=blog_id)
        image_form = UploadBlogImageForm(request.POST, request.FILES, instance=blog_instance)
        if image_form.is_valid():
            image_form.save()
            return JsonResponse({
                "status": "success"
            })
        else:
            return JsonResponse({
                "status": "fail"
            })
