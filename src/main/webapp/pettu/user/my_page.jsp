<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리 아이와의 행복한 반려생활, 펫뚜펫뚜</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layout/css/layout.css"/>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon/favicon.ico">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: #e8f0ed;
        }

        #header {
            width: 100%;
            background-color: #0A3A40;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        #main-content {
            flex: 1;
            padding: 20px;
            margin-bottom: 20px;
        }

        #footer {
            width: 100%;
            background-color: #0A3A40;
            margin-top: auto;
        }

        .container {
            display: flex;
            gap: 30px;
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
            padding: 0 20px;
        }

        .sidebar {
            width: 200px;
            background: white;
            border-radius: 15px;
            padding: 20px;
            position: sticky;
            top: 80px;
            height: fit-content;
        }

        .menu-item {
            padding: 15px;
            color: #333;
            font-size: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .menu-item:hover {
            background-color: #FFD1D1;
            border-radius: 8px;
        }

        .main-content {
            flex: 1;
            max-width: 800px;
        }

        .profile-section {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 20px;
        }

        .profile-container {
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        .profile-image {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 200px;
            height: 200px;
            flex-shrink: 0;
            border-radius: 15px;
            overflow: hidden;
        }

        .profile-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-image-change-btn {
            width: 100%;
            padding: 8px;
            background: #FFD1D1;
            border: none;
            border-radius: 4px;
            color: #666;
            font-size: 14px;
            cursor: pointer;
            margin-top: 10px;
        }

        .profile-image-buttons {
            display: none;
            gap: 4px;
            width: 100%;
            margin-top: 5px;
        }

        .profile-image-buttons button {
            flex: 1;
            padding: 6px;
            font-size: 14px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .profile-info {
            flex: 1;
        }

        .section-title {
            font-size: 20px;
            margin-bottom: 25px;
        }

        .info-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            gap: 10px;
        }

        .info-label {
            width: 80px;
            color: #333;
        }

        .info-value {
            flex: 1;
            padding: 8px 0;
            border: none;
            border-bottom: 1px solid #ddd;
            outline: none;
            font-size: 14px;
        }

        .edit-btn {
            background: #FFD1D1;
            border: none;
            padding: 5px 15px;
            border-radius: 5px;
            color: #666;
            cursor: pointer;
        }

        .pets-section {
            background: white;
            border-radius: 15px;
            padding: 30px;
        }

        .pets-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .add-pet-btn {
            background: #FFD1D1;
            border: none;
            padding: 6px 15px;
            border-radius: 5px;
            color: #666;
            cursor: pointer;
        }

        .pet-card {
            background: white;
            border: 1px solid #eee;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .pet-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-color: #FFD1D1;
        }

        .pet-header {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .pet-image-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
        }

        .pet-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            background: #fff;
        }

        .pet-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .change-image-btn {
            width: 100%;
            padding: 4px;
            background: #FFD1D1;
            border: none;
            border-radius: 4px;
            color: #666;
            font-size: 12px;
            cursor: pointer;
            display: none;
        }

        .image-buttons {
            display: none;
            gap: 4px;
            width: 100%;
        }

        .image-buttons button {
            flex: 1;
            padding: 4px;
            font-size: 12px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .pet-info {
            flex: 1;
        }

        .pet-name {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .pet-details {
            color: #666;
            font-size: 14px;
            line-height: 1.4;
        }

        .pet-form {
            display: none;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .form-row {
            margin-bottom: 15px;
        }

        .form-row label {
            display: inline-block;
            width: 80px;
            color: #333;
        }

        .form-row input {
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 200px;
        }

        .form-buttons {
            margin-top: 20px;
        }

        .save-btn {
            background: #FFD1D1;
            color: #666;
        }

        .cancel-btn {
            background: #eee;
            color: #666;
        }

        .save-btn, .cancel-btn {
            border: none;
            padding: 5px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        @media screen and (max-width: 768px) {
            .container {
                flex-direction: column;
                padding: 0 10px;
            }

            .sidebar {
                width: 100%;
                position: static;
                margin-bottom: 20px;
            }

            .main-content {
                width: 100%;
                max-width: 100%;
            }

            .profile-container {
                flex-direction: column;
                align-items: center;
            }

            .profile-image {
                width: 150px;
                height: 150px;
                margin-bottom: 20px;
            }

            .profile-info {
                width: 100%;
            }

            .form-row input {
                width: 100%;
            }
        }

        @media screen and (max-width: 480px) {
            .profile-section, .pets-section {
                padding: 15px;
            }

            .section-title {
                font-size: 18px;
            }

            .pet-image {
                width: 40px;
                height: 40px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="/pettu/layout/header.jsp"/>
<div id="main-content">
    <div class="container">
        <div class="sidebar">
            <div class="menu-item">사용자 정보</div>
            <div class="menu-item">내 리뷰</div>
        </div>
        <div class="main-content">
            <div class="profile-section">
                <div class="profile-container">
                    <div class="profile-image">
                        <img src="${pageContext.request.contextPath}/assets/images/profile.jpg" alt="프로필 이미지">
                        <button class="profile-image-change-btn">이미지 변경</button>
                        <div class="profile-image-buttons">
                            <button class="save-btn">저장</button>
                            <button class="cancel-btn">취소</button>
                        </div>
                    </div>
                    <div class="profile-info">
                        <h2 class="section-title">xxx님의 페이지</h2>
                        <div class="info-row">
                            <span class="info-label">이름</span>
                            <input type="text" class="info-value" value="홍길동" readonly>
                        </div>
                        <div class="info-row">
                            <span class="info-label">닉네임</span>
                            <input type="text" class="info-value" value="길동이" readonly>
                            <button class="edit-btn">수정</button>
                        </div>
                        <div class="info-row">
                            <span class="info-label">아이디</span>
                            <input type="text" class="info-value" value="hong123" readonly>
                        </div>
                        <div class="info-row">
                            <span class="info-label">이메일</span>
                            <input type="email" class="info-value" value="hong@example.com" readonly>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pets-section">
                <div class="pets-header">
                    <h2 class="section-title">내 반려동물</h2>
                    <button class="add-pet-btn">추가</button>
                </div>

                <div class="pet-card">
                    <div class="pet-header">
                        <div class="pet-image-container">
                            <div class="pet-image">
                                <img src="/pettu/assets/layout/github.svg" alt="복슬이">
                            </div>
                            <button class="change-image-btn">이미지 변경</button>
                            <div class="image-buttons">
                                <button class="save-btn">저장</button>
                                <button class="cancel-btn">취소</button>
                            </div>
                        </div>
                        <div class="pet-info">
                            <div class="pet-name">복슬이 ♂</div>
                            <div class="pet-details">
                                품종: 리트리버 2개월 · 3kg<br>
                                mbti: 검사 필요해요. 검사하러 가기
                            </div>
                        </div>
                        <button class="edit-btn" onclick="togglePetForm('petForm1')">수정</button>
                    </div>
                    <div id="petForm1" class="pet-form">
                        <div class="form-row">
                            <label>이름:</label>
                            <input type="text" value="복슬이">
                        </div>
                        <div class="form-row">
                            <label>품종:</label>
                            <input type="text" value="리트리버">
                        </div>
                        <div class="form-row">
                            <label>나이:</label>
                            <input type="text" value="2개월">
                        </div>
                        <div class="form-row">
                            <label>체중:</label>
                            <input type="text" value="3kg">
                        </div>
                        <div class="form-buttons">
                            <button class="save-btn" onclick="savePetForm('petForm1')">저장</button>
                            <button class="cancel-btn" onclick="cancelPetForm('petForm1')">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="footer">
    <jsp:include page="/pettu/layout/footer.jsp"/>
</div>

<script>
    function togglePetForm(formId) {
        const form = document.getElementById(formId);
        const petCard = form.closest('.pet-card');
        const changeImageBtn = petCard.querySelector('.change-image-btn');

        document.querySelectorAll('.pet-form').forEach(petForm => {
            petForm.style.display = 'none';
            petForm.closest('.pet-card').querySelector('.change-image-btn').style.display = 'none';
        });

        if (form.style.display === 'none' || form.style.display === '') {
            form.style.display = 'block';
            changeImageBtn.style.display = 'block';
        } else {
            form.style.display = 'none';
            changeImageBtn.style.display = 'none';
        }
    }

    function savePetForm(formId) {
        const form = document.getElementById(formId);
        const petCard = form.closest('.pet-card');
        const changeImageBtn = petCard.querySelector('.change-image-btn');

        form.style.display = 'none';
        changeImageBtn.style.display = 'none';
    }

    function cancelPetForm(formId) {
        const form = document.getElementById(formId);
        const petCard = form.closest('.pet-card');
        const changeImageBtn = petCard.querySelector('.change-image-btn');
        const originalImage = petCard.querySelector('.pet-image img').getAttribute('data-original');

        if (originalImage) {
            petCard.querySelector('.pet-image img').src = originalImage;
        }

        form.style.display = 'none';
        changeImageBtn.style.display = 'none';
    }

    // 이벤트 위임을 사용한 이미지 변경 처리
    $(document).on('click', '.change-image-btn', function(e) {
        e.stopPropagation();
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = 'image/*';
        input.click();

        const imageContainer = $(this).closest('.pet-image-container');

        input.onchange = function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = imageContainer.find('img');
                    if (!img.attr('data-original')) {
                        img.attr('data-original', img.attr('src'));
                    }
                    img.attr('src', e.target.result);
                    imageContainer.find('.image-buttons').show();
                };
                reader.readAsDataURL(file);
            }
        };
    });

    // 이미지 저장 버튼
    $(document).on('click', '.image-buttons .save-btn', function(e) {
        e.stopPropagation();
        const imageButtons = $(this).closest('.image-buttons');
        // 여기에 서버로 이미지를 전송하는 AJAX 코드를 추가할 수 있습니다
        imageButtons.hide();
    });

    // 이미지 취소 버튼
    $(document).on('click', '.image-buttons .cancel-btn', function(e) {
        e.stopPropagation();
        const imageContainer = $(this).closest('.pet-image-container');
        const img = imageContainer.find('img');
        const originalSrc = img.attr('data-original');
        if (originalSrc) {
            img.attr('src', originalSrc);
        }
        $(this).closest('.image-buttons').hide();
    });

    // 프로필 이미지 변경 처리
    $(document).on('click', '.profile-image-change-btn', function(e) {
        e.stopPropagation();
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = 'image/*';
        input.click();

        input.onchange = function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = $('.profile-image img');
                    if (!img.attr('data-original')) {
                        img.attr('data-original', img.attr('src'));
                    }
                    img.attr('src', e.target.result);
                    $('.profile-image-buttons').show();
                };
                reader.readAsDataURL(file);
            }
        };
    });

    // 프로필 이미지 저장/취소 버튼
    $(document).on('click', '.profile-image-buttons .save-btn', function(e) {
        e.stopPropagation();
        $(this).parent().hide();
    });

    $(document).on('click', '.profile-image-buttons .cancel-btn', function(e) {
        e.stopPropagation();
        const img = $('.profile-image img');
        const originalSrc = img.attr('data-original');
        if (originalSrc) {
            img.attr('src', originalSrc);
        }
        $(this).parent().hide();
    });
</script>

</body>
</html>

