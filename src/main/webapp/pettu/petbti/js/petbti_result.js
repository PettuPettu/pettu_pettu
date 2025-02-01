import { petbtiData } from './petbti_data.js';

const petName = sessionStorage.getItem("petName");
const petMbti = sessionStorage.getItem("petMbti");

const petbtiObject = petbtiData.find(p => p.mbti === petMbti);

document.addEventListener("DOMContentLoaded", function () {

    const titlePetbti = document.querySelector(".petbti-title h1");
    const descriptionPetbti = document.querySelector(".petbti-result-explanation strong");
    const descriptionPetName = document.querySelector(".petbti-result-explanation b");

    const subTitle = document.querySelector(".petbti-result-subtitle");
    const tag = document.querySelector(".petbti-result-tag");
    const explanation = document.querySelector(".petbti-result-explanation");
    const img = document.querySelector(".petbti-result-img");

    titlePetbti.textContent = petMbti;
    descriptionPetbti.textContent = petMbti;
    descriptionPetName.textContent = petName;
    subTitle.textContent = petbtiObject.subTitle;
    img.src = petbtiObject.img;

    let tagStr = "";
    petbtiObject.tag.map(t => {
        tagStr +=`#${t} `;
    })
    tag.textContent = tagStr;

    explanation.insertAdjacentHTML("beforeend",petbtiObject.explanation );

});
