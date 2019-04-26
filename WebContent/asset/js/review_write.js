/**
 * 
 */
$(document).ready(function(){
	init();
});
function init(){
	//editor 사용
	CKEDITOR.replace('content');
	$("input[type='button']").click(function(){
		send();
	});
	
	//리뷰어가 책에 대해 매긴 평점 카운트
	$($(".starImg").find("img")).click(function(){
		scoreCount();
	});
}

//form 전송
function send(){
	var form=$("form");
	form.attr({
		"method":"post",
		"action":"/reviews"
	});
	form.submit();
}

//책의 평점 계산
function scoreCount(){
	alert(11);
	//몇 번째 별인지 계산
	
}