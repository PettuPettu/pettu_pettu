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