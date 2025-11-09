<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>



<style>
.photo_box {
	margin-left: 200px;
	margin-right: 200px;
	left: 20%;
	right: 25%;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-gap: 20px;
	margin-bottom: 70px;
}

.container {
	width: 250px;
	height: 250px;
	overflow: hidden;
	position: relative;
	transition: transform 0.3s ease;
}
.container:hover {
	transform: scale(1.05);
	box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.container a {
	display: block;
	width: 100%;
	height: 100%;
}

.container_img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.container_img2 {
	width: 230px;
	height: 230px;
}


 .container_img2 {
   position: fixed;
   bottom: 20px;
   right: 20px;
   z-index: 9999;
   transform: scale(0.5);
   transform-origin: bottom right;
   cursor: pointer;
   transition: transform 0.2s ease-in-out;
 }

 .container_img2:hover {
   transform: scale(0.6);
}

.main_categori {
	margin-top: 40px;
}
</style>
<main>
	<div>
		<%@ include file="../layout/categori.jsp"%>
	</div>


	<h3>오늘의 제품</h3>
	<section class="photo_box">
		<c:forEach var="board" items="${boards}">
			<div class="container">
				<div class="nickname">${board.userNickname }</div>
				<a href=" /JspProject/photo_board?cmd=detail&id=${board.id}"><img class="container_img"
     src="${pageContext.request.contextPath}/uploads/${board.photoImage}" style="width:100%"></a>
			</div>
		</c:forEach>
	</section>
	



<!-- <button onclick="openChat()" style="position: fixed; bottom: 20px; right: 20px; z-index: 9999;">
    AI 상담하기
</button> -->
<%@ include file="../counsel/counsel.jsp"%>
<img onclick="openChat()" class="container_img2"
     src="${pageContext.request.contextPath}/images/phone.png">



<%-- 	<div class="main_img">
		<%@ include file="/layout/mainimg.jsp" %>
	</div> --%>

</main>
	<div>
		<%@ include file="../layout/shop_contents/shop.jsp"%>
	</div>
<footer>
	<!-- <img src="images/footer.png"> -->
	<%@ include file="../layout/footer.jsp"%>

</footer>



</body>

</html>