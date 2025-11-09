<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📺모두의 전자</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Single+Day&family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
            margin: 0;
        }

        header {
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
            padding: 0;
            margin: 0;
        }

        header > div:first-child {
            max-width: 1200px;
            margin: 0 auto;
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header h1 {
            font-family: 'Single Day', cursive;
            font-size: 28px;
            margin: 0;
            color: #2d7cff;
        }

        .header_nav {
            display: flex;
            align-items: center;
            gap: 30px;
        }

        .header_nav .btn {
            color: #333;
            font-weight: 500;
            font-size: 16px;
            padding: 8px 16px;
            border: none;
            background: none;
            transition: color 0.2s;
        }

        .header_nav .btn:hover,
        .header_nav a:hover {
            color: #2d7cff;
        }

        .header_nav a {
            color: #333;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
            transition: color 0.2s;
        }

        .header_right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .header_right input[type="text"] {
            padding: 8px 16px;
            border: 1px solid #e0e0e0;
            border-radius: 20px;
            width: 250px;
            font-size: 14px;
            transition: all 0.3s;
            outline: none;
        }

        .header_right input[type="text"]:focus {
            border-color: #2d7cff;
            width: 300px;
        }

        .header_right_a {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .header_right_a a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: color 0.2s;
        }

        .header_right_a a:hover {
            color: #2d7cff;
        }

        .header_right_a span {
            color: #ddd;
        }

        .dropdown-menu {
            border: none;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 8px;
            padding: 8px 0;
        }

        .dropdown-item {
            padding: 8px 20px;
            color: #333;
            font-size: 14px;
            font-weight: 500;
            transition: background-color 0.2s;
        }

        .dropdown-item:hover {
            background-color: #f0f7ff;
            color: #2d7cff;
        }

        .btn-primary {
            background-color: #2d7cff;
            border: none;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 500;
            font-size: 14px;
            transition: background-color 0.2s;
        }

        .btn-primary:hover {
            background-color: #1b6aef;
        }

        hr {
            margin: 8px 0;
            border-color: #eee;
        }

        @media (max-width: 768px) {
            header > div:first-child {
                flex-direction: column;
                gap: 15px;
                padding: 15px;
            }

            .header_nav {
                flex-wrap: wrap;
                justify-content: center;
                gap: 10px;
            }

            .header_right {
                width: 100%;
                flex-direction: column;
                align-items: stretch;
            }

            .header_right input[type="text"] {
                width: 100%;
            }

            .header_right_a {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <header>
        <div>
            <a href="index.jsp" style="text-decoration: none;">
                <h1>모두의 전자</h1>
            </a>

            <nav class="header_nav">
                <div class="dropdown">
                    <button type="button" class="btn" data-toggle="dropdown">
                        커뮤니티 <span class="material-icons" style="font-size:1em;vertical-align:middle;">expand_more</span>
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/photo_board?cmd=photolist">제품</a>
                        <hr />
                        <a class="dropdown-item" href="<%=request.getContextPath()%>/housewarming?cmd=list">제품 후기</a>
                    </div>
                </div>
                <a href="#" onclick="warning()">스토어</a>
            </nav>

            <c:choose>
                <c:when test="${sessionScope.principal != null}">
                    <div class="header_right">
                        <input type="text" placeholder="모두의 전자 통합검색">
                        <div class="header_right_a">
                            <a href="/JspProject/user?cmd=logout">로그아웃</a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="header_right">
                        <input type="text" placeholder="모두의 전자 통합검색">
                        <div class="header_right_a">
                            <a href="/JspProject/user/loginForm.jsp">로그인</a>
                            <span>|</span>
                            <a href="/JspProject/user/joinForm.jsp">회원가입</a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="dropdown">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    글쓰기
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/photo_board?cmd=uploadForm">사진 올리기</a>
                    <hr />
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/housewarming?cmd=uploadForm">제품 글쓰기</a>
                </div>
            </div>
        </div>
    </header>
    <div style="margin-top: 80px;"><!-- 헤더가 fixed position이므로 본문 내용이 헤더 아래에 보이도록 여백 추가 --></div>
</body>
</html> 