<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>핫딜 상세 페이지</title>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/hotdeal/css/hotdeal_detail.css"
    />
</head>
<body>
<!-- Header -->
<jsp:include page="../layout/header.jsp" />

<main>
<!-- Search Section -->
<section class="search-section">
    <h1>🔥 내 반려동물을 위한 핫딜 정보 찾아드려요 🔥</h1>
    <input type="text" class="search-bar" placeholder="검색어를 입력하세요">
    <button class="search-button">🔍</button>
</section>

<!-- Hotdeal Section -->
<section class="hotdeal-section">
    <h2>레비앙독 연어</h2>
    <div class="product-grid">
        <!-- 상품 카드 -->
        <div class="product-card">
            <img src="https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/418/1c3ee64eea127d84b2f5f74756693888_res.jpeg" alt="상품 이미지">
            <div class="product-info">
                <p class="product-name">상품명: 레비앙독 연어</p>
                <p class="product-category">카테고리: 강아지 사료</p>
                <p class="product-price">가격: 18,000원</p>
                <p class="product-discount">할인율: 10%</p>
            </div>
        </div>
    </div>
</section>

<!-- Chart Section -->
<section class="chart-section">
    <h2>가격변동 추이</h2>
    <img src="img/chart-example.png" alt="가격 변동 차트">
</section>
</main>
<!-- Footer -->
<jsp:include page="../layout/footer.jsp" />
</body>
</html>
