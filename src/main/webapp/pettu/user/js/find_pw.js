$(document).ready(function () {
    const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    let isEmailVerified = false;
    let isNicknameVerified = false;

    // 비밀번호 확인
    $('#password2').keyup(function() {
        const pass1 = $('#password1').val();
        const pass2 = $(this).val();

        if (pass2.length === 0) {
            $('#pwdMatchMessage').text('');
            return;
        }
        if (pass1 === pass2) {
            $('#pwdMatchMessage').text('비밀번호가 같습니다').css('color', 'green');
        } else {
            $('#pwdMatchMessage').text('비밀번호가 다릅니다').css('color', 'red');
        }
    });

    // 비밀번호 보기 버튼
    $('.password-group img').click(function () {
        const input = $(this).siblings('input');
        input.attr('type', input.attr('type') === 'password' ? 'text' : 'password');
    });

    // 이메일 인증 번호 발송
    $('#sendVerificationBtn').click(function () {
        const email = $('#emailInput').val();

        if (!emailRegex.test(email)) {
            $('#emailError').text('올바른 이메일을 입력해주세요').show();
            return;
        }

        $.ajax({
            url: '/api/password-reset/check-email',
            method: 'POST',
            data: {email: email},
            success: function (response) {
                alert('인증번호가 발송되었습니다.');
                $('#emailError').hide();
                $('.verification-area').show();
            },
            error: function (xhr) {
                $('#emailError').text('이메일 주소를 다시 확인해 주세요.').show();
                $('.verification-area').hide();
            }
        });
    });

    // 이메일 인증 번호 확인
    $('#verifyCodeBtn').click(function () {
        $.ajax({
            url: '/api/register/check-code',
            method: 'POST',
            data: {
                email: $('#emailInput').val(),
                code: $('#verificationCode').val()
            },
            success: function (response) {
                $('#emailInput').prop('readonly', true);
                $('#sendVerificationBtn').prop('disabled', true);
                $('#verificationCode').prop('readonly', true);
                $('#verifyCodeBtn').prop('disabled', true);
                isEmailVerified = true; // 인증 성청 시 true로 변경
                alert('이메일 인증이 완료되었습니다.');
            },
            error: function (xhr) {
                alert('인증번호가 일치하지 않습니다.');
            }
        });
    });



    // 폼 제출
    $('#signupForm').submit(function (e) {
        e.preventDefault();

        const password1 = $('#password1').val();
        const password2 = $('#password2').val();

        // 필수 조건 검증
        if (!isEmailVerified) {
            alert('이메일 인증을 완료해주세요');
            return;
        }
        if (password1 !== password2) {
            alert('비밀번호가 일치하지 않습니다');
            return;
        }


        // 서버 전송 데이터 구성
        const formData = {
            userEmail: $('#emailInput').val(),    // email -> userEmail
            userPw: password1,                    // password -> userPw
        };

        // AJAX 회원가입 요청
        $.ajax({
            url: '/api/password/reset',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                alert('비밀번호 변경이 완료되었습니다!');
                window.location.href = '/login'; // 로그인 페이지로 리다이렉트
            },
            error: function(xhr) {
                const errorMsg = xhr.responseJSON?.message || '비밀번호 변경에 실패하였습니다.';
                alert(errorMsg);
            }
        });
    });

});
