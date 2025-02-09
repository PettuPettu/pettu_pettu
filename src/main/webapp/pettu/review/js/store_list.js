
$(document).ready(function() {
    spotTop3OfAJAX();
    toggleMessage();

    $('#search-type-btn').click(function() {
        spotListBySearchTypeOfAJAX();
    });

    $('#append-main-slide-section').on('click', '.main-slide-card', function() {
        sendReviewPage($(this));
    });


});

function sendReviewPage(element) {
    var storeId = element.data('store-id');
    var url = '/review/detail/' + storeId;
    window.location.href = url;
}


/*
서버에서 페이징 처리하기 API
function loadCtlData(){
    var sectionCounter = 1;
    var cardCounter = 0;

    $('#append-main-slide-section').empty();

    $('.main-slide-card').each(function(index) {
        if (cardCounter % 3 === 0) {
            if (cardCounter > 0) {
                sectionCounter++;
            }

            var newSectionHtml = `<div class="main-slide-section" id="${sectionCounter}-main-slide-section"></div>`;

            $('#append-main-slide-section').append(newSectionHtml);
        }

        $(this).appendTo(`#${sectionCounter}-main-slide-section`);

        cardCounter++;
    });
}
*/

// top3 ajax 뿌리기
function spotTop3OfAJAX(){

    $.ajax({
        url: '/rest/spot/top3',
        type: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function(data) {


            $('#top3-result-div').empty();
            successDivOfTop3API(data);
        },
        error: function(xhr, status, error) {
            alert("top3 시설 정보 출력 실패");
        }
    });
}



function spotListBySearchTypeOfAJAX(){

    if(isTagExists('검색어')){
        let searchKeywordElement = document.querySelector('.searchKeyword');
        searchKeyword = searchKeywordElement.value;
    }



    const searchType = {
        locations: selectedLocations,   // 선택된 지역
        categories: selectedCategories, // 선택된 카테고리
        searchKeyword: searchKeyword   // 입력된 검색어
    };


    $.ajax({
        url: '/rest/spot/searchSpot',
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(searchType),
        dataType: 'json',
        success: function(data) {

            
            // VO List 저장
            allItems = data || []; // 배열로 저장
            currentPage = 1; // 페이지 초기화
            renderPage(currentPage); // 페이지 렌더링
            renderPagination(); // 페이징 바

        },
        error: function(xhr, status, error) {
            alert("검색 실패");
        }
    });
}

function renderPagingSearchSpot(data){
    let sectionCounter = 1;
    let cardCounter = 0;
    const container = $('#append-main-slide-section');
    container.empty();
    $('#pagination').empty();
    if (data && data.length > 0) {
        data.forEach(function(spot, index) {
            // 3개의 카드가 추가 -> div 생성
            if (cardCounter % 3 === 0) {
                if (cardCounter > 0) {
                    sectionCounter++;
                }

                var newSectionHtml = `<div class="main-slide-section" id="${sectionCounter}-main-slide-section"></div>`;

                $('#append-main-slide-section').append(newSectionHtml);
            }

            renderSpotCard(spot, sectionCounter);
            cardCounter++;
        });
    }
}

// 시설 정보 카드
function renderSpotCard(spot,sectionCounter) {
    var cardHtml = `
       <div class="main-slide-card" data-store-id="${spot.spotSeq}">
        <!-- 이미지가 null일 경우 기본 이미지로 대체 -->
        <img src="${spot.spotPicture != null && spot.spotPicture != '' ? spot.spotPicture : '/assets/layout/logo.svg'}" alt="${spot.spotName} 이미지">
        
        <div class="main-slide-card-desc">
            <div class="spot-card-category"><span>#${spot.categoryName}</span></div>
            <div class="main-card-content-div">
                <!-- spotName이 null일 경우 '정보 없음' 표시 -->
                <div>${spot.spotName != null ? spot.spotName : '정보 없음'}</div>
                <div class="main-slide-card-title">
                    <strong>${spot.spotLocation != null ? spot.spotLocation : '정보 없음'}</strong>
                </div>
                <div class="main-slide-card-info">
                    <strong>평점 ${spot.spotTotalAvgScore != null ? spot.spotTotalAvgScore : '정보 없음'}</strong>
                    <span></span> 
                </div>
            </div>
        </div>
    </div>

    `;
    $('#'+sectionCounter + '-main-slide-section').append(cardHtml);
}

//Top3 API 화면 출력 함수
function successDivOfTop3API(data){


    var categoryMap = {
        12: '관광지',
        14: '문화시설',
        15: '축제공연행사',
        28: '레포츠',
        32: '숙박',
        38: '쇼핑',
        39: '음식점'
    };

    if (data && data.length > 0) {
        data.forEach(function(item) {


            var slideCard = $('<div class="slide-card card-flex"></div>');

            var imgSrc = item.spotPicture || '/assets/layout/default.jpg';
            slideCard.append('<div class="top-img-contents"><img src="' + imgSrc + '" alt="카드 이미지" ></div>');

            // 정보
            var spotName = item.spotName || '시설명 없음';
            var spotLocation = item.spotLocation ? item.spotLocation : '위치 정보 없음'; // 첫 번째 리뷰 내용
            var avgScore = item.spotTotalAvgScore > 0 ? item.spotTotalAvgScore : '0';  // 별점 기본값 0
            var reviewMonthly = item.reviewMonthlyCnt || 0;
            var reviewTotal = item.reviewTotalCnt || 0;

            // 카테고리 한글 Mapping
            var category = categoryMap[item.categorySeq] || '기타';

            var infoContents = $('<div class="top-info-contents"></div>');
            infoContents.append('<div class="top1"><div class="category-tag">' + category + '</div></div>');
            infoContents.append('<div class="top2"><div class="spot-name">' + spotName + '</div>');
            infoContents.append('<div class="spot-location">' + spotLocation + '</div>');
            infoContents.append('<div class="avg-score">별점 ' + avgScore + '점</div>');
            infoContents.append('<div class="review-info"><strong>리뷰 : </strong> 저번달 ' + reviewMonthly + '개 / 총 ' + reviewTotal + '개</div></div>');

            slideCard.append(infoContents);

            $('#top3-result-div').append(slideCard);
        });
    }
}


/*--------------------------------------- UI를 위한 js ---------------------------------------*/
function toggleDropdown(event) {
    // 드롭다운 하나만 열기 (다른 드롭다운 닫기)
    document.querySelectorAll('.dropdown.open').forEach(openDropdown => {
        openDropdown.classList.remove('open');
    });
    
    // 드롭다운열기
    const dropdown = event.target.closest('.dropdown');
    dropdown.classList.toggle('open');
}

// 바깥 영역 클릭시 드롭다운 닫기
document.addEventListener('click', function(event) {
    if (!event.target.closest('.dropdown')) {
        document.querySelectorAll('.dropdown.open').forEach(openDropdown => {
            openDropdown.classList.remove('open');
        });

    }
});

/*------------------------------ [sever] 검색 tag 배열 관련 함수들 --------------------- */
// 지역 검색 항목 선택된 값들
let selectedLocations = [];

// 카테고리 검색 항목 선택된 값들
let selectedCategories = [];

let searchKeyword = '';

// 검색 관련 항목(배열) 관리 함수
function checkedBoxAddList(checkbox,value) {

    if (checkbox.classList.contains('locationType')) {
        selectedLocations.push(value);
    } else if (checkbox.classList.contains('categoryType')) {
        selectedCategories.push(value);
    }
}

function checkedBoxRemoveList(realClass,value) {

    if (realClass === 'locationType') {
        selectedLocations = selectedLocations.filter(item => item !== value);
    } else if (realClass === 'categoryType') {
        selectedCategories = selectedCategories.filter(item => item !== value);
    } else if(realClass === "searchKeyword"){
        searchKeyword = '';
    }

}


/* -------------------------- [ css / js ] 검색 tag 관련 함수들----------------------------- */

// check 박스 라벨 생성/삭제 하기
function handleCheckboxChange(event) {
    const checkbox = event.target;
    // 분류코드 : value 값 가져오기
    const value = checkbox.value;

    // 분류 : class 값 가져오기 (위치/카테고리)
    const classType = checkbox.className;

    // 한글명 출력 : 라벨의 text 값 가져오기
    const label = checkbox.closest('label');
    const categoryText = label.textContent.trim();

    if (checkbox.checked) {
        addTag(categoryText, value, classType);
        checkedBoxAddList(checkbox,value);
    } else {
        removeTag(categoryText, value);
        checkedBoxRemoveList(classType,value);
    }
    // 태그 없을경우 메세지 띄우기
    toggleMessage();

}


// 검색어 라벨 생성/삭제하기
function findSpotName(){

        const inputText = document.getElementById('search-input').value;

        const categoryText = '검색어';
        if (isTagExists(categoryText)) {
            removeTag(categoryText);
        }

        if (inputText) {
            toggleMessage();
            addTag(inputText,'검색어');
            document.getElementById('search-input').value = '';
        } else {
            alert('검색어를 입력하세요!');
        }

}


// 검색어 tag 존재 여부
function isTagExists(categoryText) {
    const tagContainer = document.querySelector('.tags');

    // 검색어 태그를 찾기
    if (tagContainer) {
        return Array.from(tagContainer.children).some(tag => tag.textContent.includes(categoryText));
    }

}



// 태그 생성하기
function addTag(categoryText, realValue, classType) {
    const tagContainer = document.querySelector('.tags');
    const newTag = document.createElement('div');
    newTag.className = 'tag';

    if (realValue === '검색어') {
        // 시설명 검색일 경우
        newTag.innerHTML = `#${realValue} >> ${categoryText} <span onclick="clickRemoveTag(event)">✕</span><input id="searchSpotName" class="searchKeyword" type="hidden" value="${categoryText}">`;
    } else {
        // select 박스일 경우
        newTag.innerHTML = `#${categoryText} <span onclick="clickRemoveTag(event)">✕</span><input id="searchSelectBox" class="${classType}" type="hidden" value="${realValue}">`;
    }

    tagContainer.appendChild(newTag);
}

// 태그 삭제하기
function removeTag(categoryText) {

    const tagContainer = document.querySelector('.tags');
    const existingTag = Array.from(tagContainer.children).find(tag =>
        tag.textContent.trim().startsWith(`#`+ categoryText)
    );
    if (existingTag) {
        existingTag.remove();
    }
}


// 태그 없을시 상태 메세지 함수
function toggleMessage() {
    const message = document.querySelector('#tag-message');
    const tagContainer = document.querySelector('.tags');

    if (tagContainer.children.length === 0) {
        if (!message) {
            const messageDiv = document.createElement('div');
            messageDiv.id = 'tag-message';
            messageDiv.textContent = '검색 조건을 설정해주세요';
            messageDiv.style.lineHeight = '100px';
            messageDiv.style.height = '100%';

            // tagContainer 중앙 div 정렬
            tagContainer.classList.add('center-style');
            // messageDiv 중앙 글자 정렬
            messageDiv.classList.add('message-style');

            tagContainer.appendChild(messageDiv);
        }
    } else {
        if (message) {
            message.remove();
            message.classList.add('message-style');
        }
        tagContainer.classList.remove('center-style');
    }
}


// 태그 삭제 함수
function clickRemoveTag(event) {
    const tag = event.target.closest('.tag');

    if (tag) {
        const hiddenInput = tag.querySelector('input[type="hidden"]');
        if (hiddenInput) {
            const realValue = hiddenInput.value; 
            const realClass = hiddenInput.className; 


            const checkbox = document.querySelector(`input[type="checkbox"][value="${realValue}"]`);

            if (checkbox) {
                checkedBoxRemoveList(realClass, realValue);
                checkbox.checked = false;  

            }else{
                checkedBoxRemoveList(realClass, realValue);
            }
        }
        tag.remove();
    }

    // 메시지 업데이트
    toggleMessage();

}