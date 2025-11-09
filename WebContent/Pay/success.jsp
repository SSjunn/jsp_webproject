<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제 성공</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background: #fff;
            font-family: 'Noto Sans KR', sans-serif;
            color: #222;
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .container {
            margin-top: 60px;
            text-align: center;
        }
        .circle-check {
            width: 110px;
            height: 110px;
            background: #6fd943;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 28px auto;
            box-shadow: 0 4px 16px #6fd94333;
        }
        .circle-check svg {
            width: 60px;
            height: 60px;
            color: #fff;
        }
        .success-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 28px;
            margin-top: 0;
        }
        .info-table {
            margin: 0 auto 36px auto;
            font-size: 1.08rem;
            color: #888;
        }
        .info-table td {
            padding: 6px 12px;
        }
        .info-table .label {
            color: #888;
            font-weight: 400;
            text-align: right;
        }
        .info-table .value {
            color: #222;
            font-weight: 500;
            text-align: left;
        }
        .btn-back {
            display: inline-flex;
            align-items: center;
            padding: 12px 36px;
            font-size: 1.1rem;
            color: #6fd943;
            background: #fff;
            border: 2px solid #6fd943;
            border-radius: 12px;
            cursor: pointer;
            font-weight: 500;
            text-decoration: none;
            transition: background 0.15s, color 0.15s;
        }
        .btn-back:hover {
            background: #6fd943;
            color: #fff;
        }
        .btn-back svg {
            margin-right: 8px;
            width: 22px;
            height: 22px;
            vertical-align: middle;
        }
        @media (max-width: 500px) {
            .container { margin-top: 20px; }
            .circle-check { width: 80px; height: 80px; }
            .circle-check svg { width: 40px; height: 40px; }
            .success-title { font-size: 1.1rem; }
            .btn-back { padding: 10px 18px; font-size: 1rem; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="circle-check">
            <!-- 체크 SVG 아이콘 -->
            <svg viewBox="0 0 52 52" fill="none">
                <circle cx="26" cy="26" r="26" fill="none"/>
                <path d="M16 27.5L23 34.5L36 19.5" stroke="white" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </div>
        <div class="success-title">결제에 성공하였습니다</div>
        <table class="info-table">
            <tr>
                <td class="label">아임포트 번호</td>
                <td class="value">imp_578506020494</td>
            </tr>
            <tr>
                <td class="label">주문번호</td>
                <td class="value">mid_1612510500867</td>
            </tr>
        </table>
        <a href="<%=request.getContextPath()%>/index2.jsp" class="btn-back">
            <!-- 왼쪽 화살표 SVG -->
            <svg viewBox="0 0 24 24" fill="none">
                <path d="M15 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            돌아가기
        </a>
    </div>
</body>
</html>
