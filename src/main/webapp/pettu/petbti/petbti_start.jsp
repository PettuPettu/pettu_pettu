<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti_start.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti.css" />
</head>
<body>
    <div class="petbti-container">
        <div class="petbti-title">
            <h1>재미로 보는 <span id="title-pet">펫</span><span id="title-b">B</span><span id="title-t">T</span><span id="title-i">I</span></h1>
            <p>과학적 근거는 없어요 :)</p>
        </div>
        <div class="petbti-start-animation">
            <img id="animation-img"/>
            <span id="animation-mbti"></span>
        </div>
        <jsp:include page="petbti_btn.jsp">
            <jsp:param name="value" value="시작하기" />
        </jsp:include>
    </div>
</body>
<script type="module" src="${pageContext.request.contextPath}/petbti/js/petbti_start.js"></script>
