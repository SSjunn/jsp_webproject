<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<style>
.material-icons {
	cursor: pointer;
}
.img-box {
	width: 300px;
	margin: auto;
}
.img-box img {
	width: 100%;
	height: auto;
	object-fit: cover;
}
</style>

<main class="detail_box">

<div class="container">

	<h3 class="m-2 text-center">물품 게시글 상세보기</h3>

	<!-- 이미지 -->
	<div class="img-box mb-3">
		<img src="<%=request.getContextPath()%>/uploads/${dto.photoImage}" alt="게시글 이미지">
	</div>

	<!-- 제목 + 내용 -->
	<hr />
	<h4 class="m-2"><strong>${dto.title}</strong></h4>
	<div class="form-group">
		<p class="m-2">${dto.content}</p>
	</div>

	<!-- 작성자, 조회수 -->
	<hr />
	<h6 class="m-2">
		작성자 : <i>${dto.userNickname}</i><br>
		조회수 : <i>${dto.readCount}</i>
	</h6>
	
	<c:if test="${sessionScope.principal.id == dto.userId}">
		<button onClick="h_deleteById(${dto.id})" class="btn btn-danger">삭제</button>
	</c:if>


	<br/><br/>

	<!-- 댓글 박스 -->
	<div class="row bootstrap snippets">
		<div class="col-md-12">
			<div class="comment-wrapper">
				<div class="panel panel-info">
					<div class="panel-heading m-2">
						<b>댓글</b>
					</div>
					<div class="panel-body">
						<input type="hidden" name="userId" value="${sessionScope.principal.id}" />
						<input type="hidden" name="h_boardId" value="${dto.id}" /> 
			
						<textarea id="content" class="form-control" placeholder="댓글을 입력하세요..." rows="2"></textarea>
						<br>
						<button onClick="replySave(${sessionScope.principal.id},null,${dto.id})"
							class="btn btn-primary pull-right">댓글쓰기 </button>

						<div class="clearfix"></div>
						<hr />

						<!-- 댓글 리스트 -->
						<ul id="reply__list" class="media-list">
							<c:forEach var="reply" items="${replys}">
								<li id="reply-${reply.id}" class="media">
									<div class="media-body">
										<strong class="text-primary">${reply.userNickname}</strong>
										<p>${reply.content}</p>
									</div>
									<div class="m-2">
										<c:if test="${sessionScope.principal.id == reply.userId}">
											<i onclick="deleteReply(${reply.id})" class="material-icons">delete</i>
										</c:if>
									</div>
								</li>
							</c:forEach>
						</ul>
						<!-- 댓글 리스트 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 박스 끝 -->

</div>
</main>

<script src="/JspProject/js/boardDetail.js"></script>
</body>
</html>
