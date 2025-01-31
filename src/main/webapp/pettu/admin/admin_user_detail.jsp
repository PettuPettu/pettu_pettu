<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 상세 관리</title>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/admin/css/admin_user.css"
    />
</head>
<body>
    <jsp:include page="../layout/header.jsp" />

    <main class="main-content">

            <div class="left-section">
                <div class="user-info">
                    <h2>사용자 정보</h2>
                    <div class="info-row"><strong>이름:</strong> 홍길동</div>
                    <div class="info-row"><strong>닉네임:</strong> 길동이</div>
                    <div class="info-row"><strong>아이디:</strong> hong</div>
                    <div class="info-row"><strong>이메일:</strong> test@test.com</div>
                </div>

                <div class="pet-info">
                    <h2>반려동물 정보</h2>
                    <div class="pet-card">
                        <img src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MjFfMTUz/MDAxNTI0MjkzNzA1MzUx.M724HJZtHYfe-0lfFkLkL9wJI9SiKqpZTqLdcI2hjXog.kmN-oSyxtYicuXvphps90uSpdXtzphqKXxUIHdiqgyIg.JPEG.qw1460/IMG_3312.jpg?type=w800" alt="반려동물 사진">
                        <div class="pet-details">
                            <div class="pet-name">복순이 <span>♀</span></div>
                            <div class="pet-breed">리트리버</div>
                            <div class="pet-age">2개월 - 3kg</div>
                        </div>
                    </div>
                    <div class="pet-card">
                        <img src="https://mblogthumb-phinf.pstatic.net/MjAxODA0MjFfMTUz/MDAxNTI0MjkzNzA1MzUx.M724HJZtHYfe-0lfFkLkL9wJI9SiKqpZTqLdcI2hjXog.kmN-oSyxtYicuXvphps90uSpdXtzphqKXxUIHdiqgyIg.JPEG.qw1460/IMG_3312.jpg?type=w800" alt="반려동물 사진">
                        <div class="pet-details">
                            <div class="pet-name">복순이 <span>♀</span></div>
                            <div class="pet-breed">리트리버</div>
                            <div class="pet-age">2개월 - 3kg</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="right-section">
                <div class="review-info">
                    <h2>리뷰 목록</h2>
                    <div class="review-card">
                        <div class="review-title">🍴 좋은 카페</div>
                        <div class="review-text">정가가 없고 반려견 간식이 무료 제공됩니다! 정말 추천드려요.</div>
                        <button class="delete-button">삭제</button>
                    </div>
                    <div class="review-card">
                        <div class="review-title">🍴 좋은 카페</div>
                        <div class="review-text">정가가 없고 반려견 간식이 무료 제공됩니다! 정말 추천드려요.</div>
                        <button class="delete-button">삭제</button>
                    </div>
                </div>

                <button class="deactivate-user">사용자 비활성화</button>
            </div>
    </main>
    <jsp:include page="../layout/footer.jsp" />
</body>
</html>
