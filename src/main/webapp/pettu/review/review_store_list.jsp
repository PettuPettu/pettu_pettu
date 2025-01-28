<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2025-01-27
  Time: 오후 6:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        /*------------------------- store css-------------------------*/
        .second-section {
            background-color: #f9f9f9;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
            height: 800px;

        }

        /*------------------------- hot-top-section css-------------------------*/

        .hot-top-section {
            background-color: #fce4dc;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
            height: 100%;
        }

        .hot-top-section h1 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }

        .hot-top-section h1 span {
            color: #f48c06;
        }

        .slide-cards {
            display: flex;
            justify-content: space-around;
            align-items: center;
            gap: 20px;
        }

        .slide-card {
            background-color: #ffffff;
            width: 30%;
            height: 190px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
        }

        .slide-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .slide-card h3 {
            font-size: 16px;
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
        }

        .slide-card p {
            font-size: 14px;
            color: #f48c06;
            margin-bottom: 10px;
        }

        .slide-card .medal {
            position: absolute;
            top: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 50px;
        }

        /*--------------------------------*/
        .search-section {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .search-bar {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .search-bar input {
            width: 300px;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .search-bar button {
            padding: 10px 20px;
            font-size: 14px;
            color: #ffffff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-bar button:hover {
            background-color: #0056b3;
        }

        .tags {
            margin-top: 15px;
            text-align: center;
        }

        .tags span {
            display: inline-block;
            background-color: #007bff;
            color: #ffffff;
            padding: 8px 12px;
            border-radius: 15px;
            font-size: 12px;
            margin: 5px;
            cursor: pointer;
        }

        .tags span:hover {
            background-color: #0056b3;
        }

        /*-----------------------------*/
        .main-slide-section {
            margin-top: 50px;
            font-size: 20px;
            display: flex; /* 카드들을 가로로 배치 */
            justify-content: space-between;  /* 카드들 간 간격을 자동으로 맞춤 */
            gap: 30px;  /* 카드 간의 간격 */
            padding: 0 10px;  /* 상하 여백 추가 */
        }

        .main-slide-card {
            width: 300px;  /* 카드의 가로 크기 설정 */
            border: 3px solid #f5c94a; /* 카드 테두리 */
            border-radius: 10px; /* 둥근 테두리 */
            padding: 10px;
            display: flex;
            flex-direction: row; /* 이미지와 글을 가로로 배치 */
            gap: 10px; /* 이미지와 텍스트 간의 간격 */
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            position: relative;

            background-color: #FDFDFD;

        }


        .main-slide-card img {
            width: 115px;  /* 이미지의 가로 크기 */
            height: 150px; /* 이미지의 세로 크기 */
            border-radius: 5px;
            border: 1px #FBE186 solid; /* 카드 이미지에 테두리 추가 */
        }

        .main-slide-card-desc {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 10px;
            flex: 1;  /* 텍스트가 남은 공간을 차지하도록 */
        }

        .main-slide-card-title, .main-slide-card-info {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .main-slide-card-title strong,
        .main-slide-card-info strong {
            font-size: 14px;
        }

        .main-slide-card-title span,
        .main-slide-card-info span {
            font-size: 12px;
            color: #8f8f8f; /* 설명 색상 */
        }

        .card-flex {
            display: flex;

        }
        /* --------top css --------- */
        .top-img-contents {
            width: 50%;  /* div 크기 설정 */
            height: 100%; /* div 높이 설정 */
            display: flex;  /* flex로 배치 */
            justify-content: center;  /* 가로로 중앙 정렬 */
            align-items: center;  /* 세로로 중앙 정렬 */
            border-radius: 10px;  /* 둥근 테두리 설정 */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
            margin-right: 10px;

        }
        .top-img-contents img {
            max-width: 80%;  /* 이미지가 div의 너비를 초과하지 않게 설정 */
            max-height: 90%;  /* 이미지가 div의 높이를 초과하지 않게 설정 */
            border-radius: 5px;  /* 이미지 테두리를 둥글게 설정 */
        }

        .top-info-contents {
            width: 50%;  /* 너비 100% */
            padding: 20px;  /* 상하 좌우 여백 */
            background-color: #FDFDFD;  /* 배경색 */
            border-radius: 10px;  /* 테두리 둥글게 */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);  /* 그림자 효과 */
            display: flex;  /* flexbox로 정렬 */
            flex-direction: column;  /* 세로 방향으로 배치 */
            gap: 10px;  /* 항목들 간의 간격 */
            font-family: 'Arial', sans-serif;  /* 글꼴 */
        }

        .top-info-contents div {
            font-weight: bold;
            font-size: 16px;  /* 글자 크기 */
            color: #333;  /* 글자 색 */
        }
        .top-info-contents div:nth-child(2) {
            color: #888;  /* 리뷰 항목 색상 변경 */
            font-weight: lighter;
            font-style: italic;
            font-size: 13px;
        }


        .top-info-contents div:nth-child(3) {
            font-weight: bold;  /* 세 번째 항목은 굵은 글씨 */
            color: #FF6F61;  /* 별점 색상 변경 */
            font-size: 13px;
        }

        .top-info-contents div:nth-child(4) {
            font-style: italic;  /* 두 번째 항목은 이탤릭체 */

            font-size: 13px;
        }

        .top-info-contents div:nth-child(5) {
            font-weight: bold;
            color: #FF9F00;
            font-size: 13px;
        }

        /*----------------------------*/
        <style>
         body {
             font-family: Arial, sans-serif;
             margin: 0;
             padding: 0;
             background-color: #f8f9ff;
         }

        .filter-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fdfdff;
            border: 1px solid #d6e0f5;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .filter-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 20px;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-button {
            padding: 10px;
            border: 1px solid #c9d6f0;
            border-radius: 8px;
            background-color: #f4f7ff;
            color: #495a8c;
            font-size: 14px;
            cursor: pointer;
        }

        .dropdown-button:hover {
            background-color: #e0e7ff;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fdfdff;
            border: 1px solid #d6e0f5;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 10px;
            z-index: 1;
        }

        .dropdown.open .dropdown-content {
            display: block;
        }

        .dropdown-content label {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            color: #495a8c;
            margin-bottom: 5px;
        }

        .tags {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            padding: 10px;
            background-color: #f4f7ff;
            border: 1px solid #d6e0f5;
            border-radius: 10px;
        }

        .tag {
            padding: 5px 10px;
            background-color: #e0e7ff;
            color: #495a8c;
            border: 1px solid #c3d4f7;
            border-radius: 15px;
            font-size: 12px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .tag span {
            cursor: pointer;
            color: #4354a8;
        }

        .tag:hover {
            background-color: #cbd7ff;
        }

        .dropdown.open .dropdown-content {
            display: block;
        }
    </style>
    <script>
        function toggleDropdown(event) {
            // Close any open dropdowns first
            document.querySelectorAll('.dropdown.open').forEach(openDropdown => {
                openDropdown.classList.remove('open');
            });

            // Toggle the clicked dropdown
            const dropdown = event.target.closest('.dropdown');
            dropdown.classList.toggle('open');
        }

        // Close dropdowns when clicking outside
        document.addEventListener('click', function(event) {
            if (!event.target.closest('.dropdown')) {
                document.querySelectorAll('.dropdown.open').forEach(openDropdown => {
                    openDropdown.classList.remove('open');
                });
            }
        });

        function handleCheckboxChange(event) {
            const checkbox = event.target;
            const value = checkbox.value;
            alert("checkbox"+checkbox + "value:"+ value);
            const tagContainer = document.querySelector('.tags');

            if (checkbox.checked) {
                // Create a new tag div
                const newTag = document.createElement('div');
                newTag.className = 'tag';
                newTag.innerHTML = `#`+ value+`<span onclick="removeTag(event)">✕</span>`;
                tagContainer.appendChild(newTag);
            } else {
                // Remove the corresponding tag
                const existingTag = Array.from(tagContainer.children).find(tag =>
                    tag.textContent.trim().startsWith(`#`+ value)
                );
                if (existingTag) {
                    existingTag.remove();
                }
            }
        }

        function removeTag(event) {
            const tag = event.target.closest('.tag');
            if (tag) {
                const value = tag.textContent.trim().replace('✕', '').trim().substring(1);
                const checkbox = document.querySelector(`input[type="checkbox"][value="`+ value+`"]`);
                if (checkbox) {
                    checkbox.checked = false;
                }
                tag.remove();
            }
        }
    </script>
</head>
<body>

    <div class="container">
        <!-- HOT TOP Section -->
        <div class="hot-top-section">
            <h1>펫뚜펫뚜 <span>1월</span> HOT TOP 3</h1>
            <div class="slide-cards">
                <div class="slide-card card-flex">
                    <div class="top-img-contents">
                        <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                    </div>
                    <div class="top-info-contents">
                        <div> 마루네 아침 카페 </div>
                        <div> 맛있는 쿠키가 있습니다 </div>
                        <div> 별점 5 점</div>
                        <div> 총 리뷰 수
                              이번달 30개 / 총 70개 </div>
                        <div> 카테고리 : 카페</div>

                    </div>
                </div>

                <div class="slide-card card-flex">
                    <div class="top-img-contents">
                        <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                    </div>
                    <div class="top-info-contents">
                        <div> 마루네 아침 카페 </div>
                        <div> 맛있는 쿠키가 있습니다 </div>
                        <div> 별점 5 점</div>
                        <div> 총 리뷰 수
                            이번달 30개 / 총 70개 </div>
                        <div> 카테고리 : 카페</div>

                    </div>
                </div>

                <div class="slide-card card-flex">
                    <div class="top-img-contents">
                        <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                    </div>
                    <div class="top-info-contents">
                        <div> 마루네 아침 카페 </div>
                        <div> 맛있는 쿠키가 있습니다 </div>
                        <div> 별점 5 점</div>
                        <div> 총 리뷰 수
                            이번달 30개 / 총 70개 </div>
                        <div> 카테고리 : 카페</div>

                    </div>
                </div>
            </div>
        </div>
        <!--  ---------------------- Search Section -------------------- -->
        <div class="search-section">


            <div class="filter-container">
                <!-- Filter Row -->
                <div class="filter-row">
                    <div class="dropdown">
                        <button class="dropdown-button" onclick="toggleDropdown(event)">지역 검색</button>
                        <div class="dropdown-content">
                            <label><input type="checkbox" value="서울전체" onchange="handleCheckboxChange(event)"> 서울전체</label>
                            <label><input type="checkbox" value="경기전체" onchange="handleCheckboxChange(event)"> 경기전체</label>
                            <label><input type="checkbox" value="인천전체" onchange="handleCheckboxChange(event)"> 인천전체</label>
                        </div>
                    </div>

                    <div class="dropdown">
                        <button class="dropdown-button" onclick="toggleDropdown(event)">카테고리 검색</button>
                        <div class="dropdown-content">
                            <label><input type="checkbox" value="카페" onchange="handleCheckboxChange(event)"> 카페</label>
                            <label><input type="checkbox" value="식당" onchange="handleCheckboxChange(event)"> 식당</label>
                            <label><input type="checkbox" value="맛집" onchange="handleCheckboxChange(event)"> 맛집</label>
                        </div>
                    </div>
                    <div class="dropdown">
                        <button class="dropdown-button" onclick="toggleDropdown(event)">동물 분류 검색</button>
                        <div class="dropdown-content">
                            <label><input type="checkbox" value="개" onchange="handleCheckboxChange(event)"> 개</label>
                            <label><input type="checkbox" value="고양이" onchange="handleCheckboxChange(event)"> 고양이</label>
                            <label><input type="checkbox" value="파충류" onchange="handleCheckboxChange(event)"> 파충류</label>
                            <label><input type="checkbox" value="새" onchange="handleCheckboxChange(event)"> 새</label>

                        </div>
                    </div>
                    <div class="search-bar">
                        <input type="text" placeholder="검색어를 입력하세요">
                        <button>검색</button>
                    </div>
                </div>

                <!-- Tags Section -->
                <div class="tags">
                    <!-- Tags will be dynamically created here -->
                </div>

            </div>

        </div>
        <!--  ---------------------- store list Section -------------------- -->
        <div class="second-section">
            <h1>펫뚜펫뚜 <span>1월</span> 가게 정보 LIST </h1>


            <div class="review-grid">

            </div>

            <div class="main-slide-section">
                <!-- 카드 1 -->
                <div class="main-slide-card">
                    <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                    <div class="main-slide-card-desc">
                        <div class="main-slide-card-title">
                            <strong>카드 1 제목</strong>
                            <span>카드 1 설명</span>
                        </div>
                        <div class="main-slide-card-info">
                            <strong>카드 1 정보</strong>
                            <span>추가 정보 1</span>
                        </div>
                    </div>
                </div>

                <!-- 카드 2 -->
                <div class="main-slide-card">
                    <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                    <div class="main-slide-card-desc">
                        <div class="main-slide-card-title">
                            <strong>카드 2 제목</strong>
                            <span>카드 2 설명</span>
                        </div>
                        <div class="main-slide-card-info">
                            <strong>카드 2 정보</strong>
                            <span>추가 정보 2</span>
                        </div>
                    </div>
                </div>

                <!-- 카드 3 -->
                <div class="main-slide-card">
                    <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                    <div class="main-slide-card-desc">
                        <div class="main-slide-card-title">
                            <strong>카드 3 제목</strong>
                            <span>카드 3 설명</span>
                        </div>
                        <div class="main-slide-card-info">
                            <strong>카드 3 정보</strong>
                            <span>추가 정보 3</span>
                        </div>
                    </div>
                </div>
                <div class="main-slide-card">
                    <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                    <div class="main-slide-card-desc">
                        <div class="main-slide-card-title">
                            <strong>카드 3 제목</strong>
                            <span>카드 3 설명</span>
                        </div>
                        <div class="main-slide-card-info">
                            <strong>카드 3 정보</strong>
                            <span>추가 정보 3</span>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</body>
</html>
