<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/hotdeal/css/hotdeal_main.css"
    />
</head>
<main>
    <jsp:include page="hotdeal_search_form.jsp" />

    <section class="category-section">
        <%
            String[] categories = {"사료", "장난감", "배변", "간식", "패션", "기타"};
        %>

        <% for (String category : categories) { %>
        <button class="category" data-query="<%= category %>"><%= category %></button>
        <% } %>
    </section>

    <jsp:include page="../common/slide.jsp">
        <jsp:param name="attributeName" value="hlist" />
        <jsp:param name="slideTitle" value="최근 등록된 상품 정보" />
        <jsp:param name="slideIndex" value="0" />
    </jsp:include>

    <jsp:include page="../common/slide.jsp">
        <jsp:param name="attributeName" value="dlist" />
        <jsp:param name="slideTitle" value="할인율이 높은 반려동물 상품 정보" />
        <jsp:param name="slideIndex" value="1" />
    </jsp:include>

    <section class="hotdeal-section">
        <h2>
            <img src="${pageContext.request.contextPath}/assets/common/hot.svg" />
            <span>반려동물 상품 핫딜 정보</span>
        </h2>
        <div class="product-grid">
            <c:forEach items="${viewAll}" var="hotdeal" varStatus="status">

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
                <a href="/hotdeal/home?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
            </c:if>

            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage}">
                        <button class="pagination-button active">${p}</button>
                    </c:when>
                    <c:otherwise>
                        <a href="/hotdeal/home?nowPage=${p}&cntPerPage=${paging.cntPerPage}" class="pagination-button">${p}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${paging.endPage != paging.lastPage}">
                <a href="/hotdeal/home?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}" class="pagination-button">&gt;</a>
            </c:if>
        </div>
    </section>
</main>
<script>
    document.querySelectorAll(".category").forEach(button => {
        button.addEventListener("click", function() {
            const query = this.dataset.query;// 버튼의 데이터 값 가져오기
            console.log("query:", query);
            window.location.href = "search?keyword=" + query; // 검색 요청
        });
    });
</script>