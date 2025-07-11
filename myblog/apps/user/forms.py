from django import forms
from django.core.validators import RegexValidator
from myblog.settings import REDIS_HOST, REDIS_PORT
from .models import UserProfile
import redis


class LoginForm(forms.Form):
    # passWord和view保持一致
    userName = forms.CharField(required=True, min_length=2)
    passWord = forms.CharField(required=True, min_length=3)


class RegisterForm(forms.Form):
    registerEmail = forms.EmailField(
        label="邮箱",
        max_length=255,
        widget=forms.EmailInput(attrs={'placeholder': '请输入邮箱'})
    )

    registerSmsCode = forms.CharField(
        label="短信验证码",
        max_length=6,
        min_length=6,
        widget=forms.TextInput(attrs={'placeholder': '请输入验证码'}),
        validators=[RegexValidator(r'^\d{6}$', '验证码必须是6位数字')]
    )

    registerUsername = forms.CharField(
        label="用户名",
        max_length=150,
        widget=forms.TextInput(attrs={'placeholder': '请输入用户名'})
    )

    registerPassword = forms.CharField(
        label="密码",
        widget=forms.PasswordInput(attrs={'placeholder': '请输入密码'})
    )

    registerPasswords = forms.CharField(
        label="确认密码",
        widget=forms.PasswordInput(attrs={'placeholder': '请确认密码'}),
        help_text="请确保密码与上面输入的密码一致"
    )

    def clean_mobile(self):
        registerEmail = self.data.get("registerEmail")
        # 验证手机号码是否已经注册
        users = UserProfile.objects.filter(email=registerEmail)
        if users:
            raise forms.ValidationError("该邮箱号码已注册")
        return registerEmail

    def clean_code(self):
        registerEmail = self.data.get("registerEmail")
        registerSmsCode = self.data.get("registerSmsCode")
        r = redis.Redis(host=REDIS_HOST, port=REDIS_PORT, db=0, charset="utf8", decode_responses=True)
        redis_code = r.get(str(registerEmail))
        if registerSmsCode != redis_code:
            raise forms.ValidationError("验证码不正确")

        return registerSmsCode


class SendcodeForm(forms.Form):
    registerEmail = forms.EmailField(required=True)


class UploadUserImageForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ["image"]