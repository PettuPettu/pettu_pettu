<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/common/css/slide.css" />
</head>

<%
    String attributeName = request.getParameter("attributeName");
    List<Map<String, Object>> products = (List<Map<String, Object>>) request.getAttribute(attributeName);

    String moreItemsButton  = request.getParameter("moreItemsButton");
    DecimalFormat priceFormatter = new DecimalFormat("#,###");
%>

<section class="main-slide-section" data-slide-index="<%= request.getParameter("slideIndex") %>">
    <div class="main-slide-header">
        <h1 class="main-slide-title">
            <img src="${pageContext.request.contextPath}/assets/common/hot.svg" />
            <span><%= request.getParameter("slideTitle") %></span>
        </h1>
        <%
            if (moreItemsButton != null) {
        %>
        <a href="<%= moreItemsButton %>">더 보기</a>
        <% } %>
    </div>
    <button type="button" class="main-slide-btn" data-direction="left" data-slide-index="<%= request.getParameter("slideIndex") %>">
        <img src="${pageContext.request.contextPath}/assets/main/slide-left-btn.svg" />
    </button>
    <button type="button" class="main-slide-btn" data-direction="right" data-slide-index="<%= request.getParameter("slideIndex") %>">
        <img src="${pageContext.request.contextPath}/assets/main/slide-right-btn.svg" />
    </button>
    <div class="main-slide-card-fragment-wrapper">
        <div class="main-slide-card-fragment">
            <%
                if (products != null) {
                    for (Map<String, Object> product : products) {
                        Object priceObj = product.get("price");
                        String formattedPrice = "";
                        if (priceObj != null) {
                            try {
                                formattedPrice = priceFormatter.format(Integer.parseInt(priceObj.toString()))+"원";
                            } catch (NumberFormatException e) {
                                formattedPrice = priceObj.toString();
                            }
                        }
            %>
            <article class="main-slide-card" onclick="location.href='<%= product.get("detailPath") %>'">
                <img src="<%= product.get("imagePath") %>" alt="상품 이미지">
                <span class="main-slide-card-category"><%= product.get("category") %></span>
                <div class="main-slide-card-desc">
                    <p class="main-slide-card-title">
                        <strong><%= product.get("title") %></strong>
                        <span><%= product.get("description") %></span>
                    </p>
                    <p class="main-slide-card-info">
                        <strong><%= formattedPrice %></strong>
                        <span><%= product.get("info") %></span>
                    </p>
                </div>
            </article>
            <%
                    }
                }
            %>

        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/common/js/slide.js"></script>
