<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <div class="menu-item">사용자 정보</div>
            <div class="menu-item">내 리뷰</div>
        </div>

        <div class="main-content">
            <div class="review-header">
                <h2 class="section-title">내 리뷰</h2>
                <div class="review-stats">
                    <span class="total-reviews">전체 리뷰: 4개</span>
                    <span class="average-rating">평균 평점: 4.5</span>
                </div>
            </div>

            <div class="review-filters">
                <select class="sort-by">
                    <option value="recent">최신순</option>
                    <option value="rating">평점순</option>
                </select>
            </div>

            <div class="review-list">
                <!-- 리뷰 카드 반복 -->
                <div class="review-card">
                    <div class="review-card-header">
                        <div class="reviewer-info">
                            <div class="reviewer-image"></div>
                            <div class="reviewer-details">
                                <span class="reviewer-name">홍길동</span>
                                <span class="review-date">2025.01.20</span>
                            </div>
                        </div>
                        <div class="rating">★★★★★</div>
                    </div>
                    <div class="review-content">
                        <p>강아지 미용이 정말 꼼꼼하게 잘되어있어요. 다음에도 재방문 하겠습니다!</p>
                    </div>
                    <div class="review-actions">
                        <button class="delete-btn">삭제</button>
                    </div>
                </div>
                <div class="review-card">
                    <div class="review-card-header">
                        <div class="reviewer-info">
                            <div class="reviewer-image"></div>
                            <div class="reviewer-details">
                                <span class="reviewer-name">홍길동</span>
                                <span class="review-date">2025.01.20</span>
                            </div>
                        </div>
                        <div class="rating">★★★★★</div>
                    </div>
                    <div class="review-content">
                        <p>강아지 미용이 정말 꼼꼼하게 잘되어있어요. 다음에도 재방문 하겠습니다!</p>
                    </div>
                    <div class="review-actions">
                        <button class="delete-btn">삭제</button>
                    </div>
                </div>
                <div class="review-card">
                    <div class="review-card-header">
                        <div class="reviewer-info">
                            <div class="reviewer-image"></div>
                            <div class="reviewer-details">
                                <span class="reviewer-name">홍길동</span>
                                <span class="review-date">2025.01.20</span>
                            </div>
                        </div>
                        <div class="rating">★★★★★</div>
                    </div>
                    <div class="review-content">
                        <p>강아지 미용이 정말 꼼꼼하게 잘되어있어요. 다음에도 재방문 하겠습니다!</p>
                    </div>
                    <div class="review-actions">
                        <button class="delete-btn">삭제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/pettu/layout/footer.jsp"/>


</body>
</html>
