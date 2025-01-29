<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://d3js.org/d3.v7.min.js"></script>
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
    <h3>레비앙독 연어</h3>
    <div class="product-grid">
        <!-- 상품 카드 -->
        <div class="product-card">
            <img src="https://img.danawa.com/prod_img/500000/310/728/img/14728310_1.jpg?shrink=330:*&_v=20230809110951" alt="상품 이미지">
            <div class="product-info">
                <p class="product-name">상품명: 레비앙독 연어</p>
                <p class="product-category">카테고리: 강아지 사료</p>
                <p class="product-price">가격: 18,000원</p>
                <p class="product-discount">할인율: 10%</p>
                <p class="product-link">
                    <a href="https://smartstore.naver.com/startist/products/6440886992?nl-query=%EB%9D%BC%EB%B9%84%EC%95%99%EB%8F%85%EC%97%B0%EC%96%B4&nl-ts-pid=iHBFXlpzLi0sshVBeSsssssssao-022340&NaPm=ct%3Dm6gketqw%7Cci%3D0e1654cf425830b1474ba9b783fe43bbe93d0571%7Ctr%3Dsls%7Csn%3D5716306%7Chk%3D58bb13b9f4fc218dc8a942a6d072bf79a1b7ee88">이 제품 보러 가기</a>
                </p>
            </div>
        </div>
    </div>
</section>

<!-- Chart Section -->
    <!-- Chart Section -->
    <section class="chart-section">
        <h3 class="chart-title">📈 가격 변동 추이</h3>
        <div class="chart-info">
            <p>이 그래프는 제품 가격의 변동 추이를 나타냅니다.</p>
        </div>
        <div class="chart">
            <!-- 차트 SVG -->
            <svg id="svg-chart" xmlns="http://www.w3.org/2000/svg"></svg>
        </div>
        <script src="${pageContext.request.contextPath}/hotdeal/js/hotdeal_info.js"></script>
    </section>
    <script src="https://d3js.org/d3.v7.min.js"></script>
</main>
<!-- Footer -->
<jsp:include page="../layout/footer.jsp" />
</body>
</html>
