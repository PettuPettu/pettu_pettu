let allItems = [];  // 모든 아이템을 담을 배열
let pageSize = 9;   // 한 페이지에 3개 항목만 표시
let currentPage = 1; // 현재 페이지
let pageGroupSize = 3; // 페이지 그룹 크기 (예: 1, 2, 3 -> 4, 5, 6)



$(document).ready(function() {

});


// 페이지 렌더링
function renderPage(page) {
    const startIdx = (page - 1) * pageSize;
    const endIdx = startIdx + pageSize;
    // 현재 페이지 데이터 추출
    const itemsToShow = allItems.slice(startIdx, endIdx);

    const container = $('#append-main-slide-section');
    container.empty();

    if (itemsToShow.length === 0) {
        container.html('<div>검색 결과가 없습니다.</div>');
        container.addClass('spot-list-text-center');
        container.addClass('append-main-slide-section');
    } else {
        container.removeClass('append-main-slide-section');
        container.removeClass('spot-list-text-center');
        renderPagingSearchSpot(itemsToShow);
    }

}

// 페이지네이션 UI 렌더링
function renderPagination() {
    // 총 페이지 수 계산
    const totalPages = Math.ceil(allItems.length / pageSize);
    // 기존 페이징 바 지우기
    const paginationContainer = $('#pagination');
    paginationContainer.empty();
    // 현재 페이지 그룹 계산
    const currentPageGroup = Math.floor((currentPage - 1) / pageGroupSize);
    // 페이지 그룹의 첫 번째 페이지
    const startPage = currentPageGroup * pageGroupSize + 1;
    // 페이지 그룹의 마지막 페이지
    const endPage = Math.min(startPage + pageGroupSize - 1, totalPages);

    // 이전 버튼
    const prevButton = $(`<a href="#" class="prev">«</a>`);
    if (currentPageGroup > 0) {
        prevButton.on('click', function(event) {
            event.preventDefault();
            currentPage = startPage - 1;
            renderPage(currentPage);
            renderPagination();

        });
    } else {
        prevButton.addClass('disabled');
        prevButton.hide();

    }
    paginationContainer.append(prevButton);

    // 페이지 바 목록
    for (let i = startPage; i <= endPage; i++) {
        const pageLink = $(`<a href="#">${i}</a>`);
        if (i === currentPage) {
            pageLink.addClass('active');
        }
        pageLink.on('click', function(event) {
            event.preventDefault();
            currentPage = i;
            renderPage(currentPage);
            renderPagination();
        });
        paginationContainer.append(pageLink);
    }

    // 다음 버튼
    const nextButton = $(`<a href="#" class="next">»</a>`);

    if (endPage < totalPages) {
        nextButton.on('click', function(event) {
            event.preventDefault();
            currentPage = endPage + 1;
            renderPage(currentPage);
            renderPagination();
        });
        paginationContainer.append(nextButton);
    } else {
        nextButton.addClass('disabled');
        nextButton.hide();
    }
}




