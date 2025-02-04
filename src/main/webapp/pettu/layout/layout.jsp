<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
    <title>펫뚜펫뚜</title>
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
    <jsp:include page="${pageContext.request.contextPath}/pettu/common/loading.jsp" />
</body>
</html>