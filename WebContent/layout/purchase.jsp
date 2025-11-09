<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 구매 - 모두의 전자</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <%@ include file="../layout/TV_style.jsp" %>
 
    
    <style>
        .purchase-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .product-summary {
            display: flex;
            gap: 20px;
            padding: 20px;
            border-bottom: 1px solid #eee;
            margin-bottom: 30px;
        }

        .product-summary img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .product-details {
            flex: 1;
        }

        .purchase-form {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .payment-options {
            margin: 20px 0;
        }

        .payment-option {
            margin: 10px 0;
        }

        .total-price {
            font-size: 24px;
            font-weight: 700;
            color: #2d7cff;
            text-align: right;
            margin: 20px 0;
        }

        .purchase-button {
            width: 100%;
            padding: 15px;
            background: #2d7cff;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }

        .purchase-button:hover {
            background: #1b6aef;
        }
    </style>
</head>
<body>
    <%@ include file="../layout/TV_header.jsp" %>

    <main class="main-content">
        <div class="purchase-container">
            <h2>상품 구매</h2>
            
            <div class="product-summary">
                <img src="${pageContext.request.contextPath}/images/${param.productImage}" alt="${param.productName}">
            
                
                <div class="product-details">
                    <h3>${param.productName}</h3>
                    <p class="product-price">${param.productPrice}원</p>
                </div>
            </div>

            <form class="purchase-form" action="${pageContext.request.contextPath}/purchase/complete" method="POST">
                <input type="hidden" name="productId" value="${param.productId}">
                
                <div class="form-group">
                    <label for="name">받는 사람</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="phone">연락처</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>

                <div class="form-group">
                    <label for="address">배송 주소</label>
                    <input type="text" id="address" name="address" required>
                </div>

                <div class="payment-options">
                    <h3>결제 방법</h3>
                    <div class="payment-option">
                        <input type="radio" id="card" name="payment" value="card" checked>
                        <label for="card">신용카드</label>
                    </div>
                    <div class="payment-option">
                        <input type="radio" id="bank" name="payment" value="bank">
                        <label for="bank">계좌이체</label>
                    </div>
                </div>

                <div class="total-price">
                    총 결제금액: ${param.productPrice}원
                </div>

                <button type="submit" class="purchase-button">결제하기</button>
            </form>
        </div>
    </main>

    <%@ include file="../layout/TV_footer.jsp" %>

    <script>
        document.querySelector('.purchase-form').addEventListener('submit', function(e) {
            e.preventDefault();
            if (confirm('구매를 진행하시겠습니까?')) {
                
                window.location.href = '${pageContext.request.contextPath}/Pay/purchase_real.jsp';
            }
        });
    
    </script>
</body>
</html> 