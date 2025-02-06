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
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/review/css/store_paging_style.css" />

</head>
<body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/review/js/store_list.js"></script>
    <script src="${pageContext.request.contextPath}/review/js/store_search_paging.js"></script>

    <div class="container">
    <!-- HOT TOP Section -->
    <div class="hot-top-section" >

        <h1> 애견동반 HOT한 <span>TOP 3</span>  시설 </h1>
        <div class="slide-cards" id="top3-result-div">



        </div>
    </div>
    <!--  ---------------------- Search Section -------------------- -->
    <div class="search-section">


        <div class="filter-container">
            <!-- Filter Row -->
            <div class="filter-row">
                <div class="dropdown">
                    <button class="dropdown-button" onclick="toggleDropdown(event)">지역 검색</button>
                    <div class="dropdown-content" id="location-select-div">
                        <label><input type="checkbox" class="locationType" value="1" onchange="handleCheckboxChange(event)"> 서울특별시</label>
                        <label><input type="checkbox" class="locationType" value="31" onchange="handleCheckboxChange(event)"> 경기도</label>
                        <label><input type="checkbox" class="locationType" value="2" onchange="handleCheckboxChange(event)"> 인천광역시</label>
                        <label><input type="checkbox" class="locationType" value="35" onchange="handleCheckboxChange(event)"> 경상북도</label>
                        <label><input type="checkbox" class="locationType" value="32" onchange="handleCheckboxChange(event)"> 강원도</label>
                        <label><input type="checkbox" class="locationType" value="39" onchange="handleCheckboxChange(event)"> 전북</label>
                    </div>
                </div>

                <div class="dropdown">
                    <button class="dropdown-button" onclick="toggleDropdown(event)">카테고리 검색</button>
                    <div class="dropdown-content" id="category-select-div">
                        <label><input type="checkbox" class="categoryType" value="12" onchange="handleCheckboxChange(event)"> 관광지</label>
                        <label><input type="checkbox" class="categoryType" value="14" onchange="handleCheckboxChange(event)"> 문화시설</label>
                        <label><input type="checkbox" class="categoryType" value="15" onchange="handleCheckboxChange(event)"> 축제공연행사</label>
                        <label><input type="checkbox" class="categoryType" value="28" onchange="handleCheckboxChange(event)"> 레포츠</label>
                        <label><input type="checkbox" class="categoryType" value="32" onchange="handleCheckboxChange(event)"> 숙박</label>
                        <label><input type="checkbox" class="categoryType" value="38" onchange="handleCheckboxChange(event)"> 쇼핑</label>
                        <label><input type="checkbox" class="categoryType" value="39" onchange="handleCheckboxChange(event)"> 음식점</label>
                    </div>
                </div>
                <div class="dropdown">
                    <div class="search-bar">
                        <label><input type="text" id="search-input" placeholder="검색어를 입력하세요"></label>
                        <button style="background-color: #495a8c" onclick="findSpotName()">입력</button>
                    </div>
                </div>

            </div>

            <!-- Tags Section -->

            <div class="tag-flex-div">
                <div class="tags">
                    <!-- Tags will be dynamically created here -->

                </div>
                <div id="tag-btn-div">
                    <div class="search-bar">
                        <button id ="search-type-btn">검색</button>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!--  ---------------------- store list Section -------------------- -->
    <div class="second-section">
        <div id="spot-list-title-div">
            <img src="/assets/common/hot.svg" alt="불">
            <span id="spot-list-title"><strong> 애견동반 시설 모음집</strong></span>
            <img src="/assets/common/hot.svg" alt="불">
        </div>

        <div id="append-main-slide-section">
            <c:forEach items="${PAGING_SPOT_LIST}" var="spot" varStatus="status">
                <!-- 3개마다 새로운 div 추가 -->
                <c:if test="${status.index % 3 == 0}">
                    <div class="main-slide-section" > <!-- 새로운 div 시작 -->
                </c:if>

                <div class="main-slide-card" data-store-id="${spot.spotSeq}">
                    <!-- 이미지가 null일 경우 기본 이미지로 대체 -->
                    <img src="${spot.spotPicture != null && spot.spotPicture != '' ? spot.spotPicture : '/assets/layout/github.svg'}" alt="${spot.spotName != null ? spot.spotName : '정보 없음'} 이미지">

                    <div class="main-slide-card-desc">
                        <div class="spot-card-category"><span>#${spot.categoryName}</span></div>
                        <div>${spot.spotName != null ? spot.spotName : '정보 없음'}
                            <div class="main-slide-card-title">
                                <strong>${spot.spotLocation != null ? spot.spotLocation : '정보 없음'}</strong>
                            </div>
                            <div class="main-slide-card-info">
                                <strong>평점 ${spot.spotTotalAvgScore != null ? spot.spotTotalAvgScore : '정보 없음'}</strong>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 3개마다 새로운 div 닫기 -->
                <c:if test="${status.index % 3 == 2}">
                    </div> <!-- 새로운 div 종료 -->
                </c:if>
            </c:forEach>

        </div>
        <div id="pagination">

            ${SPOT_PAGING_BUTTON}
        </div>


        <div>
            <br>

        </div>
    </div>
</div>
</body>
</html>