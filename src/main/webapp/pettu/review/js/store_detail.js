function scrollToSecondSection() {
    const targetElement = document.getElementById("move-second-section");

        // 해당 div로 부드럽게 스크롤 이동
    window.scrollTo({
        top: targetElement.offsetTop - 60,
        behavior: 'smooth', // 부드럽게 스크롤
        // 스크롤을 해당 요소의 상단으로 맞춤
    });
}
