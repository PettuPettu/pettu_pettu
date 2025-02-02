<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=request.getAttribute("errorCode")%> ERROR😢</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/favicon/favicon.ico">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/error/css/error.css" />
</head>
<body>
    <main id="error-container">
        <div>
            <h1 id="error-code"><%=request.getAttribute("errorCode")%> ERROR</h1>
            <p id="error-message"><%=request.getAttribute("errorMessage")%></p>
        </div>
        <p id="error-text"><%=request.getAttribute("errorText")%></p>
        <a id="error-btn" href="/">펫뚜펫뚜 홈으로</a>
    </main>
</body>
</html>
