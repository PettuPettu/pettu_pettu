<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti_select_user.css" />
</head>
    <div class="petbti-title">
        <c:choose>
            <c:when test="${not empty petsList}">
                <h1>검사할 아이를<br/>선택해주세요</h1>
            </c:when>
            <c:otherwise>
                <h1>등록된 반려동물이<br/>없어요<br/><br/>반려동물을<br/>추가해주세요!😊</h1>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="petbti-select-pet">
    <c:forEach var="pet" items="${petsList}">
        <c:import url="${pageContext.request.contextPath}/pettu/petbti/petbti_select_card.jsp">
            <c:param name="pseq" value="${pet.petSeq}" />
            <c:param name="img" value="${pet.fileVO.sysName}" />
            <c:param name="mbti" value="${pet.petMbti}" />
            <c:param name="name" value="${pet.petName}" />
            <c:param name="gender" value="${pet.petGender}" />
            <c:param name="breed" value="${pet.petDetailType}" />
            <c:param name="birth" value="${pet.petBirth}" />
        </c:import>
    </c:forEach>
    </div>

    <c:choose>
        <c:when test="${not empty petsList}">
            <jsp:include page="petbti_btn.jsp">
                <jsp:param name="value" value="선택하기" />
                <jsp:param name="onclick" value="selectedPetAndRedirect()" />
            </jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="petbti_btn.jsp">
                <jsp:param name="value" value="추가하기" />
                <jsp:param name="onclick" value="location.href='/mypage'" />
            </jsp:include>
        </c:otherwise>
    </c:choose>

<script src="${pageContext.request.contextPath}/petbti/js/petbti_select_card.js"></script>
<script src="${pageContext.request.contextPath}/petbti/js/petbti_select_user.js"></script>