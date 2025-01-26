<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Test Entity List</title>
</head>
<body>
<h2>Test Entity 목록</h2>

<table border="1">
  <thead>
  <tr>
    <th>ID</th>
    <th>Password</th>
    <th>Username</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${aLl}" var="test">
    <tr>
      <td>${test.id}</td>
      <td>${test.pw}</td>
      <td>${test.username}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
