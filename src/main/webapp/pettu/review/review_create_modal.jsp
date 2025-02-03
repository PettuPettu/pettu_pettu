<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>가게 리뷰</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/review/css/create_review.css" />
</head>
<body>
<script>
  $(document).ready(function() {
    $(".close").click(function() {
      $("#commonModal").hide();
    });
  });
</script>
<button class="close">x</button>

<div class="review-modal-container">
  <div class="review-modal-top-section">
    <div>
      <div class="review-modal-create-button-div" style="margin-bottom: 10px">
        <h1 id="spot-name"> 가게이름 </h1>
      </div>
    </div>
    <div class="review-modal-info-box">
      <div class="review-modal-image-box review-modal-flex-vertical-div">
        <div id="review-modal-image-content-div">
          <img src="/assets/layout/github.svg" alt="카드 이미지 3" class="img-width-80">

        </div>
        <button class="review-modal-upload-btn">UPLOAD</button>
      </div>
      <div class="review-modal-info-fields">
        <div class="review-modal-info-field" id="spot-review-info"> # 카테고리: 카페  # 위치 :경기도  # 동물 분류 : 개 </div>
        <div class="review-modal-info-field" id="review-score">평점: <input type="text" id="review-score-input" placeholder="점수을 입력하세요"></div>
        <div class="review-modal-info-field" id="review-title">제목: <input type="text" id="review-title-input" placeholder="제목을 입력하세요"></div>
        <div class="review-modal-info-contents" id="review-contents">후기글:  <input type="text" id="review-contents-input" placeholder="후기글을 작성하세요"></div>

      </div>
    </div>
    <div>
      <div class="review-modal-create-button-div">
        <button class="review-modal-create-btn">작성 완료</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>
