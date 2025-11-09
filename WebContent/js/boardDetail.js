function addReply(data){
	
	var replyItem = `<li id="reply-${data.id}" class="media">`;
	replyItem += `<div class="media-body">`;
	replyItem += `<strong class="text-primary">${data.userNickname}</strong>`;
	replyItem += `<p>${data.content}</p></div>`;
	replyItem += `<div class="m-2">`;
	
	replyItem += `<i onclick="deleteReply(${data.id})" class="material-icons">delete</i></div></li>`;
	
	$("#reply__list").prepend(replyItem);
}

function deleteReply(id){
	// 세션의 유저의 id와 reply의 userId를 비교해서 같을때만!!
	$.ajax({
		type : "post",
		url : "/JspProject/reply?cmd=delete&id="+id,
		dataType : "json"
	}).done(function(result) { //  { "statusCode" : 1 }
		if (result.statusCode == 1) {
			console.log(result);
			$("#reply-"+id).remove();
		} else {
			alert("댓글삭제 실패");
		}
	});
	
	
}

function replySave(userId, boardId, h_boardId) {
    // URL에서 id 파라미터 추출 (housewarming?cmd=detail&id=7)
    const urlParams = new URLSearchParams(window.location.search);
    const housewarmingId = urlParams.get("id");
	console.log("보내는 데이터 확인:", JSON.stringify(data));
	console.log("함수 진입 시 boardId =", boardId);
	console.log("함수 진입 시 h_boardId =", h_boardId);
	console.log("URL에서 읽은 id =", housewarmingId);

    // boardId가 null이고 h_boardId가 undefined일 경우, URL의 id를 자동 할당
    if (!boardId && !h_boardId && housewarmingId) {
        h_boardId = parseInt(housewarmingId); // ← 여기서 정확한 값 세팅
		console.log("조건 만족해서 h_boardId 세팅됨 =", h_boardId);
    }
	
	console.log("최종 h_boardId =", h_boardId);
	
    
	var data = {
        userId : userId,
        boardId : boardId,
        h_boardId : h_boardId,
        content : $("#content").val()
    };
	
	$.ajax({
	    type : "post",
	    url : "/JspProject/reply?cmd=save",
	    data : JSON.stringify(data),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json"
	}).done(function(result) {
	    if (result.statusCode == 1) {
	        console.log(result);
	        addReply(result.data);
	        $("#content").val("");
	    } else {
	        alert("댓글쓰기 실패");
	    }
	});

}



function deleteById(boardId){

	$.ajax({
		type: "post",
		url: "/JspProject/photo_board?cmd=delete&id="+boardId,
		dataType: "json"
	}).done(function(result){
		console.log(result);
		if(result.statusCode == 1){
			location.href="/JspProject/photo_board?cmd=photolist";
		}else{
			alert("삭제에 실패하였습니다.");
		}
	});
}



function h_deleteById(h_boardId){

	$.ajax({
		type: "post",
		url: "/JspProject/housewarming?cmd=delete&id="+h_boardId,
		dataType: "json"
	}).done(function(result){
		console.log(result);
		if(result.statusCode == 1){
			location.href="/JspProject/housewarming?cmd=list";
		}else{
			alert("삭제에 실패하였습니다.");
		}
	});
}