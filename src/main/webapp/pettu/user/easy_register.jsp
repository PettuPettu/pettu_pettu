<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>우리 아이와의 행복한 반려생활, 펫뚜펫뚜</title>
    <!-- CSS 파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/register.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layout/css/layout.css" />
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon/favicon.ico">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- JS 파일 -->
    <script src="${pageContext.request.contextPath}/user/js/easy_register.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
<div id="main-content">
    <div class="container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/assets/layout/logo.svg" alt="로고" class="logo-image">
            <span class="logo-text">펫뚜펫뚜</span>
        </div>
        <h2>회원가입</h2>
        <br>
        <form id="signupForm">
            <div class="input-group">
                <div class="email-group">
                    <input type="email" id="emailInput" class="input-field email-input"
                           value="${sessionScope.SESS_EMAIL}" readonly placeholder="Email">
                </div>
            </div>
            <div class="input-group">
                <input type="text" id="nameInput" class="input-field"
                       value="${sessionScope.SESS_NAME}" readonly placeholder="이름을 입력하세요">
            </div>

            <div class="input-group">
                <div class="nickname-group">
                    <input type="text" id="nicknameInput" class="input-field nickname-input" placeholder="닉네임">
                    <button type="button" id="checkNicknameBtn" class="verify-btn">중복확인</button>
                </div>
                <div class="error-message" id="nicknameError"></div>
            </div>

            <button type="submit" class="submit-btn">회원가입</button>

            <div class="login-text">
                이미 회원이신가요?<a href="#" class="login-link">로그인</a>
            </div>
        </form>
    </div>
</div>
<div class="footer-wrapper">
    <jsp:include page="/pettu/layout/footer.jsp" />
</div>
</body>
</html>
