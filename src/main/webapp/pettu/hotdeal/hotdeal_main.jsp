<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>펫뚜펫뚜 핫딜 페이지</title>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/hotdeal/css/hotdeal_main.css"
    />
</head>
<body>
<jsp:include page="../layout/header.jsp" />
<main>
    <section class="search-section">
        <h1>🔥 내 반려동물을 위한 핫딜 정보 찾아드려요 🔥</h1>
        <input type="text" class="search-bar" placeholder="검색어를 입력하세요">
        <button class="search-button">🔍</button>
    </section>

    <section class="category-section">
        <button class="category">사료</button>
        <button class="category">장난감</button>
        <button class="category">배변</button>
        <button class="category">간식</button>
        <button class="category">의류</button>
    </section>

    <section class="hotdeal-section">
        <h2>가장 많이 찾은 상품 핫딜 정보</h2>
        <div class="product-grid">
            <%-- 반복될 상품 카드 영역 --%>
            <div class="product-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfZbTaFxjSTrlVVdzmfSbeIDxhiY80j0tWdQ&s" alt="상품 이미지">
                <div class="product-info">
                    <p class="product-name">우리 아이가 좋아하는 사료</p>
                    <p class="product-price">5000원</p>
                </div>
            </div>
        </div>
    </section>

    <section class="hotdeal-section">
        <h2>할인율 높은 상품 핫딜 정보</h2>
        <div class="product-grid">
            <%-- 반복될 상품 카드 영역 --%>
            <div class="product-card">
                <img src="https://i.pinimg.com/474x/5c/93/51/5c9351acd5c3d3bc32a342aad65f48b0.jpg" alt="상품 이미지">
                <div class="product-info">
                    <p class="product-name">우리 아이가 좋아하는 사료</p>
                    <p class="product-price">5000원</p>
                </div>
            </div>
        </div>
    </section>

    <section class="hotdeal-section">
        <h2>반려동물 상품 핫딜 정보</h2>
        <div class="product-grid">
            <%-- 반복될 상품 카드 영역 --%>
            <div class="product-card">
                <img src="https://i.namu.wiki/i/c18xKUGWXNtJppHYSUG2FcmnQgTjmp5o48jB-btMtbNrXiLhm2jCJEOsCoiXFovA6YQQILcACi1CDUCxhjUPGg.gif" alt="상품 이미지">
                <div class="product-info">
                    <p class="product-name">2만원 ↘️ 큰 강아지 기저귀</p>
                    <p class="product-price">18,000원</p>
                    <div class="product-rating">⭐⭐⭐⭐☆</div>
                </div>
            </div>
        </div>
    </section>
</main>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>
