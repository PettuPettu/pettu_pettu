<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti_select_user.css" />
</head>
<body>
<div class="petbti-container">
    <div class="petbti-title">
        <h1>검사할 아이를<br/>선택해주세요</h1>
    </div>
    <div class="petbti-select-pet">
        <jsp:include page="petbti_select_card.jsp" />
        <jsp:include page="petbti_select_card.jsp" />
        <jsp:include page="petbti_select_card.jsp" />
        <jsp:include page="petbti_select_card.jsp" />
        <jsp:include page="petbti_select_card.jsp" />
    </div>
    <jsp:include page="petbti_btn.jsp">
        <jsp:param name="value" value="선택하기" />
    </jsp:include>
</div>
</body>
<script src="${pageContext.request.contextPath}/petbti/js/petbti_select_card.js"></script>