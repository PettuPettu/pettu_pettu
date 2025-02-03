<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2025-01-27
  Time: 오후 6:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="x" 	uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" 	uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>

    <meta charset="UTF-8">
    <title>가게 상세</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/review/css/store_detail.css" />

</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/review/js/store_detail.js"></script>


<div class="review-store-title-div" >
    <div >가게이름</div>

</div>

<div class="container">
    <div class="top-section">

        <div class="info-box">
            <div class="image-box flex-vertical-div">
                <div id="image-content-div">
                    <img src="/assets/layout/github.svg" alt="카드 이미지 3" class="img-full">
                </div>

                <div class="place-score-div">평점  :  ${SPOT_ALL_INFO.spotTotalAvgScore}</div>

            </div>
            <c:if test="${not empty SPOT_ALL_INFO}">
                <div class="info-fields" >
                    <input type="hidden" id="spot-detail-spotSeq" value="${SPOT_ALL_INFO.spotSeq}" >
                    <div class="info-field" id="spot-detail-category"> #카테고리  |  ${SPOT_ALL_INFO.spotName}</div>
                    <div class="info-field" id="spot-detail-location" > #위치  |   ${SPOT_ALL_INFO.spotLocation}</div>
                    <div class="info-field" id="spot-detail-open-date"> #개업일  |   ${SPOT_ALL_INFO.spotOpenDate}  </div>
                    <div class="info-contents" id="spot-detail-spotTotalAvgScore"> #총 리뷰 갯수  |  <c:out value="${fn:length(SPOT_ALL_INFO.reviewList)}" />
                    </div>
                    <div class="info-field" id="spot-detail-reviewMonthlyCnt">#한달동안 리뷰 갯수  |  ${SPOT_ALL_INFO.reviewMonthlyCnt}  </div>
                </div>
            </c:if>
        </div>
    </div>



    <div class="second-section" id="move-second-section" >

        <div class="review-store-name-div">
            <div>
                <label for="custom-select-box"></label>
                <select id="custom-select-box" name="sort-order">
                    <option value="newest">최신순</option>
                    <option value="oldest">오래된 순</option>
                </select>
            </div>

            <div style="width:80%" onclick="scrollToSecondSection()"> 리뷰 목록</div>


            <button class="openModal review-create-btn create-btn" id="create-review-modal-btn" data-page="/pettu/review/review_create_modal" data-width="fit-content"
                    data-height="fit-content">리뷰 작성 버튼</button>
            <jsp:include page="/pettu/common/modal.jsp"/>
        </div>

        <div class="review-grid">
            <!-- reviewList를 반복해서 출력 -->
            <c:if test="${not empty SPOT_ALL_INFO.reviewList}">
                <c:forEach items="${SPOT_ALL_INFO.reviewList}" var="review">
                    <div class="review-box">
                        <div class="review-image">
                            <!-- 리뷰 이미지 (예시로, 리뷰에 이미지가 있을 경우 출력) -->
                            <%--<c:if test="${not empty review.reviewFile}">
                                <img src="${pageContext.request.contextPath}/images/${review.reviewFile.sysName}" alt="Review Image">
                            </c:if>--%>
                        </div>

                        <div class="review-content">
                            <!-- 리뷰 제목 -->
                            <div class="review-title">${review.reviewTitle}</div>
                            <!-- 리뷰 내용 -->
                            <div class="review-text">${review.reviewContents}</div>
                            <!-- 리뷰 평점 -->
                            <div class="review-rating">
                                <c:forEach begin="1" end="${review.reviewScore}" varStatus="status">
                                    ★
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${empty SPOT_ALL_INFO.reviewList}">
                <div>작성한 리뷰가 없습니다.</div>
            </c:if>
        </div>

        <div class="review-box-end-layer">
        </div>
    </div>
</div>


</body>
</html>
