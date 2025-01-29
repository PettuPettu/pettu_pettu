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
  <title>가게 리뷰</title>

  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/review/css/create_review.css" />
</head>
<body>
<h1> 가게 리뷰 쓰기 모달 페이지 </h1>


<div class="container">
  <div class="top-section">
    <div>
      <div class="create-button-div" style="margin-bottom: 10px">
        <h1> 가게이름 </h1>
      </div>
    </div>
    <div class="info-box">
      <div class="image-box flex-vertical-div">
        <div id="image-content-div">
          사진을 업로드 하세요
        </div>

        <button class="upload-btn">UPLOAD</button>

        </div>
        <div class="info-fields">
          <div class="info-field"> # 카테고리: 카페  # 위치 :경기도  # 동물 분류 : 개 </div>
          <div class="info-field">평점: 별별별별별</div>

          <div class="info-contents">설명: 아늑한 분위기의 프리미엄 카페</div>
        </div>
    </div>
    <div>
      <div class="create-button-div">
        <button class="create-btn">작성 완료</button>

      </div>
    </div>
  </div>

</div>

</body>
</html>
