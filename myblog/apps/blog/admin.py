from django.contrib import admin

from .models import Blog, Category, Tag


class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'created_at')
    ordering = ('-id',)
    search_fields = ('title', 'author_username',)


class CategoryAdmin(admin.ModelAdmin):
    display = 'name'
    ordering = ('-id',)
    search_fields = ('name',)


class TagAdmin(admin.ModelAdmin):
    display = 'name'
    ordering = ('-id',)
    search_fields = ('name',)


admin.site.register(Blog, PostAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(Category, CategoryAdmin)
