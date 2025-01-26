<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 리뷰</title>
    <style>
        body {
            background-color: #e6f0f0;
            margin: 0;
            padding: 20px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .title-wrapper {
            text-align: center;
            margin-bottom: 20px;
        }

        .title {
            background-color: #ffb3b3;
            color: white;
            padding: 8px 25px;
            border-radius: 20px;
            display: inline-block;
            font-size: 15px;
        }

        .search-area {
            max-width: 600px;
            margin: 0 auto 25px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .search-box {
            position: relative;
            flex: 1;
        }

        .search-input {
            width: 100%;
            padding: 8px 35px 8px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .search-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            background: none;
            border: none;
            cursor: pointer;
        }

        .review-container {
            max-width: 600px;
            margin: 0 auto;
        }

        .review-card {
            background: white;
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            position: relative;
        }

        .store-img {
            width: 120px;
            height: 80px;
            border-radius: 8px;
            object-fit: cover;
            margin-right: 15px;
        }

        .store-info {
            flex: 1;
        }

        .store-number {
            font-size: 15px;
            font-weight: 500;
            margin: 0 0 5px 0;
        }

        .store-date {
            color: #888;
            font-size: 13px;
            margin: 0;
        }

        .delete-button {
            position: absolute;
            right: 15px;
            top: 15px;
            color: #ff9999;
            background: none;
            border: none;
            font-size: 16px;
            cursor: pointer;
            padding: 5px;
        }
    </style>
</head>
<body>
<div class="title-wrapper">
    <h1 class="title">내 리뷰</h1>
</div>

<div class="search-area">
    <div class="search-box">
        <input type="text" class="search-input" placeholder="게시글과 검색">
        <button class="search-icon">🔍</button>
    </div>
    <div class="search-box">
        <input type="text" class="search-input" placeholder="음식점 검색">
        <button class="search-icon">🔍</button>
    </div>
</div>

<div class="review-container">
    <c:forEach var="i" begin="1" end="3">
        <div class="review-card">
            <img src="store-image.jpg" class="store-img" alt="매장 이미지">
            <div class="store-info">
                <p class="store-number">S.2365</p>
                <p class="store-date">2024.5.3</p>
            </div>
            <button class="delete-button">×</button>
        </div>
    </c:forEach>
</div>
</body>
</html>
