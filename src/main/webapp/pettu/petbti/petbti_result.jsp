<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti_result.css" />
</head>
    <div id="petbti-result-fragment">
        <div class="petbti-title">
            <h1></h1>
            <h3 class="petbti-result-subtitle"></h3>
        </div>
        <img class="petbti-result-img"/>
        <p class="petbti-result-tag"></p>
        <div class="petbti-result-explanation">
            <strong></strong> 성향을 가진 <b></b>은<br/>
        </div>
    </div>

    <div class="petbti-btn-fragment">
        <jsp:include page="petbti_btn.jsp">
            <jsp:param name="value" value="다시하기" />
            <jsp:param name="onclick" value="location.href='/petbti'" />
        </jsp:include>
        <jsp:include page="petbti_btn.jsp">
            <jsp:param name="value" value="이미지 저장" />
            <jsp:param name="onclick" value="saveImage()" />
        </jsp:include>
    </div>
<script type="module" src="${pageContext.request.contextPath}/petbti/js/petbti_result_ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="${pageContext.request.contextPath}/petbti/js/petbti_result_img.js"></script>