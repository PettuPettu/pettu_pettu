<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>가게 리뷰</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/review/css/create_review.css" />
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/review/js/create_review_modal.js"></script>

<script>



</script>
<button class="close">x</button>

<div class="review-modal-container">
  <div class="review-modal-top-section">
    <div>
      <div class="review-modal-create-button-div">
        <h1 id="spot-name">  </h1>
      </div>
    </div>
    <div class="review-modal-info-box">
      <div class="review-modal-image-box review-modal-flex-vertical-div">
        <div id="review-modal-image-content-div">
          <img id="imagePreview" src="/assets/layout/github.svg" alt="리뷰 이미지" class="img-width-80">

        </div>


        <!-- 파일 선택 버튼 -->
          <input type="file" id="fileInput" class="review-modal-upload-btn" accept="image/*" value="UPLOAD" />

        <!-- 업로드 버튼 -->
        <div class="image-upload-buttons" style="display: none;">
          <button id="cancelImageBtn" onclick="cancelImage()">취소</button>
        </div>

      </div>
      <div class="review-modal-info-fields">
        <div class="review-modal-info-field" id="review-score">
          평점:
            <span class="star" data-score="1">&#9733;</span>
            <span class="star" data-score="2">&#9733;</span>
            <span class="star" data-score="3">&#9733;</span>
            <span class="star" data-score="4">&#9733;</span>
            <span class="star" data-score="5">&#9733;</span>
        </div>

          <div class="review-modal-info-field" id="review-title">제목: <input type="text" id="review-title-input" placeholder="제목을 입력하세요"></div>
        <div class="review-modal-info-contents" id="review-contents">후기글:  <input type="text" id="review-contents-input" placeholder="후기글을 작성하세요"></div>

      </div>
    </div>
    <div>
      <div class="review-modal-create-button-div">

        <button class="review-modal-create-btn" id="uploadImageBtn">작성 완료</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>
