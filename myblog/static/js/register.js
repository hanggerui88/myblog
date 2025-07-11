window.onload = () => {
    var btn = document.getElementsByClassName("sendCode")[0]; // 获取验证码按钮
    var emailInput = document.getElementById("register-email"); // 获取邮箱输入框

    // 注册单击事件
    btn.addEventListener('click', function () {
        var email = emailInput.value; // 获取输入框的值
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 邮箱格式正则表达式

        // 验证邮箱格式
        if (emailPattern.test(email)) {
            var time = 119;
            // 禁用按钮
            btn.disabled = true;
            // 开启定时器
            var timer = setInterval(function () {
                // 判断剩余秒数
                if (time == 0) {
                    // 清除定时器和复原按钮
                    clearInterval(timer);
                    btn.disabled = false;
                    btn.innerHTML = '发送验证码';
                } else {
                    btn.innerHTML = `${time}秒后重新获取`;
                    time--;
                }
            }, 1000);
        } else {
            alert("请输入有效的邮箱地址");
        }
    });
}
document.getElementById('jsSendCode').addEventListener('click', function () {
    var formData = new FormData(document.getElementById('registerForm'));
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/sendsms/', true);
//一定要用/sendsms/
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 400) {
            var response = JSON.parse(xhr.responseText);
            var responseDiv = document.getElementById('response');
            if (response.status === 'success') {
                responseDiv.textContent = '验证码发送成功！';
            } else {
                responseDiv.textContent = '错误: ' + response.msg;
            }
        } else {
            document.getElementById('response').textContent = '服务器错误。';
        }
    };

    xhr.onerror = function () {
        document.getElementById('response').textContent = '网络错误。';
    };

    xhr.send(formData);
});