/**
 * 
 */
$(document).ready(function(){
	init();
});
function init(){
<<<<<<< HEAD
	//editor
=======
	//editor 사용
>>>>>>> 2e25d6b82bf5b6cdedd59fc5184761448d06950d
	CKEDITOR.replace('content');
	$("input[type='button']").click(function(){
		send();
	});
	
	//리뷰어가 책에 대해 매긴 평점 카운트
<<<<<<< HEAD
	$($(".starImg").find("img")).click(function(event){
		var i=$(this).index();
		//var clicked=false;
		scoring(i);
	});
	
	//업로드 대기 이미지 등록
	$("input[type=file]").change(function(){
		makeThumbnail();
	});
	
	//업로드 대기 이미지 선택 체크박스
	$("#checkAll").click(function(){
		chkAll();
=======
	$($(".starImg").find("img")).click(function(){
		scoreCount();
>>>>>>> 2e25d6b82bf5b6cdedd59fc5184761448d06950d
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

<<<<<<< HEAD
//리뷰어가 책에 대해 매긴 점수 계산
function scoring(i){
	//몇 번째 별을 클릭했는가
	console.log(i+"번째 녀석 클릭");
	//i번째 녀석까지 채워진 별로 반전
	//별 상태의 초기화
	for(var a=0;a<=4;a++){
		$($(".starImg").find("img")[a]).attr('src','/asset/images/star_empty.png');
	}
	for(var a=0;a<=i;a++){
		$($(".starImg").find("img")[a]).attr('src','/asset/images/star_filled.png');
	}
	
	//별 갯수만큼 스코어 부여
	var score=0;
	score=i+1;
	console.log("리뷰어가 이 책에 매긴 점수 : "+score+"점");
	$(".reviewScore").text(score);
	//hidden type input의 value에 score주입
	$("input[type=hidden]").val(score);
	console.log("hidden에 담은 스코어 밸류"+$("input[type=hidden]").val());
}

//업로드 대기 이미지 동적 생성
function makeThumbnail(){
	alert("업로드할 파일을 선택했다!!");
	var str="";
	str+="<li class='imgListUnit'>";
	str+="<input type='checkbox' class='chk'/>";
	str+="<img src='' alt='선택한 업로드 이미지'>";
	str+="</li>";
	$(".selectedImgList").append(str);
}

//업로드 대기 이미지 체크박스 전체선택/해제
function chkAll(){
	if($("#checkAll").prop("checked")){
		$(".chk").prop("checked",true);
	}else{
		$(".chk").prop("checked",false);
	}
}

//체크박스가 선택된 업로드 대기 이미지 지우기
function imgRegistCancel(){
	alert("해당 이미지 첨부를 취소합니다.");
	if($(".chk").prop("checked")){
		$(".imgListUnit").remove();
	}
=======
//책의 평점 계산
function scoreCount(){
	alert(11);
	//몇 번째 별인지 계산
	
>>>>>>> 2e25d6b82bf5b6cdedd59fc5184761448d06950d
}