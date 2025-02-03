<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리 아이와의 행복한 반려생활, 펫뚜펫뚜</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/my_review.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layout/css/layout.css"/>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon/favicon.ico">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/user/js/my_review.js"></script>

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
            <div class="review-header">
                <h2 class="section-title">내 리뷰</h2>
                <div class="review-stats">
                    <span>전체 리뷰: ${fn:length(reviewList.reviewReviewVOList)}개</span>
                    <span>평균 평점: <fmt:formatNumber value="${averageScore}" pattern="0.0"/></span>
                </div>

            </div>

            <div class="review-filters">
                <select class="sort-by">
                    <option value="latest">최신순</option>
                    <option value="oldest">등록순</option>
                    <option value="rating">평점순</option>
                </select>

            </div>

            <div class="review-list">
                <c:if test="${not empty reviewList.reviewReviewVOList}">
                    <c:forEach items="${reviewList.reviewReviewVOList}" var="review">
                        <div class="review-card">
                            <div class="review-card-header">
                                <div class="reviewer-info">
                                    <div class="reviewer-image">
                                    <c:choose>
                                        <c:when test="${not empty reviewList.myReviewFileVO.sysName}">
                                            <img src="/images/${reviewList.myReviewFileVO.sysName}" alt="Profile" width="40" height="40">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${pageContext.request.contextPath}/assets/layout/github.svg" alt="Profile" width="40" height="40">
                                        </c:otherwise>
                                    </c:choose>
                                    </div>

                                    <div class="reviewer-details">
                                        <span class="reviewer-name">${reviewList.userNickname}</span>
                                        <span class="review-date">
                                            <fmt:formatDate value="${review.reviewCreateDate}" pattern="yyyy년 MM월 dd일"/>
                                        </span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <c:forEach begin="1" end="${review.reviewScore}">★</c:forEach>
                                </div>
                            </div>
                            <div class="review-body ${not empty review.reviewFile.sysName ? 'has-image' : ''}">
                                <c:if test="${not empty review.reviewFile.sysName}">
                                    <img src="${pageContext.request.contextPath}/images/${review.reviewFile.sysName}"
                                         alt="Review Image" class="review-image">
                                </c:if>
                                <div class="review-text-content">
                                    <div class="review-title">
                                        <a href="${pageContext.request.contextPath}/review/detail/${review.spotSeq}"
                                           class="review-title-link"
                                           title="클릭하여 상세 페이지로 이동">
                                                ${review.reviewTitle}
                                        </a>
                                    </div>
                                    <div class="review-content">
                                        <p>${review.reviewContents}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="review-actions">
                                <button class="delete-btn" data-review-id="${review.reviewSeq}">삭제</button>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty reviewList.reviewReviewVOList}">
                    <p>작성한 리뷰가 없습니다.</p>
                </c:if>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/pettu/layout/footer.jsp"/>

<script>
    const userSeq = ${reviewList.userSeq};
</script>
</body>
</html>
