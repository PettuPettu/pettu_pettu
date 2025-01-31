<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시설 관리</title>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/admin/css/admin_page.css"
    />
</head>
<body>
<jsp:include page="../layout/header.jsp" />
<main class="main-content">
    <div class="top-controls">
        <div class="view-options">
            <button class="menu-item" onclick="location.href='/admin/user'">사용자 관리</button>
            <button class="menu-item active" onclick="location.href='/admin/place'">시설 관리</button>
            <button class="menu-item" onclick="location.href='/admin/hotdeal'">상품 관리</button>
        </div>
        <button class="add-button">시설 추가</button>
    </div>

    <section class="content">
        <table class="facility-table">
            <thead>
            <tr>
                <th>시설 번호</th>
                <th>시설명</th>
                <th>등록 날짜</th>
                <th>카테고리</th>
                <th>삭제</th>
            </tr>
            </thead>
            <tbody>
            <!-- Example rows -->
            <c:forEach begin="1" end="10">
                <tr>
                    <td>1</td>
                    <td>일동명이가페</td>
                    <td>2024/05/21 오후 2시</td>
                    <td>카페</td>
                    <td><button class="delete-button">삭제하기</button></td>
                </tr>
            </c:forEach>
            <!-- Add more rows dynamically -->
            </tbody>
        </table>
        <div class="pagination">
            <button class="pagination-button">&lt;</button>
            <button class="pagination-button active">1</button>
            <button class="pagination-button">2</button>
            <button class="pagination-button">...</button>
            <button class="pagination-button">10</button>
            <button class="pagination-button">&gt;</button>
        </div>
    </section>
</main>
<jsp:include page="../layout/footer.jsp" />
</body>
</html>
