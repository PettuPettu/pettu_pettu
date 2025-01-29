<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti_question.css" />
</head>
<body>
<div class="petbti-container">
    <p class="petbti-progressbar"/>
    <div class="petbti-title">
        <h1>낯선 사람이나 동물을 만나면 다가가서 인사하려고 하나요?</h1>
    </div>
        <div class="petbti-question-btn">
            <jsp:include page="petbti_btn.jsp">
                <jsp:param name="value" value="네" />
            </jsp:include>
            <jsp:include page="petbti_btn.jsp">
                <jsp:param name="value" value="아니오" />
            </jsp:include>
        </div>
</div>
</body>
