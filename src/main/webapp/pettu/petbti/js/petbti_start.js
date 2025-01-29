import { petbtiData } from './petbti_data.js';

let currentIndex = 0; // 현재 보여지는 이미지 인덱스

// HTML 요소 선택
const animationImg = document.getElementById("animation-img");
const animationMbti = document.getElementById("animation-mbti");

// 슬라이드 전환 함수
function showSlide(index) {
    // 현재 이미지와 텍스트 설정
    animationImg.img = petbtiData[index].img;
    animationMbti.textContent = petbtiData[index].mbti;

    // 페이드 인 효과
    animationImg.style.opacity = 1;
    animationMbti.style.opacity = 1;

    // 일정 시간 후 페이드 아웃
    setTimeout(() => {
        animationImg.style.opacity = 0;
        animationMbti.style.opacity = 0;
    }, 3000); // 3초 후 페이드 아웃
}

// 슬라이드 자동 재생
function startSlideshow() {
    showSlide(currentIndex);

    setInterval(() => {
        currentIndex = (currentIndex + 1) % petbtiData.length; // 다음 인덱스로 이동
        showSlide(currentIndex);
    }, 4000); // 4초마다 슬라이드 전환
}

// 슬라이드쇼 시작
startSlideshow();