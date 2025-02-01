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
    <script src="${pageContext.request.contextPath}/user/js/find_pw.js"></script>


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
                    <input type="email" id="emailInput" class="input-field email-input" placeholder="Email">
                    <button type="button" id="sendVerificationBtn" class="verify-btn">인증번호 발송</button>
                </div>
                <div class="error-message" id="emailError"></div>
                <div class="verification-area">
                    <div class="email-group">
                        <input type="text" id="verificationCode" class="input-field" placeholder="인증번호 입력">
                        <button type="button" id="verifyCodeBtn" class="verify-btn">인증확인</button>
                    </div>
                </div>
            </div>

            <div class="input-group">
                <div class="password-group">
                    <input type="password" id="password1" class="input-field" placeholder="Password">
                    <img src="/user/icon/see_pw.svg" alt="비밀번호 보기">
                </div>
            </div>

            <div class="input-group">
                <div class="password-group">
                    <input type="password" id="password2" class="input-field" placeholder="Password">
                    <img src="/user/icon/see_pw.svg" alt="비밀번호 보기">
                </div>
                <div id="pwdMatchMessage"></div>
            </div>
            
            <button type="submit" class="submit-btn">변경하기</button>
        </form>
    </div>
</div>
<div class="footer-wrapper">
    <jsp:include page="/pettu/layout/footer.jsp" />
</div>
</body>
</html>
