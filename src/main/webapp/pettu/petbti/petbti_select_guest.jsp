<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti_select_guest.css" />
</head>
<div class="petbti-title">
    <h1>검사할 아이의<br/>이름을 입력해주세요</h1>
</div>
<input id="petbti-name-input" placeholder="이름을 입력해 주세요"/>
<div class="petbti-guest-btn-container">
    <p>로그인하면 내 아이의 MBTI를<br />저장할 수 있어요</p>
    <div class="petbti-btn-fragment">
        <jsp:include page="petbti_btn.jsp">
            <jsp:param name="value" value="시작하기" />
            <jsp:param name="onclick" value="savePetNameAndRedirect()" />
        </jsp:include>
        <jsp:include page="petbti_btn.jsp">
            <jsp:param name="value" value="로그인" />
            <jsp:param name="onclick" value="location.href='/login'" />
        </jsp:include>
    </div>
</div>

<script src="${pageContext.request.contextPath}/petbti/js/petbti_select_guest.js"></script>