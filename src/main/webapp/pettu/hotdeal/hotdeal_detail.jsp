<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/hotdeal/css/hotdeal_detail.css"
    />
</head>
<body>
<main>
    <!-- Search Section -->
    <jsp:include page="hotdeal_search_form.jsp" />

    <!-- Hotdeal Section -->
    <section class="hotdeal-section">
        <div class="product-grid">
            <!-- 상품 카드 -->
            <div class="product-card">
                <img src="${hvo.image}" alt="상품 이미지">
                <div class="product-info">
                    <!-- 상단 영역 -->
                    <div class="product-details">
                        <c:set var="myList" value="${htlist}" />
                        <p class="product-name">${hvo.title}</p>
                        <p class="product-category">카테고리: ${hvo.category3}</p>
                        <p class="product-price">
                            <fmt:formatNumber value="${myList[0].lowPrice}" pattern="###,###,###"/>원
                        </p>
                        <p class="product-discount">
                            <c:choose>
                                <c:when test="${empty myList[1] or myList[1].lowPrice == 0}">
                                    할인율: 0.0%
                                </c:when>
                                <c:otherwise>
                                    할인율:
                                    <fmt:formatNumber
                                            value="${((myList[1].lowPrice - myList[0].lowPrice) / myList[1].lowPrice) * 100}"
                                            type="number"
                                            maxFractionDigits="2"
                                    />
                                    %
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>

                    <!-- 하단 영역 -->
                    <div class="product-cta">  <!-- Call To Action: 여기서 '이 제품 보러가기' 링크 등을 묶음 -->
                        <p class="product-link">
                            <a href="${hvo.link}">이 제품 보러 가기</a>
                        </p>
                        <p class="product-notice">
                            ※ 이 가격은 배송비를 제외한 가격일 수 있습니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Chart Section -->
    <section class="chart-section">
        <h2 class="chart-title">📈 가격 변동 추이</h2>
        <div class="chart-info">
            <p>이 그래프는 제품 가격의 변동 추이를 나타냅니다.</p>
        </div>
        <div class="chart">
            <!-- 차트 SVG -->
            <svg id="svg-chart" xmlns="http://www.w3.org/2000/svg"></svg>
        </div>
        <script src="${pageContext.request.contextPath}/hotdeal/js/hotdeal_info.js"></script>
    </section>
</main>
</body>