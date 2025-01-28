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
  <style>
    .container {
      max-width: 800px;
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
      width: 300px;
      height: 300px;
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
      min-height: 30px;
    }
    .info-contents {
      background-color: #FFF0F0;
      padding: 15px;
      margin-bottom: 10px;
      border-radius: 10px;
      min-height: 120px;
    }

    #image-content-div {
      height:65%;
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
    .upload-btn {
      height: 18%;
      width: 85%;
      background-color: #FFF9F9;
      margin-bottom: 10px;
      display: flex; /* Flexbox 사용 */
      align-items: center; /* 세로 방향 가운데 정렬 */
      justify-content: center; /* 가로 방향 가운데 정렬 */
      border-radius: 10px;
      border: 2px solid #FFE4E4; /* 테두리 추가 */
    }


    .upload-btn:hover {
      background-color: #FFDFDF; /* 호버 시 배경색 변경 */
    }
   .create-button-div {
     /* 정렬을 위한 flex */
     display: flex;
     align-items: center;/* 세로 방향 가운데 정렬 */
     justify-content: center; /* 가로 방향 가운데 정렬 */

     text-align: center; /*글자 가운데*/

     height: 100%;
   }

    .create-btn {
      margin-top: 10px ;
      height: 50px;
      width: 100%;
      background-color: #FFF9F9;
      display: flex; /* Flexbox 사용 */
      align-items: center; /* 세로 방향 가운데 정렬 */
      justify-content: center; /* 가로 방향 가운데 정렬 */
      border-radius: 10px;
      border: 2px solid #FFE4E4; /* 테두리 추가 */

    }

    .create-btn:hover {
      background-color: #FFDFDF; /* 호버 시 배경색 변경 */
    }
  </style>

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
