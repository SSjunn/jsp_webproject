<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .category-bar {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px 0;
        flex-wrap: wrap;
    }

    .category-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 0 15px;
        text-align: center;
        font-size: 21px;
        color: #222;
        text-decoration: none;

        /* 여기에 3D 효과 적용 */
        transform: perspective(750px) translate3d(0px, 0px, -250px) rotateX(27deg) scale(0.9, 0.9);
        border-radius: 20px;
        border: 5px solid #e6e6e6;
        box-shadow: 0 70px 40px -20px rgba(0, 0, 0, 0.2);
        transition: 0.4s ease-in-out transform;
    }

    .category-item:hover {
        transform: perspective(750px) translate3d(0px, 0px, -250px);
    }

	.category-item img {
	    width: 120px;
	    height: 120px;
	    object-fit: contain;
	    margin-bottom: 10px;
	}


    .category-item span {
        margin-top: 4px;
    }

    .category-item:hover {
        color: #35c5f0;
    }
</style>

<div class="category-bar">
    <a class="category-item" href="${pageContext.request.contextPath}/layout/TV_view.jsp">
	    <img src="${pageContext.request.contextPath}/uploads/categori/TV.png" alt="가구">
	    <span>TV</span>
	</a>

    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/categori/water.png" alt="패브릭"><span>세탁기</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/categori/microwaveoven.png" alt="홈데코"><span>전자레인지</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/categori/vacuumcleaner.png" alt="수납/정리"><span>청소기</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/categori/refrigerator.png" alt="생활용품"><span>냉장고</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/categori/electricfan.png" alt="가전"><span>선풍기</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/categori/computer.png" alt="주방"><span>컴퓨터</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/categori/airconditioning.png" alt="반려동물"><span>에어컨</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/categori/camera.png" alt="그릇/홈세트"><span>카메라</span></a>
    <a class="category-item" href="#"><img src="${pageContext.request.contextPath}/uploads/categori/cellphone.png" alt="조명"><span>핸드폰</span></a>
</div>
