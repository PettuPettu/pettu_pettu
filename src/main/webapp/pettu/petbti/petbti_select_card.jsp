<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/petbti/css/petbti_select_card.css" />
</head>
<%
    String petSeq = request.getParameter("pseq");
    String petImg = request.getParameter("img");
    String petMbti = request.getParameter("mbti");
    String petName = request.getParameter("name");
    String petGender = request.getParameter("gender");
    String petBreed = request.getParameter("breed");

    String birthStr = request.getParameter("birth");
    String birthYearStr = birthStr.substring(birthStr.length() - 4);
    int currentYear = new Date().getYear() + 1900;
    int birth = currentYear - Integer.parseInt(birthYearStr);

    String contextPath = request.getContextPath();

    String petImgPath;
    if (petImg == null || petImg.trim().isEmpty()) {
    petImgPath = contextPath + "/assets/layout/logo.svg"; // 기본 이미지 경로
    } else {
    petImgPath = "/images/" + petImg;
    }
%>

<article class="petbti-select-card-fragment" data-select="false">
    <img src=<%=petImgPath%>/>
    <div class="petbti-select-card-info-fragment">
        <p class="petbti-select-card-info">
            <span class="petbti-select-card-pseq"><%= petSeq%></span>
            <span class="petbti-select-card-mbti"><%= petMbti != "" ? petMbti : "검사 필요" %></span>
            <span class="petbti-select-card-name"><%= petName %></span>
            <% if(petGender.equals("1")) { %>
                <span class="gender-male">♂</span>
            <% }  else {%>
                <span class="gender-female">♀</span>
            <% } %>
        </p>
        <p class="petbti-select-card-breed">
            <%= petBreed %>
        </p>
        <p class="petbti-select-card-birth">
            <%= birth %>살
        </p>
    </div>
</article>

