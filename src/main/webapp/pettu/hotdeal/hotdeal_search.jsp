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

        <form id="searchForm" action="/hotdeal/search" method="GET">
            <input type="text" name="keyword" class="search-bar" placeholder="검색어를 입력하세요">
            <button type="submit" class="search-button">🔍</button>
        </form>
    </section>


    <section class="hotdeal-section">
        <h2>🔥 핫딜 상품 검색 결과 </h2>
        <div class="product-grid">
            <c:choose>
                <c:when test="${empty slist}">
                    <p>목록이 비어 있습니다.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${slist}" var="hotdeal" varStatus="status">

                        <!-- 한 줄 시작 -->
                        <c:if test="${status.index == 0 || status.index % 4 == 0}">
                            <div class="row">
                        </c:if>

                        <div class="product-card">
                            <img src="${hotdeal.image}" alt="상품 이미지">
                            <div class="product-info">
                                <p class="product-name"><a href="/hotdeal/detail?proSeq=${hotdeal.proSeq}">${hotdeal.title}</a></p>
                                <p class="product-price"><fmt:formatNumber value="${hotdeal.lowPrice}" pattern="###,###,###"/>원</p>
                            </div>
                        </div>

                        <!-- 한 줄 끝 -->
                        <c:if test="${(status.index % 4 == 3) || status.last}">
                            </div>
                        </c:if>

                    </c:forEach>
                </div>
                <!-- 페이징 기능 추가 -->
                <div class="pagination">
                    <c:if test="${paging.startPage != 1}">
                        <a href="/hotdeal/search?keyword=${keyword}&nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
                    </c:if>

                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
                        <c:choose>
                            <c:when test="${p == paging.nowPage}">
                                <button class="pagination-button active">${p}</button>
                            </c:when>
                            <c:otherwise>
                                <a href="/hotdeal/search?keyword=${keyword}&nowPage=${p}&cntPerPage=${paging.cntPerPage}" class="pagination-button">${p}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${paging.endPage != paging.lastPage}">
                        <a href="/hotdeal/search?keyword=${keyword}&nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}" class="pagination-button">&gt;</a>
                    </c:if>
                </div>
            </c:otherwise>
        </c:choose>
    </section>
</main>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>