<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti.css" />
</head>

<div class="petbti-container">
    <%
        String petbtiContent = (String) request.getAttribute("petbtiContent");
    %>
    <jsp:include page="<%= petbtiContent %>" />
</div>
