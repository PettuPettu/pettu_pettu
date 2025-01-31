<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2025-01-27
  Time: 오후 6:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" 	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" 	uri="http://java.sun.com/jsp/jstl/sql" %>

<head>
    <meta charset="UTF-8">
    <title>Spot List</title>

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/review/css/store_list.css" />

</head>
<body>
<script src="${pageContext.request.contextPath}/review/js/store_list.js"></script>

<div class="container">
    <!-- HOT TOP Section -->
    <div class="hot-top-section">
        <h1>펫뚜펫뚜 <span>1월</span> HOT TOP 3</h1>
        <div class="slide-cards">
            <div class="slide-card card-flex">
                <div class="top-img-contents">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/10/2445110_image2_1.jpg" alt="카드 이미지 3">
                </div>
                <div class="top-info-contents">
                    <div> 마루네 아침 카페 </div>
                    <div> 맛있는 쿠키가 있습니다 </div>
                    <div> 별점 5 점</div>
                    <div> 총 리뷰 수
                        이번달 30개 / 총 70개 </div>
                    <div> 카테고리 : 카페</div>

                </div>
            </div>

            <div class="slide-card card-flex">
                <div class="top-img-contents">
                    <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                </div>
                <div class="top-info-contents">
                    <div> 마루네 아침 카페 </div>
                    <div> 맛있는 쿠키가 있습니다 </div>
                    <div> 별점 5 점</div>
                    <div> 총 리뷰 수
                        이번달 30개 / 총 70개 </div>
                    <div> 카테고리 : 카페</div>

                </div>
            </div>

            <div class="slide-card card-flex">
                <div class="top-img-contents">
                    <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                </div>
                <div class="top-info-contents">
                    <div> 마루네 아침 카페 </div>
                    <div> 맛있는 쿠키가 있습니다 </div>
                    <div> 별점 5 점</div>
                    <div> 총 리뷰 수
                        이번달 30개 / 총 70개 </div>
                    <div> 카테고리 : 카페</div>

                </div>
            </div>
        </div>
    </div>
    <!--  ---------------------- Search Section -------------------- -->
    <div class="search-section">


        <div class="filter-container">
            <!-- Filter Row -->
            <div class="filter-row">
                <div class="dropdown">
                    <button class="dropdown-button" onclick="toggleDropdown(event)">지역 검색</button>
                    <div class="dropdown-content">
                        <label><input type="checkbox" value="서울전체" onchange="handleCheckboxChange(event)"> 서울전체</label>
                        <label><input type="checkbox" value="경기전체" onchange="handleCheckboxChange(event)"> 경기전체</label>
                        <label><input type="checkbox" value="인천전체" onchange="handleCheckboxChange(event)"> 인천전체</label>
                    </div>
                </div>

                <div class="dropdown">
                    <button class="dropdown-button" onclick="toggleDropdown(event)">카테고리 검색</button>
                    <div class="dropdown-content">
                        <label><input type="checkbox" value="카페" onchange="handleCheckboxChange(event)"> 카페</label>
                        <label><input type="checkbox" value="식당" onchange="handleCheckboxChange(event)"> 식당</label>
                        <label><input type="checkbox" value="맛집" onchange="handleCheckboxChange(event)"> 맛집</label>
                    </div>
                </div>

                <div class="search-bar">
                    <input type="text" placeholder="검색어를 입력하세요">
                    <button>검색</button>
                </div>
            </div>

            <!-- Tags Section -->
            <div class="tags">
                <!-- Tags will be dynamically created here -->
            </div>

        </div>

    </div>
    <!--  ---------------------- store list Section -------------------- -->
    <div class="second-section">
        <h1>펫뚜펫뚜 <span>1월</span> 가게 정보 LIST </h1>


        <div class="review-grid">

        </div>
        <h1>펫뚜펫뚜 spot LIST </h1>

        <div class="main-slide-section">
            <!-- 카드 1 -->
            <div class="main-slide-card">
                <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                <div class="main-slide-card-desc">
                    <div class="main-slide-card-title">
                        <strong>카드 1 제목</strong>
                        <span>카드 1 설명</span>
                    </div>
                    <div class="main-slide-card-info">
                        <strong>카드 1 정보</strong>
                        <span>추가 정보 1</span>
                    </div>
                </div>
            </div>

            <!-- 카드 2 -->
            <div class="main-slide-card">
                <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                <div class="main-slide-card-desc">
                    <div class="main-slide-card-title">
                        <strong>카드 2 제목</strong>
                        <span>카드 2 설명</span>
                    </div>
                    <div class="main-slide-card-info">
                        <strong>카드 2 정보</strong>
                        <span>추가 정보 2</span>
                    </div>
                </div>
            </div>

            <!-- 카드 3 -->
            <div class="main-slide-card">
                <img src="/assets/layout/github.svg" alt="카드 이미지 3">
                <div class="main-slide-card-desc">
                    <div class="main-slide-card-title">
                        <strong>카드 3 제목</strong>
                        <span>카드 3 설명</span>
                    </div>
                    <div class="main-slide-card-info">
                        <strong>카드 3 정보</strong>
                        <span>추가 정보 3</span>
                    </div>
                </div>
            </div>

        </div>
        <c:forEach items="${PAGING_SPOT_LIST}" var="spot">
                 <tr>
                     <td>${spot.spotName}</td>
                     <%--<td>${spot.spotLocation}</td>
                     <td>${spot.spotPicture}</td>--%>
                 </tr>
                <br>
        </c:forEach>
        <div>
            button
            <br>
            ${SPOT_PAGING_BUTTON}
        </div>
    </div>
</div>
</body>
</html>