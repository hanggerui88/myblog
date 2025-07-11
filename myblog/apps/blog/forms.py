from django import forms
from apps.blog.models import Blog


class PostForm(forms.ModelForm):
    class Meta:
        model = Blog
        fields = ["title","simple_content","content",]


class UploadBlogImageForm(forms.ModelForm):
    class Meta:
        model = Blog
        fields = ["image"]