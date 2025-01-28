<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리 아이와의 행복한 반려생활, 펫뚜펫뚜</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/my_page.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layout/css/layout.css"/>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon/favicon.ico">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/js/my_page.js"></script>

    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: #e8f0ed;
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
</body>
</html>

