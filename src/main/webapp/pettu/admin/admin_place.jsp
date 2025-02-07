<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>시설 관리</title>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/admin/css/admin_page.css"
    />
</head>
<body>
<div class="wrapper">
    <main class="main-content">
        <div class="top-controls">
            <div class="view-options">
                <button class="menu-item" onclick="location.href='/admin/user'">사용자 관리</button>
                <button class="menu-item active" onclick="location.href='/admin/place'">시설 관리</button>
                <button class="menu-item" onclick="location.href='/admin/hotdeal'">상품 관리</button>
            </div>
    <%--        <button class="add-button">시설 추가</button>--%>
        </div>

        <section class="content">
            <table class="facility-table">
                <thead>
                <tr>
                    <th>시설 번호</th>
                    <th>시설명</th>
                    <th>오픈 날짜</th>
                    <th>카테고리</th>
                    <th>삭제</th>
                </tr>
                </thead>
                <tbody>
                <!-- Example rows -->
                <c:forEach var="svo" items="${slist}">
                    <fmt:formatDate value="${svo.spotOpenDate}" pattern="yyyy-MM-dd" var="formattedDate" />
                    <tr>
                        <td>${svo.spotSeq}</td>
                        <td>${svo.spotName}</td>
                        <td>${formattedDate}</td>
                        <td>${svo.categoryName}</td>
                        <td><button class="delete-button" data-spot-id="${svo.spotSeq}">삭제하기</button></td>
                    </tr>
                </c:forEach>
                <!-- Add more rows dynamically -->
                </tbody>
            </table>

            <div class="pagination">
                <c:if test="${paging.startPage != 1}">
                    <a href="/admin/place?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}" class="pagination-button">&lt;</a>
                </c:if>

                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage}">
                            <button class="pagination-button active">${p}</button>
                        </c:when>
                        <c:otherwise>
                            <a href="/admin/place?nowPage=${p}&cntPerPage=${paging.cntPerPage}" class="pagination-button">${p}</a>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${paging.endPage != paging.lastPage}">
                    <a href="/admin/place?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}" class="pagination-button">&gt;</a>
                </c:if>
            </div>
        </section>
    </main>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/admin_place_delete.js"></script>
</body>
</html>
