<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>우리 아이와의 행복한 반려생활, 펫뚜펫뚜</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layout/css/layout.css"/>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon/favicon.ico">
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        #main-content {
            flex: 1 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 450px;
            padding: 40px;
            text-align: center;
        }

        .logo-container {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin-bottom: 20px;
        }

        .logo-image {
            width: 50px;
            height: 50px;
        }

        .logo-text {
            font-size: 38px;
            color: #F6B8A9;
            font-weight: 500;
        }

        .input-field {
            width: 100%;
            padding: 15px;
            margin: 8px 0;
            border: 1px solid #F6B8A9;
            border-radius: 10px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .input-field:focus {
            outline: none;
            border-color: #F6B8A9;
        }

        .social-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin: 20px 0;
        }

        .social-login-btn {
            border: none;
            background: none;
            padding: 0;
            cursor: pointer;
        }

        .social-login-btn img {
            height: 45px;
            width: auto;
        }

        .login-btn {
            width: 100%;
            padding: 15px;
            background-color: #F6B8A9;
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 14px;
            cursor: pointer;
            margin: 20px 0;
        }

        .links {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 20px;
        }

        .links a {
            text-decoration: none;
            color: #666;
            font-size: 13px;
        }

        .footer-wrapper {
            flex-shrink: 0;
            width: 100%;
            margin-top: auto;
            background-color: #1A3B35;
        }

        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

    </style>
</head>
<body>
<div id="main-content">
    <div class="container">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/assets/layout/logo.svg" alt="로고" class="logo-image">
            <span class="logo-text">펫뚜펫뚜</span>
        </div>

        <form action="/pettu/user/login.jsp" method="post">
            <input type="text" class="input-field" name="email" placeholder="Email">
            <input type="password" class="input-field" name="password" placeholder="Password">

            <div class="social-buttons">
                <button type="button" class="social-login-btn">
                    <img src="/user/icon/kakao_login.png" alt="카카오 로그인">
                </button>
                <button type="button" class="social-login-btn">
                    <img src="/user/icon/naver_login.png" alt="네이버 로그인">
                </button>
                <button type="button" class="social-login-btn">
                    <img src="/user/icon/google_login.svg" alt="구글 로그인">
                </button>
            </div>

            <button type="submit" class="login-btn">로그인</button>
        </form>

        <div class="links">
            <a href="#">회원가입</a>
            <a href="#">비밀번호 찾기</a>
        </div>
    </div>
</div>
<div class="footer-wrapper">
    <jsp:include page="/pettu/layout/footer.jsp"/>
</div>
<script>
    $(document).ready(function() {
        // 로그인 폼 제출 시 이벤트 처리
        $("form").submit(function(e) {
            e.preventDefault(); // 기본 폼 제출 방지

            $.ajax({
                type: "POST",
                url: "/pettu/user/login.jsp",
                data: {
                    email: $('#email').val(),
                    password: $('#password').val()
                },
                success: function(response) {
                    if(response.trim() == "success") {
                        window.location.href = "/main"; // 메인 페이지로 리다이렉션
                    } else {
                        // 에러 메시지 표시를 위한 div 추가
                        if(!$('.error-message').length) {
                            $('input[name="password"]').after('<div class="error-message" style="color: red; font-size: 12px; margin-top: 5px;">아이디 또는 비밀번호가 틀립니다</div>');
                        }
                    }
                },
                error: function() {
                    alert("서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
                }
            });
        });
    });

</script>
</body>
</html>