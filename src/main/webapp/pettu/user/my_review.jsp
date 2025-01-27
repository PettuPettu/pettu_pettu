<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>우리 아이와의 행복한 반려생활, 펫뚜펫뚜</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layout/css/layout.css" />
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
            font-family: 'Arial', sans-serif;
        }

        #header {
            width: 100%;
            background-color: #0A3A40;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        #main-content {
            flex: 1;
            padding: 20px;
            margin-top: 60px;
            margin-bottom: 60px;
        }

        #footer {
            width: 100%;
            background-color: #0A3A40;
            position: fixed;
            bottom: 0;
            left: 0;
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

        .review-header {
            background: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .review-stats {
            display: flex;
            gap: 20px;
            color: #666;
            flex-wrap: wrap;
        }

        .review-filters {
            margin-bottom: 20px;
        }

        .sort-by {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: white;
            width: 100%;
            max-width: 200px;
        }

        .review-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border: 1px solid transparent;
            cursor: pointer;
        }

        .review-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-color: #FFD1D1;
        }

        .review-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .reviewer-info {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .reviewer-image {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #ddd;
            flex-shrink: 0;
        }

        .reviewer-details {
            display: flex;
            flex-direction: column;
        }

        .reviewer-name {
            font-weight: bold;
        }

        .review-date {
            color: #666;
            font-size: 14px;
        }

        .rating {
            color: #FFD700;
            font-size: 18px;
        }

        .review-content {
            line-height: 1.6;
            color: #333;
            word-break: break-word;
        }

        .review-actions {
            margin-top: 15px;
            display: flex;
            justify-content: flex-end;
        }

        .delete-btn {
            background: #eee;
            border: none;
            padding: 5px 15px;
            border-radius: 5px;
            color: #666;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            background: #FFD1D1;
            transform: translateY(-1px);
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

            .review-card-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .review-stats {
                flex-direction: column;
                gap: 10px;
            }

            .sort-by {
                width: 100%;
                max-width: 100%;
            }

            #main-content {
                margin-top: 80px;
            }
        }

        @media screen and (max-width: 480px) {
            .review-card {
                padding: 15px;
            }

            .section-title {
                font-size: 18px;
            }

            .reviewer-image {
                width: 30px;
                height: 30px;
            }

            .rating {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
<jsp:include page="/pettu/layout/header.jsp" />
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
<jsp:include page="/pettu/layout/footer.jsp" />

<script>
    $(document).ready(function() {
        $('.sort-by').on('change', function(e) {
            const sortBy = e.target.value;
            // 정렬 로직 구현
        });

        $('.delete-btn').on('click', function() {
            if(confirm('리뷰를 삭제하시겠습니까?')) {
                // 삭제 로직 구현
            }
        });
    });
</script>
</body>
</html>
