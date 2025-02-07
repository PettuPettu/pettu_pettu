<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>회원 관리</title>
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
                <c:forEach var="uvo" items="${ulist}">
                    <fmt:formatDate value="${uvo.userCreateAt}" pattern="yyyy-MM-dd" var="formattedDate" />
                    <tr>
                        <td>${uvo.userSeq}</td>
                        <td>${uvo.userNickname}</td>
                        <td>${formattedDate}</td>
                        <td>${uvo.userStatus}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/user/detail?userSeq=${uvo.userSeq}">보기</a></td>
                    </tr>
                </c:forEach>
                <!-- Add more rows dynamically -->
                </tbody>
            </table>
            <div class="pagination">
                <c:if test="${paging.startPage != 1}">
                    <a href="/admin/user?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}" class="pagination-button">&lt;</a>
                </c:if>

                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
                    <c:choose>
                        <c:when test="${p == paging.nowPage}">
                            <button class="pagination-button active">${p}</button>
                        </c:when>
                        <c:otherwise>
                            <a href="/admin/user?nowPage=${p}&cntPerPage=${paging.cntPerPage}" class="pagination-button">${p}</a>

                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${paging.endPage != paging.lastPage}">
                    <a href="/admin/user?nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage}" class="pagination-button">&gt;</a>
                </c:if>
            </div>
        </section>
    </main>
</div>
</body>
</html>
