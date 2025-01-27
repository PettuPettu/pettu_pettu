<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>우리 아이와의 행복한 반려생활, 펫뚜펫뚜</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/layout/css/layout.css" />
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon/favicon.ico">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #fff;
            font-family: 'Arial', sans-serif;
        }

        #main-content {
            flex: 1 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .container {
            width: 450px;
            padding: 40px;
            text-align: center;
        }

        .logo {
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

        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .email-group, .nickname-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 5px;
        }

        .email-input, .nickname-input {
            flex: 1;
        }

        .verify-btn {
            background-color: #F6B8A9;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 15px;
            cursor: pointer;
            font-size: 14px;
        }

        .password-group {
            position: relative;
        }

        .password-group img {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .submit-btn {
            width: 100%;
            padding: 15px;
            background-color: #F6B8A9;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 30px;
        }

        .login-text {
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }

        .login-link {
            color: #9370DB;
            text-decoration: none;
            margin-left: 5px;
        }

        .verification-area {
            display: none;
            margin-top: 10px;
        }

        .error-message {
            color: #666;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        .footer-wrapper {
            flex-shrink: 0;
            width: 100%;
            margin-top: auto;
        }
    </style>
</head>
<body>
<div id="main-content">
    <div class="container">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/assets/layout/logo.svg" alt="로고" class="logo-image">
            <span class="logo-text">펫뚜펫뚜</span>
        </div>
        <h2>회원가입</h2>
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
            </div>

            <div class="input-group">
                <input type="text" id="nameInput" class="input-field" placeholder="이름을 입력하세요" required>
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

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $(document).ready(function() {
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

        $('.password-group img').click(function() {
            const input = $(this).siblings('input');
            input.attr('type', input.attr('type') === 'password' ? 'text' : 'password');
        });

        $('#sendVerificationBtn').click(function() {
            const email = $('#emailInput').val();

            if (!emailRegex.test(email)) {
                $('#emailError').text('올바른 이메일을 입력해주세요').show();
                return;
            }

            $.ajax({
                url: '/api/check-email',
                method: 'POST',
                data: { email: email },
                success: function(response) {
                    $('#emailError').hide();
                    $('.verification-area').show();
                    $.ajax({
                        url: '/api/send-verification',
                        method: 'POST',
                        data: { email: email },
                        success: function(response) {
                            alert('인증번호가 발송되었습니다.');
                        },
                        error: function(xhr) {
                            alert('인증번호 발송에 실패했습니다.');
                        }
                    });
                },
                error: function(xhr) {
                    $('#emailError').text('이미 존재하는 회원입니다').show();
                    $('.verification-area').hide();
                }
            });
        });

        $('#verifyCodeBtn').click(function() {
            $.ajax({
                url: '/api/verify-code',
                method: 'POST',
                data: {
                    email: $('#emailInput').val(),
                    code: $('#verificationCode').val()
                },
                success: function(response) {
                    $('#emailInput').prop('readonly', true);
                    $('.verification-area').hide();
                    $('#sendVerificationBtn').prop('disabled', true);
                    alert('이메일 인증이 완료되었습니다.');
                },
                error: function(xhr) {
                    alert('인증번호가 일치하지 않습니다.');
                }
            });
        });

        $('#checkNicknameBtn').click(function() {
            const nickname = $('#nicknameInput').val();

            if (!nickname) {
                $('#nicknameError').text('닉네임을 입력해주세요').show();
                return;
            }

            $.ajax({
                url: '/api/check-nickname',
                method: 'POST',
                data: { nickname: nickname },
                success: function(response) {
                    $('#nicknameInput').prop('readonly', true);
                    $('#checkNicknameBtn').prop('disabled', true);
                    $('#nicknameError').hide();
                    alert('사용 가능한 닉네임입니다.');
                },
                error: function(xhr) {
                    $('#nicknameError').text('이미 사용중인 닉네임입니다').show();
                }
            });
        });

        $('#signupForm').submit(function(e) {
            e.preventDefault();
            // 회원가입 폼 제출 처리 로직 추가
        });
    });
</script>
</body>
</html>
