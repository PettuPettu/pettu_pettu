import { petbtiData } from './petbti_data.js';

let currentIndex = 0;

const animationImg = document.getElementById("animation-img");
const animationMbti = document.getElementById("animation-mbti");

function showSlide(index) {

    animationImg.src = petbtiData[index].img;
    animationMbti.textContent = petbtiData[index].mbti;
    animationMbti.style.color = petbtiData[index].color;
    animationImg.style.opacity = 1;
    animationMbti.style.opacity = 1;

    setTimeout(() => {
        animationImg.style.opacity = 0;
        animationMbti.style.opacity = 0;
    }, 3000);
}

function startSlideshow() {
    showSlide(currentIndex);

    setInterval(() => {
        currentIndex = (currentIndex + 1) % petbtiData.length;
        showSlide(currentIndex);
    }, 4000);
}

startSlideshow();