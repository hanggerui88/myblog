document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('#js-pub-container form');
    form.addEventListener('submit', function (event) {
        event.preventDefault(); // 防止表单的默认提交行为

        const formData = new FormData(form);
        const csrfToken = document.querySelector('[name="csrfmiddlewaretoken"]').value;

        fetch(form.action, {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest', // 确保请求标记为 AJAX
                'X-CSRFToken': csrfToken // 包含 CSRF token
            }
        })
            .then(response => response.json())
            .then(data => {
                const errorElement = document.querySelector('.vjs-global-error');
                if (data.status === 'success') {
                    // 清空评论框和错误提示
                    document.getElementById('js-pl-textarea').value = '';
                    errorElement.textContent = '';
                    alert('评论提交成功');
                } else {
                    // 显示错误信息
                    errorElement.textContent = data.msg;
                }
            })
            .catch(error => {
                console.error('提交评论时出错:', error);
                document.querySelector('.vjs-global-error').textContent = '提交评论时出错';
            });
    });
});