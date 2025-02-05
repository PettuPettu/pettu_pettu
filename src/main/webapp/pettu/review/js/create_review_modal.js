$(document).ready(function() {
    $(".close").click(function() {
        resetModalData();
    });

    $("#uploadImageBtn").on('click', function() {
        const starScoreObject = getSelectedStarScore();
        const selectedStarScore = starScoreObject.selectedStarScore;
        const file = document.getElementById('fileInput').files[0];

        console.log(selectedStarScore +  "file  >>> " +  file);
        uploadImage(file,selectedStarScore)
    });
    changeStarEvent();
    getSpotDetailInfo();
});

function resetModalData() {
    cancelImage();
    resetStars();
    closeModal();
}

function closeModal(){
    $("#commonModal").hide();
    $("#imagePreview").attr('src', '/assets/layout/github.svg');
    $(".image-upload-buttons").hide();
}


// 별점 초기화
function resetStars() {
    const stars = $('.star');
    stars.removeClass('selected');
}

// 리뷰쓰는 가게의 정보 추가하기
function getSpotDetailInfo(){
    const spotSeq = document.getElementById('spot-detail-spotName').value;
    $("#spot-name").append(spotSeq);
}

// 파일 입력 변경 시 미리보기
document.getElementById('fileInput').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(event) {
            updateImagePreview(event.target.result, file);
        };
        reader.readAsDataURL(file);
    }
});

// 이미지 미리보기 업데이트
function updateImagePreview(imageSrc, file) {
    document.getElementById('imagePreview').src = imageSrc;
    document.querySelector('.image-upload-buttons').style.display = 'block';

}



// 이미지 업로드
function uploadImage(selectedReviewImage, selectedStarScore) {

    const reviewTitle = $("#review-title-input").val();
    const reviewContents = $("#review-contents-input").val();


    if (!reviewTitle) {
        alert("제목을 입력해주세요.");
        return; // 또는 다른 방식으로 처리
    }

    if (!reviewContents) {
        alert("내용을 입력해주세요.");
        return;
    }

    if (!selectedStarScore || selectedStarScore <= 0) {
        alert("평점을 선택해주세요.");
        return;
    }


    var spotSeq = document.getElementById('spot-detail-spotSeq').value;


    var formData = new FormData();
    formData.append("reviewTitle", reviewTitle);
    formData.append("reviewContents", reviewContents);
    formData.append("reviewScore", selectedStarScore);
    if (selectedReviewImage) {
        formData.append('file', selectedReviewImage);
    }
    formData.append("spotSeq", spotSeq);

    for (let [key, value] of formData.entries()) {
        console.log(key + ": " + value);
    }
    // 서버로 데이터 전송
    $.ajax({
        url: "/rest/review/upload",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            alert("리뷰가 업로드되었습니다.");
            resetModalData();
            reviewListRestAPI();
        },
        error: function(xhr, status, error) {
            console.error('AJAX 오류:', error);
        }
    });
}

// 이미지 취소
function cancelImage() {

    document.getElementById('imagePreview').src = '/assets/layout/github.svg';
    document.querySelector('.image-upload-buttons').style.display = 'none';


    const fileInput = document.getElementById('fileInput');
    fileInput.value = '';

}

// 별 클릭 이벤트
function changeStarEvent() {
    const stars = $('.star');
    let selectedStarScore = null;

    stars.click(function() {
        selectedStarScore = $(this).data('score');


        stars.removeClass('selected');
        for (let i = 0; i < selectedStarScore; i++) {
            stars.eq(i).addClass('selected');
        }
    });
}

function getSelectedStarScore() {
    const stars = $('.star');
    let selectedStarScore = null;


    stars.each(function() {
        if ($(this).hasClass('selected')) {
            selectedStarScore = $(this).data('score');
        }
    });

    return { selectedStarScore: selectedStarScore }; // 객체 형태로 반환
}

