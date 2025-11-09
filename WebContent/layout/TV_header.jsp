<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .header {
        background: #fff;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        position: fixed;
        width: 100%;
        top: 0;
        z-index: 1000;
    }

    .header-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 15px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .logo {
        font-size: 24px;
        font-weight: 700;
        color: #2d7cff;
        text-decoration: none;
    }

    .nav-menu {
        display: flex;
        gap: 30px;
        align-items: center;
    }

    .nav-menu a {
        color: #333;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.2s;
    }

    .nav-menu a:hover {
        color: #2d7cff;
    }

    .header-right {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .search-bar {
        position: relative;
    }

    .search-bar input {
        padding: 8px 16px;
        border: 1px solid #e0e0e0;
        border-radius: 20px;
        width: 250px;
        font-size: 14px;
        transition: all 0.3s;
    }

    .search-bar input:focus {
        outline: none;
        border-color: #2d7cff;
        width: 300px;
    }

    .user-menu a {
        color: #666;
        text-decoration: none;
        font-size: 14px;
        font-weight: 500;
        transition: color 0.2s;
    }

    .user-menu a:hover {
        color: #2d7cff;
    }

    @media (max-width: 768px) {
        .header-container {
            flex-direction: column;
            gap: 15px;
        }

        .nav-menu {
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .header-right {
            width: 100%;
            justify-content: center;
        }

        .search-bar input {
            width: 100%;
        }
    }
</style>

<header class="header">
    <div class="header-container">
        <a href="${pageContext.request.contextPath}/" class="logo">모두의 전자</a>
        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/">홈</a>
            <a href="${pageContext.request.contextPath}/tv">TV</a>
            <a href="${pageContext.request.contextPath}/laptop">노트북</a>
            <a href="${pageContext.request.contextPath}/smartphone">스마트폰</a>
            <a href="${pageContext.request.contextPath}/accessory">액세서리</a>
        </nav>
        <div class="header-right">
            <div class="search-bar">
                <input type="text" placeholder="검색어를 입력하세요">
            </div>
<%--             <div class="user-menu">
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/user/login">로그인</a>
                        <span style="color: #ddd; margin: 0 8px;">|</span>
                        <a href="${pageContext.request.contextPath}/user/register">회원가입</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a>
                        <span style="color: #ddd; margin: 0 8px;">|</span>
                        <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
                    </c:otherwise>
                </c:choose>
            </div> --%>
        </div>
    </div>
</header> 