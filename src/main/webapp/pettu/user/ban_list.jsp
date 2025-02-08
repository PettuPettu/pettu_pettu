<%--
  Created by IntelliJ IDEA.
  User: yeongbee
  Date: 25. 2. 4.
  Time: 오후 9:42
  수정: 왼쪽은 차단 IP 목록, 오른쪽은 ResultPbti와 DataCount 출력
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>IP 관리</title>
  <script>
    function deleteIp(clientIp) {
      if(confirm('이 IP를 차단 목록에서 삭제하시겠습니까?')) {
        location.href = '/admin/ip/delete?clientIp=' + clientIp;
      }
    }
  </script>
  <style>
    .container {
      display: flex;
      gap: 20px;
    }
    .left, .right {
      flex: 1;
    }
    table {
      border-collapse: collapse;
      width: 100%;
    }
    table, th, td {
      border: 1px solid #000;
    }
    th, td {
      padding: 8px;
      text-align: center;
    }
  </style>
</head>
<body>
<h2>차단 IP 관리</h2>
<div class="container">
  <!-- 왼쪽 영역: 차단 IP 관리 -->
  <div class="left">
    <!-- IP 입력 폼 -->
    <form action="/admin/ip" method="POST">
      <input type="text" name="clientIp" placeholder="차단할 IP 입력" required>
      <input type="submit" value="차단하기">
    </form>

    <!-- 차단된 IP 목록 -->
    <h3>차단된 IP 목록</h3>
    <table>
      <tr>
        <th>IP 주소</th>
        <th>관리</th>
      </tr>
      <c:forEach var="banIp" items="${banIpList}">
        <tr>
          <td>${banIp.clientIp}</td>
          <td>
            <button onclick="deleteIp('${banIp.clientIp}')">삭제</button>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>

  <!-- 오른쪽 영역: ResultPbti 및 DataCount 출력 -->
  <div class="right">
    <h4>일자별 방문수 Petbti</h4>
    <table>
      <tr>
        <th>날짜</th>
        <th>건수</th>
      </tr>
      <c:forEach var="Pbti" items="${ResultPbti}">
        <tr>
          <td>${Pbti.dateTime}</td>
          <td>${Pbti.cnt}</td>
        </tr>
      </c:forEach>
    </table>
    <h4>일자별 방문수</h4>
    <table>
      <tr>
        <th>날짜</th>
        <th>건수</th>
      </tr>
      <c:forEach var="data" items="${DataCount}">
        <tr>
          <td>${data.dateTime}</td>
          <td>${data.cnt}</td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>
</body>
</html>
