<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2025-01-27
  Time: 오후 6:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="UTF-8">
    <title>가게 상세</title>
    <style>
        .container {
            max-width: 80%;
            max-height: 100%;
            margin: 0 auto;
            padding: 20px;


        }
        .top-section {
            border: 3px solid #FFE4E4;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .info-box {
            display: flex;
            gap: 20px;
        }
        .image-box {
            width: 35%;
            height: 400px;
            border: 2px solid #FFE4E4;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #FFF5F5;
        }
        .flex-vertical-div {
            display: flex;
            flex-direction: column;
        }
        .info-fields {
            flex: 1;
        }
        .info-field {
            background-color: #FFF0F0;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 10px;
            min-height: 20px;
        }
        .info-contents {
            background-color: #FFF0F0;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 10px;
            min-height: 120px;
        }

        #image-content-div {
            height:68%;
            width:85%;
            background-color: #FFFBFB;
            margin-bottom: 20px;
            margin-top: 10px;
            border-radius: 10px;
            justify-content: center;
            align-items: center;
            border: 2px solid #FFE4E4;
            text-align: center; /*글자 가운데*/
            display: flex;
        }
        .place-score-div {
            height: 16%;
            width: 85%;
            background-color: #FFF9F9;
            margin-bottom: 10px;
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 세로 방향 가운데 정렬 */
            justify-content: center; /* 가로 방향 가운데 정렬 */
            border-radius: 10px;
            border: 2px solid #FFE4E4; /* 테두리 추가 */
        }
        .create-btn {
            height: 40px;
            width: 100%;
            background: linear-gradient(to bottom, #FFF9F9, #FFE4E4);
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 세로 방향 가운데 정렬 */
            justify-content: center; /* 가로 방향 가운데 정렬 */
            border-radius: 10px;
            border: 2px solid #FFE4E4; /* 테두리 추가 */
            margin: 0 auto;
        }


        .create-btn:hover {
            background: linear-gradient(to bottom, #FFE4E4, #FFF9F9); /* 호버 시 위에서 아래로 그라데이션 반전 */
        }
        .create-btn:active {
            background: linear-gradient(to bottom, #FFD2D2, #FFB6B6); /* 클릭 시 색상 변경 */
        }
  /*      .review-store-name-div {
            !* 정렬을 위한 flex *!
            display: flex;
            align-items: center;!* 세로 방향 가운데 정렬 *!
            justify-content: center; !* 가로 방향 가운데 정렬 *!

            text-align: center; !*글자 가운데*!

            height: 100%;
        }
*/
        .review-store-name-div {
            margin: 0 auto ;
            height: 50px;
            width: 99%;
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 세로 방향 가운데 정렬 */
            justify-content: space-between; /* 가로 방향 가운데 정렬 */
            border-radius: 10px;
            border: 2px solid #FFE4E4; /* 테두리 추가 */

            top: 0;
            position: sticky;

            background-color:rgba(255, 249, 249, 0.8);
        }

        .review-store-title-div {
            margin: 0 auto ;
            height: 50px;
            width: 80%;
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 세로 방향 가운데 정렬 */
            justify-content: center; /* 가로 방향 가운데 정렬 */
            border-radius: 10px;
            border: 2px solid #FFE4E4; /* 테두리 추가 */

        }
        .review-title-div {
            height: 70%;
            width: 30%;
            margin-left: 10px;
            margin-right: 10px;
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 세로 방향 가운데 정렬 */
            border-radius: 10px;
            border: 2px solid #FFE4E4; /* 테두리 추가 */
            text-align: center;
            justify-content: center;
            background-color: #FFF9F9;
        }
        .review-create-btn {
            height: 70%;
            width: 15%;
            margin-left: 10px;
            margin-right: 10px;
            display: flex; /* Flexbox 사용 */
            align-items: center; /* 세로 방향 가운데 정렬 */
            border-radius: 10px;
            border: 2px solid #FFE4E4; /* 테두리 추가 */
            text-align: center;
            justify-content: center;
            background-color: #FFF9F9;
        }

        .create-btn:hover {
            background-color: #FFDFDF; /* 호버 시 배경색 변경 */
        }
        .review-box {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            height: 200px;
            background-color: #FFF5F5;
            width: 230px;

        }
        .review-box-end-layer{
            display: flex;
            flex-direction: column;
            text-align: center;
            justify-content: center;
            align-items: center;
            height: 10px;
            padding: 0.5px;

        }
        .review-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
            margin-top: 20px;

            height: 510px;
        }

        .second-section {
            margin-top: 15px;
            border: 3px solid #FFE4E4;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;

            align-items: center;
            justify-content: center;

            text-align: center;
        }


        #custom-select-box {
            margin-left: 10px;
            height: 35px;
            width: 150px;
            border-radius: 10px;
            border: 2px solid #FFE4E4; /* 테두리 */
            background: #FFF9F9; /* 그라데이션 배경 */
            font-size: 16px;
            padding: 5px 10px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease; /* 배경색 전환과 클릭 효과 */
            text-align: center;
            outline: none; /* 클릭 시 outline 제거 */
        }

        /* #custom-select-box select 요소 호버 상태 */
        #custom-select-box:hover {
            background: linear-gradient(to bottom, #FFE4E4, #FFF9F9); /* 호버 시 그라데이션 반전 */
        }

        /* #custom-select-box select 요소 클릭(활성화) 상태 */
        #custom-select-box:active {
            background: linear-gradient(to bottom, #FFB6B6, #FFDFDF); /* 클릭 시 색상 변경 */
            transform: scale(0.98); /* 클릭 시 살짝 눌리는 효과 */
            border: 2px solid transparent; /* 클릭 시 테두리 제거 */
        }

        /* option 스타일 (id에 해당하는 select의 option) */
        #custom-select-box option {
            background-color: #FFF9F9;
            padding: 5px;
            text-align: center; /* option 요소 텍스트 중앙 정렬 */
        }
        #custom-select-box option:hover {
            background-color: #FFDFDF; /* 호버 시 배경색 */
        }
    </style>

</head>
<body>
    <script>
        function scrollToSecondSection() {
            const targetElement = document.getElementById("move-second-section");

            // 해당 div로 부드럽게 스크롤 이동
            window.scrollTo({
                top: targetElement.offsetTop - 60,
                behavior: 'smooth', // 부드럽게 스크롤
                    // 스크롤을 해당 요소의 상단으로 맞춤
            });
        }
    </script>

    <div class="review-store-title-div" >
        <div >가게이름</div>

    </div>

<div class="container">
    <div class="top-section">

        <div class="info-box">
            <div class="image-box flex-vertical-div">
                <div id="image-content-div">
                    사진을 업로드 하세요
                </div>

                <div class="place-score-div">평점</div>

            </div>
            <div class="info-fields">
                <div class="info-field"> # 카테고리: 카페</div>
                <div class="info-field"> # 위치 :경기도</div>
                <div class="info-field"> # 동물 분류 : 개 </div>
                <div class="info-contents">설명: 아늑한 분위기의 프리미엄 카페</div>
                <div class="info-field"> # 개업일 </div>
            </div>
        </div>
        <%--<div>

            <div class="create-button-div">
                <button class="create-btn">Review 작성하기</button>

            </div>
        </div>--%>
    </div>

    <div class="second-section" id="move-second-section" onclick="scrollToSecondSection()">
        <div class="review-store-name-div" >
            <div>
                <label for="custom-select-box"></label>
                    <select id="custom-select-box" name="sort-order">
                    <option value="newest">최신순</option>
                    <option value="oldest">오래된 순</option>
                 </select>
            </div>

            <div >리뷰 목록</div>


            <button class="review-create-btn create-btn"> Review 작성하기</button>
        </div>
        <div class="review-grid">
            <% for(int i = 1; i <= 20; i++) { %>
            <div class="review-box">
                리뷰 이미지 <%= i %>
            </div>
            <% } %>

            <div class="review-box-end-layer" >

            </div>
        </div>

    </div>
</div>

</body>
</html>
