<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>우리 아이와의 행복한 반려생활, 펫뚜펫뚜</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/login.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layout/css/layout.css"/>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon/favicon.ico">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/js/login.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<div id="main-content">
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/assets/layout/logo.svg" alt="로고" class="logo-image">
            <span class="logo-text">펫뚜펫뚜</span>
        </div>

        <form action="/login" method="POST">
            <input type="text" class="input-field" name="email" id="email" placeholder="Email">
            <input type="password" class="input-field" name="password" id="password" placeholder="Password">
            <div class="error-message"></div>  <!-- 여기에 추가 -->

            <div class="social-buttons">
                <a href="<c:url value='/login/GOOGLE'/>" class="social-login-btn">
                    <img src="/user/icon/google_login.svg" alt="구글 로그인">
                </a>
                <a href="<c:url value='/login/KAKAO'/>" class="social-login-btn">
                    <img src="/user/icon/kakao_login.png" alt="카카오 로그인">
                </a>
                <a href="<c:url value='/login/NAVER'/>" class="social-login-btn">
                    <img src="/user/icon/naver_login.png" alt="네이버 로그인">
                </a>
            </div>


            <button type="submit" class="login-btn">로그인</button>
        </form>

        <div class="links">
            <a href="/register">회원가입</a>
            <a href="/password-reset">비밀번호 찾기</a>
        </div>
    </div>
</div>

<c:if test="${not empty sessionScope.ANOTHER_EMAIL}">
    <script>
        alert('${sessionScope.ANOTHER_EMAIL}');
        <% session.removeAttribute("ANOTHER_EMAIL"); %>
    </script>
</c:if>

<jsp:include page="${pageContext.request.contextPath}/pettu/common/loading.jsp" />

<div class="footer-wrapper">
    <jsp:include page="/pettu/layout/footer.jsp"/>
</div>


</body>
</html>