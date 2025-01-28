<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8" />
  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/main/css/main.css" />
</head>
<body>
  <jsp:include page="main_hero.jsp" />
  <jsp:include page="../common/slide.jsp">
    <jsp:param name="attributeName" value="productsSlide" />
    <jsp:param name="slideTitle" value="할인율이 높은 반려동물 상품 정보" />
    <jsp:param name="slideIndex" value="0" />
    <jsp:param name="moreItemsButton" value="/list" />
  </jsp:include>
  <jsp:include page="../common/slide.jsp">
    <jsp:param name="attributeName" value="placeSlide" />
    <jsp:param name="slideTitle" value="최근에 등록된 반려동물 동반 시설 정보" />
    <jsp:param name="slideIndex" value="1" />
    <jsp:param name="moreItemsButton" value="/list" />
  </jsp:include>
</body>
</html>
