$(document).ready(function () {
    $("form").submit(function (e) {
        e.preventDefault();

        // 현재 폼 내의 제출 버튼을 찾아 disable
        const $loginButton = $(this).find(":submit");
        $loginButton.prop("disabled", true);

        // 1초 후에 버튼을 다시 enable
        setTimeout(function () {
            $loginButton.prop("disabled", false);
        }, 1000);

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
                // response 객체에서 redirectURL 확인 후 이동
                if (response.redirectURL) {
                    window.location.href = response.redirectURL;
                } else {
                    window.location.href = "/";
                }
            },
            error: function (xhr) {
                var errorMessage = "아이디 또는 비밀번호가 오류 입니다.";
                var response = xhr.responseText.trim();
                if (response === "errorcode_1") {
                    errorMessage = "휴먼회원 입니다. 비밀번호 찾기 및 변경 기능을 통해 해제할 수 있습니다.";
                }
                if (!$('.error-message').length) {
                    $('input[name="password"]').after(
                        '<div class="error-message" style="color: red; font-size: 12px; margin-top: 5px;">' + errorMessage + '</div>'
                    );
                } else {
                    $('.error-message').text(errorMessage);
                }
            }
        });
    });
});
