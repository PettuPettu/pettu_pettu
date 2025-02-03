import { petbtiQuestions } from './petbti_data.js';

document.addEventListener("DOMContentLoaded", function () {
    const mbtiScores = { E: 0, I: 0, S: 0, N: 0, T: 0, F: 0, J: 0, P: 0 };

    let currentQuestionIndex = 0;

    const questionTitle = document.querySelector(".petbti-title h1");
    const buttonsContainer = document.querySelector(".petbti-question-btn");
    const progressbar = document.querySelector(".petbti-progressbar");

    function updatePetMbti(mbtiType, petSeq) {
        const requestData = {
            petMbti: mbtiType,
            petSeq: petSeq,
        };

        fetch('/petbti/mbti', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json())
            .then(data => {
                console.log('반려동물 MBTI 업데이트 성공:', data);
            })
            .catch(error => {
                console.error('반려동물 MBTI 업데이트 실패:', error);
            });
    }

    function updateQuestion(questions) {
        if (currentQuestionIndex >= questions.length) {
            showResult();
            return;
        }

        const questionData = questions[currentQuestionIndex];
        questionTitle.textContent = questionData.question;

        buttonsContainer.innerHTML = "";
        questionData.options.forEach((option) => {
            const button = document.createElement("button");
            button.textContent = option.text;
            button.classList.add("petbti_btn");
            button.addEventListener("click", () => handleAnswer(option.id, questions));
            buttonsContainer.appendChild(button);
        });
    }

    function handleAnswer(optionId, questions) {
        mbtiScores[optionId]++;

        if((currentQuestionIndex/petbtiQuestions.length)*100 <= 2) {
            progressbar.style.width = "2%";
        } else {
            progressbar.style.width = `${(currentQuestionIndex/petbtiQuestions.length)*100}%`;
        }

        currentQuestionIndex++;
        updateQuestion(questions);
    }

    function showResult() {
        let mbtiType = "";
        mbtiType += mbtiScores["E"] >= mbtiScores["I"] ? "E" : "I";
        mbtiType += mbtiScores["S"] >= mbtiScores["N"] ? "S" : "N";
        mbtiType += mbtiScores["T"] >= mbtiScores["F"] ? "T" : "F";
        mbtiType += mbtiScores["J"] >= mbtiScores["P"] ? "J" : "P";

        sessionStorage.setItem("petMbti", mbtiType);
        updatePetMbti(mbtiType, sessionStorage.getItem("pSeq"));

        window.location.href = "/petbti/result";
    }

    updateQuestion(petbtiQuestions);
});