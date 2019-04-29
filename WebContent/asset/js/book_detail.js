var flag=true;
$(document).ready(function(){
	$(".reviewCommentWrap").hide();
	$(".showReply").click(function(){
		showAndHide();
		flag=!flag;
	});
});
function showAndHide(){
	$(".reviewCommentWrap").toggle(200,"linear",function(){
		if(flag==false){
			$(".showReply").text("리뷰에 대한 댓글접기");
		}else{
			$(".showReply").text("리뷰에 대한 댓글보기");
		}
	});
}