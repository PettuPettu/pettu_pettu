const heroButtons = [
    {
        text: "반려동물 용품 최저가 확인하기",
        desc: "네이버 쇼핑 반려동물 상품의<br id=\"hero-responsive-br\"/>가격변동을 확인해서<br/>최저가 및 할인 정보를 알려드려요",
    },
    {
        text: "반려동물 동반 시설 찾기",
        desc: "우리 아이와 같이 갈 수 있는<br id=\"hero-responsive-br\"/>카페, 편의시설,<br/>맛집 정보와 리뷰를 알려드려요",
    },
    {
        text: "펫BTI 확인해보기",
        desc: "동물에게 맞춘 질문지로 우리 아이의<br/>MBTI를 확인해봐요",
    },
];

function renderHeroButtons(buttons) {
    const container = document.getElementById("hero-desc-btn");
    container.innerHTML = "";

    buttons.map((button, index) => {
        const fragment = document.createElement("div");
        fragment.classList.add("hero-btn-fragment");
        if(index === 0){
            fragment.innerHTML = `
              <button class="hero-btn" data-active="true">${button.text}</button>
              <span class="hero-span" data-active="true">${button.desc}</span>
            `;
        } else {
            fragment.innerHTML = `
              <button class="hero-btn" data-active="false">${button.text}</button>
              <span class="hero-span" data-active="false">${button.desc}</span>
            `;
        }
        container.appendChild(fragment);
    });
}

document.addEventListener("DOMContentLoaded", () => renderHeroButtons(heroButtons));