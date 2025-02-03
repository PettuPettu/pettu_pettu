$(document).ready(function () {
    $("form").submit(function (e) {
        e.preventDefault();

        // URL에서 redirectURL 파라미터 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const redirectURL = urlParams.get('redirectURL');

        $.ajax({
            type: "POST",
            url: "/login",
            data: {
                email: $('#email').val(),
                password: $('#password').val(),
                redirectURL: redirectURL
            },
            success: function (response) {
                // response 객체에서 redirectURL 확인
                if (response.redirectURL) {
                    window.location.href = response.redirectURL;
                } else {
                    window.location.href = "/";
                }
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
