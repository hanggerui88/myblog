from django.contrib import admin
from .models import CourseComments,UserFavorite


class CommentAdmin(admin.ModelAdmin):
    display = ['id','author','created_at','content']
    ordering = ('-id',)
    search_fields = ('post_title', 'author_username',)


class UserFavoriteAdmin(admin.ModelAdmin):
    display = ['user','created_at','fav_id','fav_type']
    ordering = ('-id',)
    search_fields = ('post_title', 'author_username',)


admin.site.register(CourseComments, CommentAdmin)
admin.site.register(UserFavorite, UserFavoriteAdmin)
