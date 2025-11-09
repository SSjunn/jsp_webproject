<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    }

    /* 메인 컨텐츠 스타일 */
    .main-content {
        margin-top: 80px;
        padding: 40px 20px;
    }

    .content-container {
        max-width: 1200px;
        margin: 0 auto;
    }

    .hero-section {
        background: linear-gradient(135deg, #e8f1ff 0%, #f5f9ff 100%);
        border-radius: 20px;
        padding: 60px 40px;
        margin-bottom: 40px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .hero-text {
        flex: 1;
        padding-right: 40px;
    }

    .hero-text h1 {
        font-size: 36px;
        font-weight: 700;
        color: #1a1a1a;
        margin-bottom: 20px;
        line-height: 1.3;
    }

    .hero-text p {
        font-size: 18px;
        color: #666;
        margin-bottom: 30px;
    }

    .hero-image {
        flex: 1;
        text-align: right;
    }

    .hero-image img {
        max-width: 100%;
        height: auto;
        border-radius: 10px;
    }

    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 30px;
        margin-top: 40px;
    }

    .product-card {
        background: #fff;
        border-radius: 15px;
        overflow: hidden;
        transition: transform 0.3s, box-shadow 0.3s;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .product-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 20px rgba(0,0,0,0.1);
    }

    .product-image {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .product-info {
        padding: 20px;
    }

    .product-title {
        font-size: 18px;
        font-weight: 700;
        margin-bottom: 10px;
        color: #1a1a1a;
    }

    .product-description {
        font-size: 14px;
        color: #666;
        margin-bottom: 15px;
    }

    .product-price {
        font-size: 20px;
        font-weight: 700;
        color: #2d7cff;
        margin-bottom: 15px;
    }

    .buy-button {
        width: 100%;
        padding: 12px;
        background: #2d7cff;
        color: #fff;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.2s;
    }

    .buy-button:hover {
        background: #1b6aef;
    }

    @media (max-width: 768px) {
        .hero-section {
            flex-direction: column;
            text-align: center;
            padding: 40px 20px;
        }

        .hero-text {
            padding-right: 0;
            margin-bottom: 30px;
        }

        .product-grid {
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        }
    }
</style> 