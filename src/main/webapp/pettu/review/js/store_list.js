
$(document).ready(function() {
    spotTop3OfAJAX();
    toggleMessage();

    $('#search-type-btn').click(function() {
        spotListBySearchTypeOfAJAX();
    });

});

// top3 ajax 뿌리기
function spotTop3OfAJAX(){

    $.ajax({
        url: '/rest/spot/top3',
        type: 'GET',
        contentType: 'application/json',
        dataType: 'json',
        success: function(data) {
            successDivOfTop3API(data);
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 실패:", error);
        }
    });
}

function spotListBySearchTypeOfAJAX(){

    if(isTagExists('검색어')){
        let searchKeywordElement = document.querySelector('.searchKeyword');
        // value 값 읽기
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

            console.log("AJAX 요청 성공:"+data);
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 실패:", error);
        }
    });
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
            slideCard.append('<div class="top-img-contents"><img src="' + imgSrc + '" alt="카드 이미지"></div>');

            // 정보
            var spotName = item.spotName || '시설명 없음';
            var spotLocation = item.spotLocation ? item.spotLocation : '위치 정보 없음'; // 첫 번째 리뷰 내용
            var avgScore = item.spotTotalAvgScore > 0 ? item.spotTotalAvgScore : '0';  // 별점 기본값 0
            var reviewMonthly = item.reviewMonthlyCnt || 0;
            var reviewTotal = item.reviewTotalCnt || 0;
            // 카테고리 한글 Mapping
            var category = categoryMap[item.categorySeq] || '기타';

            var infoContents = $('<div class="top-info-contents"></div>');
            infoContents.append('<div>' + spotName + '</div>');
            infoContents.append('<div> <strong>위치</strong> : <br>' + spotLocation + '</div>');
            infoContents.append('<div>별점 ' + avgScore + '점</div>');
            infoContents.append('<div><strong>총 리뷰 수</strong><br>  이번달 ' + reviewMonthly + '개 / 총 ' + reviewTotal + '개</div>');
            infoContents.append('<div>카테고리 : ' + category + '</div>');

            // 슬라이드 카드에 정보 추가
            slideCard.append(infoContents);

            // 카드 목록에 추가 (예: .card-container에 넣기)
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
    /*
        alert("value" + value + " / " + "categoryText:"+ categoryText);
    */
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
            console.log('검색어 태그가 이미 존재합니다.');
            removeTag(categoryText);
        } else {
            console.log('검색어 태그가 존재하지 않습니다.');
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
    let tagExists= Array.from(tagContainer.children).some(tag => tag.textContent.includes(categoryText));

    // T / F
    return tagExists;
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

            // 해당 realValue 값을 가진 체크박스를 찾음
            const checkbox = document.querySelector(`input[type="checkbox"][value="${realValue}"]`);

            if (checkbox) {
                //alert("zzzzclickRemoveTag >>> " + realClass + realValue + "hiddenInput.value >>> " + hiddenInput.value);
                checkedBoxRemoveList(realClass, realValue);  // 배열 항목 제거
                checkbox.checked = false;  

            }else{
                checkedBoxRemoveList(realClass, realValue);
            }
        }
        // 해당 'div.tag' 삭제
        tag.remove();
    }

    // 메시지 업데이트
    toggleMessage();

}