<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<link
        rel="stylesheet"
        type="text/css"
        href="${pageContext.request.contextPath}/layout/css/header.css"
/>
<header id="layout-header">
    <a id="header-logo" href="/">
        <img src="${pageContext.request.contextPath}/assets/layout/logo.svg" />
        <p>펫뚜펫뚜</p>
    </a>
    <div id="header-category">
        <a href="/hotdeal/home">핫딜</a>
        <a href="/spot/list">시설</a>
        <a href="/petbti">펫BTI</a>
        <% if("ROLE_ADMIN".equals(String.valueOf(session.getAttribute("SESSION_USER_ROLE")))){%>
            <a href="/admin/user">어드민</a>
        <% } %>
    </div>
    <div id="header-auth">
        <% if(session.getAttribute("SESSION_USER_CODE") != null){%>
            <a href="/mypage">
                <div>
                    <img src="${pageContext.request.contextPath}/assets/layout/mypage.svg" />
                </div>
                <p>마이페이지</p>
            </a>
            <a href="/logout">
                <div>
                    <img src="${pageContext.request.contextPath}/assets/layout/logout.svg" />
                </div>
                <p>로그아웃</p>
            </a>
        <% } else { %>
            <a href="/login">
                <div>
                    <img src="${pageContext.request.contextPath}/assets/layout/login.svg" />
                </div>
                <p>로그인</p>
            </a>
        <% } %>
    </div>
</header>