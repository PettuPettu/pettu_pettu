<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<link
        rel="stylesheet"
        type="text/css"
        href="${pageContext.request.contextPath}/layout/css/header.css"
/>
<header id="layout-header">
    <a id="header-logo">
        <img src="${pageContext.request.contextPath}/assets/layout/logo.svg" />
        <p>펫뚜펫뚜</p>
    </a>
    <div id="header-category">
        <a>핫딜</a>
        <a>시설</a>
        <a>펫BTI</a>
    </div>
    <div id="header-auth">
        <a>
            <div>
                <img src="${pageContext.request.contextPath}/assets/layout/mypage.svg" />
            </div>
            <p>마이페이지</p>
        </a>
    </div>
</header>