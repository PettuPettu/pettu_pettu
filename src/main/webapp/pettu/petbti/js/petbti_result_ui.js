import { petbtiData } from './petbti_data.js';

const petName = sessionStorage.getItem("petName");
const petMbti = sessionStorage.getItem("petMbti");

const petbtiObject = petbtiData.find(p => p.mbti === petMbti);

if (petName) {
    document.addEventListener("DOMContentLoaded", function () {

        const titlePetbti = document.querySelector(".petbti-title h1");
        const subTitle = document.querySelector(".petbti-result-subtitle");
        const tag = document.querySelector(".petbti-result-tag");
        const explanation = document.querySelector(".petbti-result-explanation");
        const img = document.querySelector(".petbti-result-img");

        titlePetbti.textContent = petMbti;
        subTitle.textContent = petbtiObject.subTitle;
        img.src = petbtiObject.img;

        let tagStr = "";
        petbtiObject.tag.map(t => {
            tagStr +=`#${t} `;
        })
        tag.textContent = tagStr;

        const explanationStart = `<strong>${petMbti}</strong> 성향을 가진 <b>${petName}</b>(는)은<br/>`;
        explanation.insertAdjacentHTML("beforeend",explanationStart );
        explanation.insertAdjacentHTML("beforeend",petbtiObject.explanation );

        sessionStorage.removeItem("petMbti");
        sessionStorage.removeItem("pSeq");
        sessionStorage.removeItem("petName");
    });
} else {
    alert("잘못된 접근입니다. 시작 페이지로 이동합니다.");
    window.location.href = "/petbti";
}

