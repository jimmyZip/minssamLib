var flag=true;
$(document).ready(function(){
	//댓글영역 toggle
	$(".reviewCommentWrap").hide();
	$(".showReply").click(function(){
		showAndHide();
		flag=!flag;
	});
});
//댓글 toggle
function showAndHide(){
	$(".reviewCommentWrap").toggle(200,"linear",function(){
		if(flag==false){
			$(".showReply").text("리뷰에 대한 댓글접기");
		}else{
			$(".showReply").text("리뷰에 대한 댓글보기");
		}
	});
}
//리뷰쓰기 이동
function goWriteRv(isbn){
	location.href="/book/reviews/"+isbn;
}