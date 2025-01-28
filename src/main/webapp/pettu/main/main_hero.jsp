<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<head>
  <meta charset="UTF-8" />
  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/main/css/main_hero.css" />
</head>

<section id="hero">
  <img src="${pageContext.request.contextPath}/assets/main/hero-img.svg"/>
  <div id="hero-desc">
    <h1>우리 아이와의 <strong>반려 생활</strong>을 <br/>편리하게 즐겨요</h1>
    <div id="hero-desc-btn"></div>
  </div>
</section>

<script src="${pageContext.request.contextPath}/main/js/render_hero_btn.js"></script>
<script src="${pageContext.request.contextPath}/main/js/active_hero_btn.js"></script>

