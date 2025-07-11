document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('form');

    form.addEventListener('submit', function (event) {
        event.preventDefault(); // 阻止表单默认提交

        const formData = new FormData(form); // 创建 FormData 对象

        fetch(form.action, {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest', // 指明这是 AJAX 请求
                'X-CSRFToken': getCookie('csrftoken') // 获取 CSRF 令牌
            }
        })
        .then(response => response.json()) // 将响应解析为 JSON
        .then(data => {
            if (data.status === 'success') {
                alert('上传成功！'); // 提示上传成功
                // 刷新或更新页面中的图片
                // location.reload(); // 可以选择刷新页面
            } else {
                alert('上传失败，请重试。'); // 提示上传失败
            }
        })
        .catch(error => {
            console.error('错误:', error); // 捕获并打印错误
            alert('发生错误，请稍后再试。'); // 提示用户错误
        });
    });

    // 获取 CSRF 令牌的函数
    function getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                // 检查 cookie 是否以指定名称开头
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
});
