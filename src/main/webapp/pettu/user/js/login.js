$(document).ready(function () {
    $("form").submit(function (e) {
        e.preventDefault();

        $.ajax({
            type: "POST",
            url: "/login",
            data: {
                email: $('#email').val(),
                password: $('#password').val()
            },
            success: function (response) {
                window.location.href = "/main";
            },
            error: function (xhr) {
                // 에러 메시지를 표시할 div가 없으면 생성
                if (!$('.error-message').length) {
                    $('input[name="password"]').after(
                        '<div class="error-message" style="color: red; font-size: 12px; margin-top: 5px;">아이디 또는 비밀번호가 오류 입니다.</div>'
                    );
                } else {
                    // 이미 있다면 메시지만 업데이트
                    $('.error-message').text('아이디 또는 비밀번호가 오류 입니다.');
                }
            }
        });
    });
});
