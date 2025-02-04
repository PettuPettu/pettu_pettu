// 선택된 이미지 파일 저장 변수
let selectedReviewImage = null;
// 평점 저장 변수
let selectedStarScore = null;



$(document).ready(function() {
    $(".close").click(function() {
        resetModalData();
    });
    starEvent();
    getSpotDetailInfo();
});

function resetModalData() {
    cancelImage();  // 이미지 초기화
    resetStars();   // 별점 초기화
    closeModal();
}

function closeModal(){
    $("#commonModal").hide();
}

function resetStars() {
    const stars = $('.star');
    stars.removeClass('selected'); // 별 초기화
    selectedStarScore = null; // 별점 초기화
}

// 리뷰쓰는 가게의 정보 추가하기
function getSpotDetailInfo(){
    const spotSeq= document.getElementById('spot-detail-spotName').value;
    $("#spot-name").append(spotSeq);
}

// 파일 입력 변경 시 미리보기
document.getElementById('fileInput').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(event) {
            // 미리보기 이미지 업데이트
            document.getElementById('imagePreview').src = event.target.result;
            selectedReviewImage = file; // 선택한 파일을 저장
            document.querySelector('.image-upload-buttons').style.display = 'block'; // 업로드/취소 버튼 보이기
        };
        reader.readAsDataURL(file);
    }
});

// 이미지 업로드
function uploadImage() {

    const reviewTitle = $("#review-title-input").val();
    const reviewContents = $("#review-contents-input").val();
    const reviewScore = selectedStarScore;
    console.log("reviewScore >> "+reviewScore);

    // null 또는 빈 값 처리
    if (!reviewTitle) {
        alert("제목을 입력해주세요.");
        return; // 또는 다른 방식으로 처리
    }

    if (!reviewContents) {
        alert("내용을 입력해주세요.");
        return;
    }

    if (!reviewScore || reviewScore <= 0) {
        alert("평점을 선택해주세요.");
        return;
    }

    // 장소 시퀀스
    var spotSeq = document.getElementById('spot-detail-spotSeq').value;

    // formData 객체에 데이터 추가
    var formData = new FormData();
    formData.append("reviewTitle", reviewTitle);
    formData.append("reviewContents", reviewContents);
    formData.append("reviewScore", reviewScore);
    if (selectedReviewImage) {
        formData.append('file', selectedReviewImage);
    }
    formData.append("spotSeq", spotSeq);  // 장소 시퀀스

    // 서버로 데이터 전송
    $.ajax({
        url: "/rest/review/upload",  // 서버의 업로드 엔드포인트
        type: "POST",
        data: formData,
        processData: false, // FormData 객체를 자동으로 처리하지 않음
        contentType: false, // 콘텐츠 타입을 자동으로 설정하지 않음
        success: function(response) {
            alert("리뷰가 성공적으로 업로드되었습니다.");
            resetModalData(); // 모달 닫기
            reviewListRestAPI();
        },
        error: function(xhr, status, error) {
            // 더 구체적인 오류 확인을 위해 콘솔에 출력
            console.error('AJAX 오류:', error);
            alert("AJAX 리뷰 업로드 중 오류가 발생했습니다.");
        }
    });
}

// 이미지 취소
function cancelImage() {
    // 이미지 미리보기를 기본 이미지로 되돌림
    // 이미지 미리보기를 기본 이미지로 되돌림
    document.getElementById('imagePreview').src = '/assets/layout/github.svg';
    document.querySelector('.image-upload-buttons').style.display = 'none'; // 업로드/취소 버튼 숨기기
    selectedReviewImage = null; // 선택한 이미지 초기화

    // input 파일 요소 초기화 (이미지 선택 초기화)
    const fileInput = document.getElementById('fileInput');
    fileInput.value = '';
}


// 별 클릭 이벤트
function starEvent(){

    const star = $('.star');

    star.click(function() {
        // 클릭한 별의 점수 가져오기
        selectedStarScore = $(this).data('score');

        // 선택된 별만 색상 변경
        star.removeClass('selected');
        for (let i = 0; i < selectedStarScore; i++) {
            star.eq(i).addClass('selected');
        }

    });

}


