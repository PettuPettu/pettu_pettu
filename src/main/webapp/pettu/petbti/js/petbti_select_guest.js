const savePetNameAndRedirect=()=>{
    const petName = document.getElementById("petbti-name-input").value.trim();

    if (petName) {
        sessionStorage.setItem("petName", petName);
        window.location.href = "/petbti/questions";
    } else {
        alert("이름을 입력해 주세요!");
    }
}