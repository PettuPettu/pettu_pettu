$(document).ready(function () {

    // 정렬 변경 이벤트
    $('.sort-by').on('change', function (e) {
        const sortBy = e.target.value;
        loadReviews(sortBy);
    });

    // 삭제 버튼 클릭 이벤트 (동적으로 생성된 요소에도 적용되도록 수정)
    $(document).on('click', '.delete-btn', function () {
        const reviewId = $(this).data('review-id');
        if (confirm('리뷰를 삭제하시겠습니까?')) {
            $.ajax({
                url: '/myreview/api/delete/'+reviewId,
                type: 'DELETE',
                success: function(response) {
                    alert('삭제 완료');
                    if(response.success) {
                        // 리뷰 목록 업데이트
                        updateReviewList(response.data);
                        // 평균 점수 업데이트
                        $('.review-stats span:last-child').text(
                            `평균 평점: ${response.averageScore.toFixed(1)}점`
                        );
                    } else {
                        alert('리뷰 삭제에 실패했습니다.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                    alert('리뷰 삭제에 실패했습니다.');
                }
            });
        }
    });

    // 리뷰 목록을 불러오는 함수
    function loadReviews(sortBy) {
        $.ajax({
            url: '/myreview/sort',
            type: 'GET',
            data: {
                sortBy: sortBy,
                userSeq: userSeq
    },
        success: function(response) {
            updateReviewList(response);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('리뷰 목록을 불러오는데 실패했습니다.');
        }
    });
    }

    // 날짜 형식 변환(년월일)
    function formatDate(timestamp) {
        // 타임스탬프가 밀리초 단위인지 확인하고 변환
        const date = new Date(Number(timestamp));
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        console.log(year);
        console.log(month);
        console.log(day);
        return `${year}년 ${month}월 ${day}일`;
    }


    // 리뷰 목록 업데이트 함수
    function updateReviewList(data) {

        const reviewListHtml = data.reviewReviewVOList.map(review => `
            <div class="review-card">
                <div class="review-card-header">
                    <div class="reviewer-info">
                       <div class="reviewer-image">
                            <img src="${data.myReviewFileVO?.sysName ? '/images/' + data.myReviewFileVO.sysName : 'assets/layout/logo.svg'}" 
                                 alt="${data.myReviewFileVO?.sysName ? 'Profile' : '기본 프로필'}" 
                                 width="40" 
                                 height="40">
                        </div>

                        <div class="reviewer-details">
                            <span class="reviewer-name">${data.userNickname}</span>
                            <span class="review-date">${formatDate(review.reviewCreateDate)}</span>
                        </div>
                    </div>
                    <div class="rating">
                        ${'★'.repeat(review.reviewScore)}
                    </div>
                </div>
                <div class="review-body ${review.reviewFile?.sysName ? 'has-image' : ''}">
                    ${review.reviewFile?.sysName ?
            `<img src="/images/${review.reviewFile.sysName}"
                              alt="Review Image" class="review-image">` : ''}
                    <div class="review-text-content">
                        <div class="review-title">
                            <a href="/review/detail/${review.spotSeq}"
                               class="review-title-link"
                               title="클릭하여 상세 페이지로 이동">
                                ${review.reviewTitle}
                            </a>
                        </div>
                        <div class="review-content">
                            <p>${review.reviewContents}</p>
                        </div>
                    </div>
                </div>
                <div class="review-actions">
                    <button class="delete-btn" data-review-id="${review.reviewSeq}">삭제</button>
                </div>
            </div>
        `).join('');

        // 통계 정보 업데이트
        $('.review-stats').html(`
            <span>전체 리뷰: ${data.reviewReviewVOList.length}개</span>
            <span>평균 평점: ${calculateAverageScore(data.reviewReviewVOList)}</span>
        `);

        // 리뷰 목록 업데이트
        $('.review-list').html(reviewListHtml || '<p>작성한 리뷰가 없습니다.</p>');
    }

    // 평균 평점 계산 함수
    function calculateAverageScore(reviews) {
        if (!reviews || reviews.length === 0) return '0.0';
        const sum = reviews.reduce((acc, review) => acc + review.reviewScore, 0);
        return (sum / reviews.length).toFixed(1);
    }
});
