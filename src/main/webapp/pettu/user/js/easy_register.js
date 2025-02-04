$(document).ready(function () {

    let isNicknameVerified = false;

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

        const nickname = $('#nicknameInput').val();
        const name = $('#nameInput').val();
        // 필수 조건 검증
        if (!isNicknameVerified) {
            alert('닉네임 인증을 완료해주세요');
            return;
        }


        // 서버 전송 데이터 구성
        const formData = {
            userEmail: $('#emailInput').val(),    // email -> userEmail
            userName: name,                       // name -> userName
            userNickname: nickname               // nickname -> userNickname
        };

        // AJAX 회원가입 요청
        $.ajax({
            url: '/easy/register',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                alert('회원가입이 완료되었습니다!');
                window.location.href = '/login'; // 로그인 페이지로 리다이렉트
            },
            error: function(xhr) {
                const errorMsg = xhr.responseJSON?.message || '회원가입에 실패했습니다. 다시 작성하십시오.';
                alert(errorMsg);
            }
        });
    });

});
