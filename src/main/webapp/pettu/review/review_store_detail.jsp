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
    <title>가게 상세 </title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/review/css/store_detail.css" />

</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/review/js/store_detail.js"></script>


<div class="review-store-title-div" >

    <input type="text" id="spot-detail-spotName" value="${SPOT_ALL_INFO.spotName}" >

</div>

<div class="container">
    <div class="top-section">

        <div class="info-box">
            <div class="image-box flex-vertical-div">
                <div id="image-content-div">
                    <img src="${SPOT_ALL_INFO.spotPicture != null && SPOT_ALL_INFO.spotPicture != '' ? SPOT_ALL_INFO.spotPicture : '/assets/layout/github.svg'}" alt="카드 이미지 3" class="img-full">
                </div>

                <div class="place-score-div" data-score="${SPOT_ALL_INFO.spotTotalAvgScore}" >평점  : </div>

            </div>
            <c:if test="${not empty SPOT_ALL_INFO}">
                <div class="info-fields" >
                    <input type="hidden" id="spot-detail-spotSeq" value="${SPOT_ALL_INFO.spotSeq}" >
                    <div class="info-field" id="spot-detail-category"> #카테고리  |  ${SPOT_ALL_INFO.spotName}</div>
                    <div class="info-field" id="spot-detail-location" > #위치  |   ${SPOT_ALL_INFO.spotLocation}</div>
                    <div class="info-field" id="spot-detail-open-date"> #개업일  |   <fmt:formatDate value="${SPOT_ALL_INFO.spotOpenDate}" pattern="yyyy-MM-dd" />  </div>
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
                    <option value="basic">기본</option>
                    <option value="newest">최신순</option>
                    <option value="oldest">오래된 순</option>
                </select>
            </div>

            <div style="width:80%" onclick="scrollToSecondSection()"> 리뷰 목록</div>


            <c:if test="${not empty sessionScope.SESSION_USER_CODE}">
           <button class="add-button review-create-btn create-btn" data-page="/pettu/review/review_create_modal.jsp" data-width="fit-content"
                        data-height="fit-content">리뷰 작성</button>
            </c:if>

            <jsp:include page="/pettu/common/modal.jsp"/>


            <c:if test="${empty sessionScope.SESSION_USER_CODE}">
                <!-- userSeq가 세션에 없으면 로그인 페이지로 리디렉션 -->
                <button class="review-create-btn create-btn" onclick="location.href='/login?redirectURL=/review/detail/'+${SPOT_ALL_INFO.spotSeq}">
                    리뷰 작성
                </button>
            </c:if>



        </div>

        <div class="review-grid">

        </div>

        <div class="review-box-end-layer">
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function() {
        $(".add-button").click(function() {
            const page = $(this).data("page");
            console.log("Page URL:", page);
            $("#modal-body").load(page);
            $("#commonModal").show();
        });
    });
</script>

</body>
</html>
