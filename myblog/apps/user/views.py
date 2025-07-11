from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from django.views.generic.base import View
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect, JsonResponse
from django.urls import reverse
from apps.user.forms import LoginForm, RegisterForm, SendcodeForm, UploadUserImageForm
from apps.user.models import UserProfile
from apps.sendcode.sendcode import send_single_sms
from apps.sendcode.randomCode import generate_random
from myblog.settings import ColaKey
from myblog.settings import REDIS_HOST, REDIS_PORT
import redis


# 有两种方式
# class base view  和 function base view
# 这里用class base view，因为class可以继承
class LoginView(View):
    # 这里要处理get和post请求
    # *args, ** kwargs  用于接收多变量
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            # 我登陆后即使再次输入/login/也无法重新登录，需要登出按钮
            return HttpResponseRedirect(reverse('index'))
        return render(request, 'login.html')

    def post(self, request, *args, **kwargs):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = login_form.cleaned_data['userName']
            user_password = login_form.cleaned_data['passWord']
            # 不能通过查询数据库，因为密码是密文，得先把获得数据加密，再判断，麻烦
            user = authenticate(username=user_name, password=user_password)
            if user is not None:
                login(request, user)
                return HttpResponseRedirect(reverse('index'))
            # 不用render，这样url也会跟着变化，不会一直在登陆页面
            else:
                # 登陆失败要返回最开始填入的信息
                return render(request, 'login.html', {"msg": "用户名或密码错误", "login_form": login_form})
        else:
            return render(request, 'login.html', {"login_form": login_form})


class LogoutView(View):
    def get(self, request, *args, **kwargs):
        logout(request)
        return HttpResponseRedirect(reverse('index'))


class SendsmsView(View):
    def post(self, request, *args, **kwargs):
        redict = {}
        Sendcode = SendcodeForm(request.POST)
        if Sendcode.is_valid():
            registerEmail = Sendcode.cleaned_data['registerEmail']
            code = generate_random(6, 0)
            re_json = send_single_sms(ColaKey, code, tomail=registerEmail)
            if re_json["code"] == 0:
                redict["status"] = "success"
                r = redis.Redis(host=REDIS_HOST, port=REDIS_PORT, db=0, charset="utf8", decode_responses=True)
                r.set(str(registerEmail), code)
                r.expire(str(registerEmail), 60 * 2)
            else:
                redict["msg"] = re_json["msg"]
        else:
            for key, value in Sendcode.errors.items():
                redict[key] = value[0]

        return JsonResponse(redict)


class RegisterView(View):
    def get(self, request, *args, **kwargs):
        return render(request, 'register.html')

    def post(self, request, *args, **kwargs):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            registerUsername = register_form.cleaned_data["registerUsername"]
            registerPassword = register_form.cleaned_data["registerPassword"]
            registerEmail = register_form.cleaned_data["registerEmail"]
            # 新建一个用户
            user = UserProfile(username=registerUsername, email=registerEmail)
            user.set_password(registerPassword)
            user.save()
            login(request, user)
            return HttpResponseRedirect(reverse("index"))
        else:
            return render(request, 'register.html', {"register_form": register_form})


class UploadUserImageView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        return render(request, 'upload_user_image.html')

    def post(self, request, *args, **kwargs):
        # 处理用户上传的头像
        image_form = UploadUserImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return JsonResponse({
                "status": "success"
            })
        else:
            return JsonResponse({
                "status": "fail"
            })
