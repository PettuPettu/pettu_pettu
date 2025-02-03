<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <div class="menu-item" onclick="location.href='/mypage'">사용자 정보</div>
            <div class="menu-item" onclick="location.href='/myreview'">내 리뷰</div>
        </div>


        <div class="main-content">
            <div class="profile-section">
                <div class="profile-container">
                    <div class="profile-image">
                        <div class="image-wrapper">
                            <c:choose>
                                <c:when test="${not empty userAndFileVO.fileVO.sysName}">
                                    <img src="/images/${userAndFileVO.fileVO.sysName}" alt="프로필 이미지">
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/assets/layout/github.svg" alt="기본 프로필 이미지">
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <button class="profile-image-change-btn">이미지 변경</button>
                        <div class="profile-image-buttons" style="display: none;">
                            <button type="button" class="save-btn">저장</button>
                            <button type="button" class="cancel-btn">취소</button>
                        </div>
                    </div>
                    <div class="profile-info">
                        <h2 class="section-title">내 정보</h2>
                        <div class="info-row">
                            <span class="info-label">이름</span>
                            <input type="text" class="info-value" value="${userAndFileVO.userName}" readonly>
                        </div>

                        <div class="info-row">
                            <span class="info-label">닉네임</span>
                            <input type="text" class="info-value nickname-input" value="${userAndFileVO.userNickname}" readonly>
                            <button class="edit-btn">수정</button>
                            <div class="nickname-buttons" style="display: none;">
                                <button type="button" class="save-nickname-btn">저장</button>
                                <button type="button" class="cancel-nickname-btn">취소</button>
                            </div>
                        </div>

                        <div class="info-row">
                            <span class="info-label">이메일</span>
                            <input type="text" class="info-value" value="${userAndFileVO.userEmail}" readonly>
                        </div>
                        <div class="info-row">
                            <span class="info-label">가입일</span>
                            <input type="text" class="info-value"
                                   value="<fmt:formatDate value='${userAndFileVO.userCreateAt}' pattern='yyyy년 MM월 dd일'/>"
                                   readonly>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pets-section">
                <div class="pets-header">
                    <h2 class="section-title">내 반려동물</h2>
                    <button class="add-pet-btn">추가</button>
                </div>
                <c:forEach var="pet" items="${userAndFileVO.petList}" varStatus="status">
                    <div class="pet-card" data-pet-seq="${pet.petSeq}">
                        <div class="pet-header">
                            <div class="pet-image-container">
                                <div class="pet-image">
                                    <c:choose>
                                        <c:when test="${not empty pet.fileVO.sysName}">
                                            <img src="/images/${pet.fileVO.sysName}" alt="펫 사진">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/assets/layout/github.svg" alt="기본 펫 사진">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <button class="change-image-btn">이미지 변경</button>
                            </div>

                            <div class="pet-info">
                                <div class="pet-name">${pet.petName} ${pet.petGender == 1 ? '♂' : '♀'}
                                        ${pet.petKing == 1 ? '👑' : ''}
                                </div>
                                <div class="pet-details">
                                    품종 : ${pet.petType} - ${pet.petDetailType}<br>
                                    생일 : <fmt:formatDate value='${pet.petBirth}' pattern='yyyy년 MM월 dd일'/><br>
                                    mbti: ${not empty pet.petMbti ? pet.petMbti : '검사 필요해요. <a href="/pettu/mbti/test">검사하러 가기</a>'}
                                </div>
                            </div>
                            <button class="edit-btn" onclick="togglePetForm('petForm${pet.petSeq}')">수정</button>
                            <button class="delete-btn" onclick="deletePet(${pet.petSeq})">삭제</button>
                        </div>
                        <div id="petForm${pet.petSeq}" class="pet-form">
                            <div class="form-row">
                                <label>이름:</label>
                                <input type="text" name="petName" value="${pet.petName}">
                            </div>
                            <div class="form-row">
                                <label>종류:</label>
                                <input type="text" name="petType" value="${pet.petType}">
                            </div>
                            <div class="form-row">
                                <label>품종:</label>
                                <input type="text" name="petDetailType" value="${pet.petDetailType}">
                            </div>
                            <div class="form-row">
                                <label>생일:</label>
                                <input type="date" name="petBirth" value="<fmt:formatDate value='${pet.petBirth}' pattern='yyyy-MM-dd'/>">
                            </div>
                        <%-- <div class="form-row">
                                <label>대표설정:</label>
                                <input type="checkbox" name="isRepresentative"/>
                            </div>--%>

                            <div class="form-buttons">
                                <button class="save-btn" onclick="savePetForm('petForm${pet.petSeq}')">저장</button>
                                <button class="cancel-btn" onclick="cancelPetForm('petForm${pet.petSeq}')">취소</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div id="footer">
    <!-- 모달 추가 -->
    <div id="addPetModal" class="modal" style="display: none;">
        <div class="modal-content">
            <h2>반려동물 추가</h2>
            <form id="addPetForm">
                <div class="form-row">
                    <label>이름:</label>
                    <input type="text" name="petName" required>
                </div>
                <div class="form-row">
                    <label>생일:</label>
                    <input type="date" name="petBirth" required>
                </div>
                <div class="form-row">
                    <label>품종:</label>
                    <input type="text" name="petType" required>
                </div>
                <div class="form-row">
                    <label>상세종류:</label>
                    <input type="text" name="petDetailType" required>
                </div>
                <div class="form-row">
                    <label>성별:</label>
                    <select name="petGender" required>
                        <option value="1">남자</option>
                        <option value="2">여자</option>
                    </select>
                </div>
                <div class="form-buttons">
                    <button type="button" class="save-btn" id="savePetBtn">저장</button>
                    <button type="button" class="cancel-btn" onclick="closeModal()">취소</button>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="/pettu/layout/footer.jsp"/>
</div>




<script>
    let userSeq = "${userAndFileVO.userSeq}";

</script>
</body>
</html>

