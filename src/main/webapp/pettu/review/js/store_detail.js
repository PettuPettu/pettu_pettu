$(document).ready(function() {


    document.querySelector('.place-score-div').textContent = getStars();

    createModalOpen();
    $("#test").click(function() {
        reviewListRestAPI();
    });
    reviewListRestAPI();

    $('#custom-select-box').change(function() {
        const sortOrder = $(this).val();
        reviewListRestAPI(sortOrder);
    });


});



function getStars() {
    const score = parseFloat(document.querySelector('.place-score-div').getAttribute('data-score'));

    let fullStars = Math.floor(score); // 정수 부분 (채워진 별)
    let halfStar = (score % 1) >= 0.5 ? true : false; // 반 별 체크
    let emptyStars = 5 - fullStars - (halfStar ? 1 : 0); // 빈 별 계산

    let stars = ' 평점 : ';

    // 채워진 별
    for (let i = 0; i < fullStars; i++) {
        stars += '★';  // 채워진 별 (★)
    }

    // 반 별
    if (halfStar) {
        stars += '☆';  // 반 별 (☆)
    }

    // 빈 별
    for (let i = 0; i < emptyStars; i++) {
        stars += '☆';  // 빈 별 (☆)
    }

    return stars;  // 생성된 별 문자열 반환
}




function createModalOpen() {
    $(".openModal").click(function() {
        const page = $(this).data("page");
        $("#modal-body").load(page);
        $("#commonModal").show();
    });
}

// -----------------UI 동작 관려 JS-------------------
function scrollToSecondSection() {
    const targetElement = document.getElementById("move-second-section");

    // div로 스크롤 이동
    window.scrollTo({
        top: targetElement.offsetTop - 60,
        behavior: 'smooth',
    });

}
// ------------------------------------------------

// 작성 후 review 리스트 업데이트
function reviewListRestAPI(sortOrder){
    const spotId = Number(document.getElementById('spot-detail-spotSeq').value); // Number로 변환

    $.ajax({
        url: '/rest/review/list/' + spotId,  // 서버의 API URL
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            const reviewList = response;
            const reviewGrid = $(".review-grid");
            reviewGrid.empty();  // 기존 리뷰 리스트 비우기

            if (sortOrder === 'newest') {
                reviewList.sort((a, b) => new Date(b.reviewCreateDate) - new Date(a.reviewCreateDate));
            } else if (sortOrder === 'oldest') {
                reviewList.sort((a, b) => new Date(a.reviewCreateDate) - new Date(b.reviewCreateDate));
            }
            saveReviewAfterData(reviewList);
        },
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + error);
        }
    });
}

function saveReviewAfterData(reviewList) {
     // 서버에서 받은 장소 목록
    const reviewGrid = $(".review-grid");  // 장소 리스트를 표시할 컨테이너
    reviewGrid.empty();  // 기존의 장소 리스트 비우기

    if (reviewList && reviewList.length > 0) {
        // 장소 리스트 반복하여 추가
        reviewList.forEach(function(review) {
            const reviewBox = $('<div class="review-box"></div>');
            const reviewImage = $('<div class="review-image"></div>');
            const reviewContent = $('<div class="review-content" ></div>');

            if (review.fileVO && review.fileVO.sysName) {
                const imgTag = $('<img>')
                    .attr('src', `/images/${review.fileVO.sysName}`)
                    .attr('alt', 'Review Image')
                    .css({
                        'width': 'auto',
                        'height': '140px',
                        'max-width': '100%'  // 이미지가 부모 div를 넘지 않도록
                    });
                reviewImage.append(imgTag);
            }else{
                const subImgTag = $('<img>')
                    .attr('src', `/assets/layout/github.svg`)
                    .attr('alt', 'Review Image')
                    .css({
                        'width': 'auto',
                        'height': '140px',
                        'max-width': '100%'  // 이미지가 부모 div를 넘지 않도록
                    });
                reviewImage.append(subImgTag);
            }

// 리뷰 제목
            const reviewTitle = $('<div class="review-title review-list-margin"></div>').text(review.reviewTitle);

// 리뷰 내용
            const reviewText = $('<div class="review-text review-list-margin"></div>').text(review.reviewContents);

// 리뷰 평점
            const reviewRating = $('<div class="review-rating review-list-margin">평점 : </div>');
            for (let i = 1; i <= review.reviewScore; i++) {
                reviewRating.append('★');
            }

            // 리뷰 콘텐츠에 제목, 내용, 평점 추가
            reviewContent.append(reviewTitle, reviewText, reviewRating);

            // 리뷰 박스에 이미지와 내용 추가
            reviewBox.append(reviewImage, reviewContent);

            // 리뷰 박스를 리뷰 그리드에 추가
            reviewGrid.append(reviewBox);
        });
    } else {
        // 장소가 없을 경우
        reviewGrid.append('<div>검색 결과가 없습니다.</div>');
    }
}