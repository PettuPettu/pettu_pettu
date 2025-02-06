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
    <jsp:include page="hotdeal_search_form.jsp" />

    <!-- Hotdeal Section -->
    <section class="hotdeal-section">
        <h3>${hvo.title}</h3>
        <div class="product-grid">
            <!-- 상품 카드 -->
            <div class="product-card">
                <img src="${hvo.image}" alt="상품 이미지">
                <div class="product-info">
                    <c:set var="myList" value="${htlist}" />
                    <p class="product-name">상품명: ${hvo.title}</p>
                    <p class="product-category">카테고리: ${hvo.category3}</p>
                    <p class="product-price"><fmt:formatNumber value="${myList[0].lowPrice}" pattern="###,###,###"/>원</p>
                    <p class="product-discount">
                        <c:choose>
                            <c:when test="${empty myList[1] or myList[1].lowPrice == 0}">
                                할인율: 0.0%
                            </c:when>
                            <c:otherwise>
                                할인율: <fmt:formatNumber value="${((myList[1].lowPrice - myList[0].lowPrice) / myList[1].lowPrice) * 100}" type="number" maxFractionDigits="2"/> %
                            </c:otherwise>
                        </c:choose>
                    </p>

                    <p class="product-link">
                        <a href="${hvo.link}">이 제품 보러 가기</a>
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
