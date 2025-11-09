<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .footer {
        background: #fff;
        padding: 40px 0;
        margin-top: 60px;
        border-top: 1px solid #eee;
    }

    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 40px;
    }

    .footer-section h3 {
        font-size: 18px;
        font-weight: 700;
        margin-bottom: 20px;
        color: #333;
    }

    .footer-section p,
    .footer-section a {
        font-size: 14px;
        color: #666;
        line-height: 1.8;
        text-decoration: none;
        display: block;
        margin-bottom: 8px;
    }

    .footer-section a:hover {
        color: #2d7cff;
    }

    .footer-bottom {
        text-align: center;
        margin-top: 40px;
        padding-top: 20px;
        border-top: 1px solid #eee;
        color: #999;
        font-size: 12px;
    }

    @media (max-width: 768px) {
        .footer-container {
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
        }
    }

    @media (max-width: 480px) {
        .footer-container {
            grid-template-columns: 1fr;
        }
    }
</style>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3>고객 서비스</h3>
            <a href="${pageContext.request.contextPath}/support/faq">자주 묻는 질문</a>
            <a href="${pageContext.request.contextPath}/support/contact">문의하기</a>
            <a href="${pageContext.request.contextPath}/support/shipping">배송 안내</a>
            <a href="${pageContext.request.contextPath}/support/returns">반품/교환 안내</a>
        </div>
        <div class="footer-section">
            <h3>회사 정보</h3>
            <a href="${pageContext.request.contextPath}/about">회사 소개</a>
            <a href="${pageContext.request.contextPath}/careers">채용 정보</a>
            <a href="${pageContext.request.contextPath}/press">보도자료</a>
            <a href="${pageContext.request.contextPath}/partners">제휴문의</a>
        </div>
        <div class="footer-section">
            <h3>쇼핑 가이드</h3>
            <a href="${pageContext.request.contextPath}/guide/payment">결제 방법</a>
            <a href="${pageContext.request.contextPath}/guide/membership">멤버십 혜택</a>
            <a href="${pageContext.request.contextPath}/guide/events">이벤트</a>
            <a href="${pageContext.request.contextPath}/guide/coupons">쿠폰</a>
        </div>
        <div class="footer-section">
            <h3>고객센터</h3>
            <p>평일 09:00 - 18:00</p>
            <p>주말 및 공휴일 휴무</p>
            <p>전화: 010-7180-6278</p>
            <p>이메일: tjtjdwns2@naver.com</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 모두의 전자. All rights reserved.</p>
    </div>
</footer> 