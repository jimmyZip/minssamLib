/**
 * 리뷰 업데이트용
 */
$(document).ready(function(){
	init();
});

function init(){
	//editor
	//CKEDITOR.replace('content');
	
	$($("input[type='button']")[0]).click(function(){
		updateReview();
	});
}

//form 전송
function updateReview(){
	alert("수정한 리뷰를 등록합니다.");
	$.ajax({
		url:"/review/update",
		type:"post",
		data:{
			isbn:$($("form[name='review-update-form']").find("input[name='isbn']")).val(),
			title:$($("form[name='review-update-form']").find("input[name='title']")).val(),
			content:$($("form[name='review-update-form']").find("textarea")).val(),
			review_id:$($("form[name='review-update-form']").find("input[name='review_id']")).val()
		},
		success:function(result){
			var json = JSON.parse(result);
			if(json.result==1){				
				alert("리뷰 수정에 성공했습니다.");
			}else{
				alert("본인 작성 글이 아니거나 수정에 오류가 발생했습니다.");
			}
		}
	});
}