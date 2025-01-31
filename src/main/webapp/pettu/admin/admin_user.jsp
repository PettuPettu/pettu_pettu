<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리</title>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/admin/css/admin_page.css"
    />
</head>
<body>
<div class="wrapper">
<jsp:include page="../layout/header.jsp" />
<main class="main-content">
    <div class="top-controls">
        <div class="view-options">
            <button class="menu-item active" onclick="location.href='/admin/user'">사용자 관리</button>
            <button class="menu-item" onclick="location.href='/admin/place'">시설 관리</button>
            <button class="menu-item" onclick="location.href='/admin/hotdeal'">상품 관리</button>
        </div>
    </div>

    <section class="content">
        <table class="facility-table">
            <thead>
            <tr>
                <th>사용자 번호</th>
                <th>닉네임</th>
                <th>가입 날짜</th>
                <th>상태</th>
                <th>상세 보기</th>
            </tr>
            </thead>
            <tbody>
            <!-- Example rows -->
            <c:forEach begin="1" end="10">
                <tr>
                    <td>1</td>
                    <td>홍길동</td>
                    <td>2024/05/21 오후 2시</td>
                    <td>활성화</td>
                    <td><a href="dsds">보기</a></button></td>
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
</div>
</body>
</html>
