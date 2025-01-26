<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>우리 아이와의 행복한 반려생활, 펫뚜펫뚜</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/layout/css/layout.css" />
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon/favicon.ico">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div id="main-content">
        <%
            String contentPage = (String) request.getAttribute("contentPage");
        %>
        <jsp:include page="<%= contentPage %>" />
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>