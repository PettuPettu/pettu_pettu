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
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/review/css/store_detail.css" />

</head>
<body>
<script src="${pageContext.request.contextPath}/review/js/store_detail.js"></script>


<div class="review-store-title-div" >
    <div >가게이름</div>

</div>

<div class="container">
    <div class="top-section">

        <div class="info-box">
            <div class="image-box flex-vertical-div">
                <div id="image-content-div">
                    <img src="/assets/layout/github.svg" alt="카드 이미지 3" class="img-full">
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
