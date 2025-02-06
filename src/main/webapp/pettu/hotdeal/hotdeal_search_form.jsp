<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <link
            rel="stylesheet"
            type="text/css"
            href="${pageContext.request.contextPath}/hotdeal/css/hotdeal_search_form.css"
    />
</head>

<section class="search-section">
    <h1>🔥 내 반려동물을 위한 핫딜 정보 찾아드려요 🔥</h1>
    <form id="searchForm" action="/hotdeal/search" method="GET">
        <input type="text" name="keyword" class="search-bar" placeholder="검색어를 입력하세요">
        <button type="submit" class="search-button">🔍</button>
    </form>
</section>