<%--
  Created by IntelliJ IDEA.
  User: yeongbee
  Date: 2025. 1. 29.
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="POST" action="/upload" enctype="multipart/form-data">
    <input type="file" name="file" />
    <button type="submit">업로드</button>
</form>

</body>
</html>
