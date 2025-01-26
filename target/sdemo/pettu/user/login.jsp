<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>펫뚜펫뚜 로그인</title>
    <style>
        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        .logo {
            color: #F5A9A9;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #F5C4C4;
            border: none;
            border-radius: 5px;
            color: white;
            margin-top: 20px;
            cursor: pointer;
        }
        .social-login {
            margin: 10px 0;
        }
        .kakao-btn {
            background-color: #FEE500;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            margin-right: 10px;
        }
        .naver-btn {
            background-color: #03C75A;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: white;
        }
        .links {
            margin-top: 20px;
        }
        .links a {
            margin: 0 10px;
            text-decoration: none;
            color: #666;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo">🐾 펫뚜펫뚜</div>
    <form action="login.jsp" method="post">
        <input type="email" class="input-field" name="email" placeholder="get@ziontutorial.com">
        <input type="password" class="input-field" name="password" placeholder="Password">

        <div class="social-login">
            <button type="button" class="kakao-btn">카카오 로그인</button>
            <button type="button" class="naver-btn">네이버 로그인</button>
        </div>

        <button type="submit" class="login-btn">로그인</button>
    </form>

    <div class="links">
        <a href="#">회원가입</a>
        <a href="#">비밀번호 찾기</a>
    </div>
</div>
</body>
</html>
