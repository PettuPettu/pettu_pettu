<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>사용자 상세 관리</title>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/admin/css/admin_user.css"
    />
</head>
<body>
    <main class="main-content">

        <div class="left-section">
            <div class="user-info">
                <h2>사용자 정보</h2>
                <div class="info-row"><strong>이름:</strong> ${user.userName}</div>
                <div class="info-row"><strong>닉네임:</strong> ${user.userNickname}</div>
                <div class="info-row"><strong>아이디(이메일):</strong> ${user.userEmail}</div>
            </div>

            <div class="pet-info">
                <h2>반려동물 정보</h2>
                <c:if test="${empty plist.petList}">
                    <p>등록된 반려동물이 없습니다.</p>
                </c:if>
                <c:if test="${not empty plist.petList}">
                    <c:forEach var="pet" items="${plist.petList}">
                        <div class="pet-card">
                            <img src="/images/${pet.fileVO.sysName}" alt="반려동물 사진">
                            <div class="pet-details">
                                <div class="pet-name">${pet.petName} <span>♀</span></div>
                                <div class="pet-breed">${pet.petDetailType}</div>
                                <div class="pet-mbti">${pet.petMbti}</div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>

        <div class="right-section">
            <div class="review-info">
                <h2>리뷰 목록</h2>
                <c:if test="${empty urlist.reviewReviewVOList}">
                    <p>리뷰 목록이 없습니다.</p>
                </c:if>
                <c:if test="${not empty urlist.reviewReviewVOList}">
                    <c:forEach var="rvo" items="${urlist.reviewReviewVOList}">
                        <div class="review-card">
                            <div class="review-title">${rvo.reviewTitle}</div>
                            <div class="review-text">${rvo.reviewContents}</div>
                            <button class="delete-button"
                                    data-review-id="${rvo.reviewSeq}"
                                    data-user-id="${param.userSeq}">삭제</button>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

            <c:choose>
                <c:when test="${user.userStatus == 1}">
                    <button class="deactivate-user" data-user-id="${user.userSeq}" data-user-status="1">사용자 비활성화</button>
                </c:when>
                <c:otherwise>
                    <button class="activate-user" data-user-id="${user.userSeq}" data-user-status="0">사용자 활성화</button>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/js/admin_user_detail.js"></script>
</body>
</html>
