<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
footer img {
	margin-left: 60px;
}

.housewarming_main {
	margin: 0 auto;
	padding: 20px 200px;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-gap: 20px;
}

.card {
	width: 380px;
	border: none; /* ← 이거 추가! */
	box-shadow: none; /* 혹시 그림자도 있을 경우 제거 */
}

.card_img {
	width: 300px;
	height: 300px;
	object-fit: cover;
	border-radius: 8px;
}

.info_box {
	display: flex;
	justify-content: space-between;
	margin-top: 5px;
}

.nickname {
	font-weight: bold;
}

.preview_text {
	margin-top: 8px;
	font-size: 14px;
	color: #444;
}
</style>

<main class="housewarming_main">
	<c:forEach var="board" items="${boards}">
		<div class="card">
			<div class="nickname">${board.userNickname}</div>

			<a href="${pageContext.request.contextPath}/housewarming?cmd=detail&id=${board.id}">
				<img class="card_img" src="${pageContext.request.contextPath}/uploads/${board.photoImage}" alt="대표 이미지">
			</a>

			<div class="info_box">
				<div>
					<span>👁</span>
					<span>${board.readCount}</span>
				</div>
			</div>

			<div class="preview_text">
				<c:choose>
					<c:when test="${fn:length(board.title) > 20}">
						<c:out value="${fn:substring(board.title,0,19)}" />...
					</c:when>
					<c:otherwise>
						<c:out value="${board.title}" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</c:forEach>
</main>

<footer>
	<%@ include file="../layout/footer.jsp" %>
</footer>

</body>
</html>
