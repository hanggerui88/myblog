from django.contrib.auth.admin import UserAdmin
from django import forms
from .models import UserProfile
from django.contrib import admin


# admin.ModelAdmin: 用于自定义任何模型在Django admin中的展示和操作。
# UserAdmin: 专门用于管理Django的User模型，提供用户特定的功能和字段布局。
class BlogUserCreationForm(forms.ModelForm):
    password1 = forms.CharField(label='密码', widget=forms.PasswordInput)
    password2 = forms.CharField(label='密码确认', widget=forms.PasswordInput)

    class Meta:
        model = UserProfile
        fields = ('email',)


class UserAdmin1(UserAdmin):
    add_form = BlogUserCreationForm
    list_display = (
        'id',
        'username',
        'image',
        'email',
        'creation_time')
    ordering = ('-id',)


admin.site.register(UserProfile, UserAdmin1)
