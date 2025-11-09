<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="https://js.stripe.com/v3/"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모두의 전자</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <%@ include file="../layout/TV_style.jsp" %>
</head>
<body>
    <%@ include file="../layout/TV_header.jsp" %>

    <main class="main-content">
        <div class="content-container">
            <section class="hero-section">
                <div class="hero-text">
                    <h1>최고의 전자제품을<br>모두의 전자에서 만나보세요</h1>
                    <p>다양한 브랜드의 프리미엄 전자제품을<br>특별한 가격으로 제공합니다.</p>
                    <button class="buy-button">쇼핑하러 가기</button>
                </div>
                <div class="hero-image">
                    <img src="${pageContext.request.contextPath}/images/tv-main.png" alt="TV">
                </div>
            </section>

            <div class="product-grid">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/images/samsung-tv.jpg" alt="삼성 TV" class="product-image">
                    <div class="product-info">
                        <div class="product-title">삼성 65인치 4K UHD TV</div>
                        <div class="product-description">
                            - Crystal UHD 디스플레이<br>
                            - AI 화질 최적화<br>
                            - 스마트 허브 탑재
                        </div>
                        <div class="product-price">1,890,000원</div>
                        <form action="${pageContext.request.contextPath}/layout/purchase.jsp" method="GET">
                            <input type="hidden" name="productId" value="samsung-tv">
                            <input type="hidden" name="productName" value="삼성 65인치 4K UHD TV">
                            <input type="hidden" name="productPrice" value="1890000">
                            <input type="hidden" name="productImage" value="samsung-tv.jpg">
                            <button type="submit" class="buy-button">구매하기</button>
                        </form>
                    </div>
                </div>

                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/images/lg-tv.png" alt="LG TV" class="product-image">
                    <div class="product-info">
                        <div class="product-title">LG 65인치 OLED TV</div>
                        <div class="product-description">
                            - 완벽한 블랙 표현<br>
                            - α9 AI 프로세서<br>
                            - 돌비 비전 IQ
                        </div>
                        <div class="product-price">2,990,000원</div>
                        <form action="${pageContext.request.contextPath}/layout/purchase.jsp" method="GET">
                            <input type="hidden" name="productId" value="lg-tv">
                            <input type="hidden" name="productName" value="LG 65인치 OLED TV">
                            <input type="hidden" name="productPrice" value="2990000">
                            <input type="hidden" name="productImage" value="lg-tv.png">
                            <button type="submit" class="buy-button">구매하기</button>
                        </form>
                    </div>
                </div>

                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/images/sony-tv.png" alt="소니 TV" class="product-image">
                    <div class="product-info">
                        <div class="product-title">소니 65인치 BRAVIA XR</div>
                        <div class="product-description">
                            - XR 화질 프로세서<br>
                            - Acoustic Multi-Audio<br>
                            - Google TV
                        </div>
                        <div class="product-price">3,290,000원</div>
                        <form action="${pageContext.request.contextPath}/layout/purchase.jsp" method="GET">
                            <input type="hidden" name="productId" value="sony-tv">
                            <input type="hidden" name="productName" value="소니 65인치 BRAVIA XR">
                            <input type="hidden" name="productPrice" value="3290000">
                            <input type="hidden" name="productImage" value="sony-tv.png">
                            <button type="submit" class="buy-button">구매하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="../layout/TV_footer.jsp" %>
</body>
</html> 