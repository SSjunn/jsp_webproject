<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .category-bar {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px 0;
        border-bottom: 1px solid #eee;
        background-color: #fff;
        flex-wrap: wrap;
    }

    .category-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 15px;
        text-align: center;
        font-size: 14px;
        color: #222;
        text-decoration: none;
    }

    .category-item img {
        width: 70px;
        height: 70px;
        object-fit: contain;
        margin-bottom: 6px;
    }

    .category-item span {
        margin-top: 4px;
    }

    .category-item:hover {
        color: #35c5f0;
    }
</style>

<div class="category-bar">
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/mainimg/bed_icon.png" alt="신혼가구"><span>신혼가구</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/mainimg/cart_icon.png" alt="쇼핑하기"><span>쇼핑하기</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/mainimg/house_size_icon.png" alt="평수별집구경"><span>평수별집구경</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/mainimg/sofa_icon.png" alt="공간별사진"><span>공간별사진</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/mainimg/consult_icon.png" alt="시공간편상담"><span>시공간편상담</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/mainimg/qna_icon.png" alt="질문과답변"><span>질문과답변</span></a>
</div>
