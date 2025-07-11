"""
URL configuration for myblog project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from apps.blog.views import IndexView, ArchivesView, WritesView, UploadBlogImageView, UserDetailView, DetailView
from django.urls import path
from apps.user.views import LoginView, LogoutView, RegisterView, SendsmsView, UploadUserImageView
from django.views.decorators.csrf import csrf_exempt
from django.views.static import serve
from myblog.settings import MEDIA_ROOT
from apps.operations.views import AddFavView, CommentView

urlpatterns = [
    path("admin/", admin.site.urls),
    path('', IndexView.as_view(), name='index'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('sendsms/', csrf_exempt(SendsmsView.as_view()), name='send_sms'),
    path('register/', RegisterView.as_view(), name='register'),
    path('post/<int:article_id>/', DetailView.as_view(), name='to_detail'),
    path('userpost/<int:article_id>/', UserDetailView.as_view(), name='user_detail'),
    path('archives/', ArchivesView.as_view(), name='archives'),
    path('writes/', WritesView.as_view(), name='writes'),

    path('upload_blog_image/<int:blog_id>/', UploadBlogImageView.as_view(), name='upload_blog_image'),
    path('upload_user_image/', UploadUserImageView.as_view(), name='upload_user_image'),
    path('media/<path:path>/', serve, {'document_root': MEDIA_ROOT}),

    path('fav/', AddFavView.as_view(), name="fav"),
    path('comment/<int:curr_article_id>/', CommentView.as_view(), name="comment"),
]
