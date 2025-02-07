<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>핫딜 관리</title>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/admin/css/admin_page.css"
    />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<jsp:include page="/pettu/common/modal.jsp"/>
<div class="wrapper">
<main class="main-content">
    <div class="top-controls">
        <div class="view-options">
            <button class="menu-item" onclick="location.href='/admin/user'">사용자 관리</button>
            <button class="menu-item" onclick="location.href='/admin/place'">시설 관리</button>
            <button class="menu-item active" onclick="location.href='/admin/hotdeal'">상품 관리</button>
        </div>
        <button class="add-button" data-page="/pettu/admin/admin_api_hotdeal_modal.jsp" data-width="fit-content"
                data-height="fit-content">상품 API 불러오기</button>
    </div>

    <section class="content">
        <table class="facility-table">
            <thead>
            <tr>
                <th>상품 번호</th>
                <th>상품명</th>
                <th>상품 갱신 날짜</th>
                <th>상세페이지</th>
            </tr>
            </thead>
            <tbody>
            <!-- Example rows -->
            <c:forEach var="hvo" items="${hlist}">
                <fmt:formatDate value="${hvo.regitDate}" pattern="yyyy-MM-dd" var="formattedDate" />
                <tr>
                    <td>${hvo.proSeq}</td>
                    <td>${hvo.title}</td>
                    <td>${formattedDate}</td>
                    <td><a href="/hotdeal/detail?proSeq=${hvo.proSeq}">보기</a></td>
                </tr>
            </c:forEach>
            <!-- Add more rows dynamically -->
            </tbody>
        </table>
        <div class="pagination">
            <c:if test="${paging.startPage != 1}">
                <a href="/admin/hotdeal?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}" class="pagination-button">&lt;</a>
            </c:if>

            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage}">
                        <button class="pagination-button active">${p}</button>
                    </c:when>
                    <c:otherwise>
                        <a href="/admin/hotdeal?nowPage=${p}&cntPerPage=${paging.cntPerPage}" class="pagination-button">${p}</a>

                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${paging.endPage != paging.lastPage}">
                <a href="/admin/hotdeal?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}" class="pagination-button">&gt;</a>
            </c:if>
        </div>
    </section>
</main>
<!-- jQuery 3.6.4 (최신 버전 사용 가능) -->
<script>
    $(document).ready(function() {
        $(".add-button").click(function() {
            const page = $(this).data("page");
            console.log("Page URL:", page);
            $("#modal-body").load(page);
            $("#commonModal").show();
        });
    });
</script>
</div>
</body>
</html>
