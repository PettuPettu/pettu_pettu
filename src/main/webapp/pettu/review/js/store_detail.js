$(document).ready(function() {


    document.querySelector('.place-score-div').textContent = getStars();

    createModalOpen();
    reviewListRestAPI();

    $('#custom-select-box').change(function() {
        const sortOrder = $(this).val();
        reviewListRestAPI(sortOrder);
    });


});



function getStars() {
    const score = parseFloat(document.querySelector('.place-score-div').getAttribute('data-score'));

    let fullStars = Math.floor(score); // 정수 부분 (채워진 별)
    let halfStar = (score % 1) >= 0.5 ? true : false;
    let emptyStars = 5 - fullStars - (halfStar ? 1 : 0);

    let stars = '총 평점 : ';

    // 채워진 별
    for (let i = 0; i < fullStars; i++) {
        stars += '★';
    }

    // 반 별
    if (halfStar) {
        stars += '☆';
    }

    // 빈 별
    for (let i = 0; i < emptyStars; i++) {
        stars += '☆';
    }
    stars += ' [ ' + score + ' 점 ]'
    return stars;
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
        url: '/rest/review/list/' + spotId,
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            const reviewList = response;
            const reviewGrid = $(".review-grid");
            reviewGrid.empty();

            if (sortOrder === 'newest') {
                reviewList.sort((a, b) => new Date(b.reviewCreateDate) - new Date(a.reviewCreateDate));
            } else if (sortOrder === 'oldest') {
                reviewList.sort((a, b) => new Date(a.reviewCreateDate) - new Date(b.reviewCreateDate));
            }
            saveReviewAfterData(reviewList);
        },
        error: function(xhr, status, error) {
            alert("리뷰 불러오기 실패");
        }
    });
}

function saveReviewAfterData(reviewList) {

    const reviewGrid = $(".review-grid");
    reviewGrid.empty();

    if (reviewList && reviewList.length > 0) {

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
                        'max-width': '100%'
                    });
                reviewImage.append(imgTag);
            }else{
                const subImgTag = $('<img>')
                    .attr('src', `/assets/layout/github.svg`)
                    .attr('alt', 'Review Image')
                    .css({
                        'width': 'auto',
                        'height': '140px',
                        'max-width': '100%'
                    });
                reviewImage.append(subImgTag);
            }


            const reviewTitle = $('<div class="review-title review-list-margin"></div>').text(review.reviewTitle);

            const reviewText = $('<div class="review-text review-list-margin"></div>').text(review.reviewContents);


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