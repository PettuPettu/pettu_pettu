const selectedPetAndRedirect= ()=> {
    const selectedPet = document.querySelector('article.petbti-select-card-fragment[data-select="true"]');

    if (selectedPet) {
        const pSeq = selectedPet.querySelector('.petbti-select-card-pseq').textContent;
        const petName = selectedPet.querySelector('.petbti-select-card-name').textContent;
        sessionStorage.setItem("petName", petName);
        sessionStorage.setItem("pSeq", pSeq);
        window.location.href = "/petbti/questions";
    } else {
        alert("반려동물을 선택해주세요!");
    }
}