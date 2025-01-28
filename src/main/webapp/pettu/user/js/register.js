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
            url: '/api/register/check-email',
            method: 'POST',
            data: {email: email},
            success: function (response) {
                alert('인증번호가 발송되었습니다.');
                $('#emailError').hide();
                $('.verification-area').show();
            },
            error: function (xhr) {
                $('#emailError').text('이미 존재하는 회원입니다').show();
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

    // 닉네임 중복 확인
    $('#checkNicknameBtn').click(function () {
        const nickname = $('#nicknameInput').val();

        if (!nickname) {
            $('#nicknameError').text('닉네임을 입력해주세요').show();
            return;
        }

        $.ajax({
            url: '/api/register/check-nickname',
            method: 'POST',
            data: {nickname: nickname},
            success: function (response) {
                $('#nicknameInput').prop('readonly', true);
                $('#checkNicknameBtn').prop('disabled', true);
                $('#nicknameError').hide();
                isNicknameVerified = true; // 인증 성공 시 true로 변경
                alert('사용 가능한 닉네임입니다.');
            },
            error: function (xhr) {
                $('#nicknameError').text('이미 사용중인 닉네임입니다').show();
            }
        });
    });

    // 폼 제출
    $('#signupForm').submit(function (e) {
        e.preventDefault();

        const password1 = $('#password1').val();
        const password2 = $('#password2').val();
        const name = $('#nameInput').val();
        const nickname = $('#nicknameInput').val();

        // 필수 조건 검증
        if (!isEmailVerified) {
            alert('이메일 인증을 완료해주세요');
            return;
        }
        if (password1 !== password2) {
            alert('비밀번호가 일치하지 않습니다');
            return;
        }
        if (!isNicknameVerified) {
            alert('닉네임 인증을 완료해주세요');
            return;
        }


        // 서버 전송 데이터 구성
        const formData = {
            userEmail: $('#emailInput').val(),    // email -> userEmail
            userPw: password1,                    // password -> userPw
            userName: name,                       // name -> userName
            userNickname: nickname               // nickname -> userNickname
        };

        // AJAX 회원가입 요청
        $.ajax({
            url: '/api/register/save', // 실제 API 엔드포인트로 변경 필요
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                alert('회원가입이 완료되었습니다!');
                window.location.href = '/login'; // 로그인 페이지로 리다이렉트
            },
            error: function(xhr) {
                const errorMsg = xhr.responseJSON?.message || '회원가입에 실패했습니다';
                alert(errorMsg);
            }
        });
    });

});
