$(document).ready(function(){
	init();
});
function init(){
	//editor
	//editor사용
	CKEDITOR.replace('.reviewContent');
	$("input[type='button']").click(function(){
		send();
	});
	
	//reviewer가 책에 대해 매긴 평점 카운트
	$($(".starImg").find("img")).click(function(event){
		var i=$(this).index();
		scoring(i);
	});
	
	//upload 대기 이미지 등록
	$("input[type='file']").change(function(){
		makeThumbnail();
	});
	
	//upload대기 이미지 선택 체크박스
	$("#checkAll").click(function(){
		chkAll();
	});
	
	//점수계산
	$($(".starImg").find("img")).click(function(){
		scoreCount();
	});
}

//form 전송
function send(){
	$("form").attr({
		"method":"post",
		"action":"/reviews"
	});
	$("form").submit();
}

//리뷰어가 책에 대해 매긴 점수 계산
function scoring(i){
	for(var a=0;a<=4;a++){
		$($(".starImg").find("img")[a]).attr('src','/asset/images/star_empty.png');
	}
	for(var a=0;a<=i;a++){
		$($(".starImg").find("img")[a]).attr('src','/asset/images/star_filled.png');
	}
	
	//별 갯수만큼 스코어 부여
	var score=0;
	score=i+1;
	$(".reviewScore").text(score);
	//hidden input의 value에 score주입
	$("input[type='hidden']").val(score);
}

//upload대기 이미지 동적 생성
function makeThumbnail(){
	var str="";
	str+="<li class='imgListUnit'>";
	str+="<input type='checkbox' class='chk'/>";
	str+="<img src='' alt='선택한 업로드 이미지'/>";
	str+="</li>";
	$(".selectedImgList").append(str);
}

//upload 대기 이미지 체크박스 전체선택/해제
function chkAll(){
	if($("#checkAll").prop("checked")){
		$(".chk").prop("checked",true);
	}else{
		$(".chk").prop("checked",false);
	}
}

//checked인 경우 선택된 업로드 대기 이미지 지우기
function imgRegistCancel(){
	if($(".chk").prop("checked")){
		$(".imgListUnit").remove();
	}
}