function checkWidth() {
    const postImage = document.querySelector('.post-image');
    if (window.innerWidth < 1200) {
        postImage.innerHTML = '';
    } else {
        postImage.innerHTML = '<img src="../static/pic/avatar.jpg" alt="博客封面图片">';
    }
}

checkWidth();
window.addEventListener('resize', checkWidth);