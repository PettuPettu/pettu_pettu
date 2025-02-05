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
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <jsp:include page="../layout/header.jsp" />

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
    <jsp:include page="../layout/footer.jsp" />
    <script>
        $(document).ready(function() {
            $(".delete-button").click(function() {
                if (!confirm("삭제하시겠습니까?")) {
                    return;
                }

                // 버튼에서 reviewSeq와 userSeq 가져오기
                let reviewSeq = $(this).data("review-id");
                let userSeq = $(this).data("user-id");

                $.ajax({
                    type: "POST",
                    url: "/admin/user/detail/review/delete",
                    data: {
                        reviewSeq: reviewSeq,
                        userSeq: userSeq
                    },
                    success: function(response) {
                        alert("리뷰가 삭제되었습니다.");
                        location.reload();
                    },
                    error: function(xhr) {
                        alert("삭제 중 오류가 발생했습니다: " + xhr.responseText);
                    }
                });
            });
        });
    </script>
    <script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".deactivate-user, .activate-user").click(function() {
                if (!confirm("정말로 변경하시겠습니까?")) {
                    return;
                }

                let userSeq = $(this).data("user-id");      // 사용자 ID
                let userStatus = $(this).data("user-status"); // 현재 상태 (1=활성, 0=비활성)
                let newStatus = (userStatus === 1) ? 0 : 1;  // 변경할 상태
                let actionText = (newStatus === 1) ? "활성화" : "비활성화";

                $.ajax({
                    type: "POST",
                    url: "/admin/user/detail/status/update",
                    data: {
                        userSeq: userSeq,
                        userStatus: newStatus
                    },
                    success: function(response) {
                        alert("사용자가 " + actionText + "되었습니다.");
                        location.reload(); // 페이지 새로고침
                    },
                    error: function(xhr) {
                        alert("오류 발생: " + xhr.responseText);
                    }
                });
            });
        });
    </script>
</body>
</html>
