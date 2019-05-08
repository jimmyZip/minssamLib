/**
 * 
 */
$(document).ready(function(){
	init();
});
function init(){
	//editor 사용
	CKEDITOR.replace('content');
	
	$($("input[type='button']")[2]).click(function(){
		send();
	});
	
	//업로드 대기 이미지 등록
	$("input[type=file]").click(function(){
		makeThumbnail();
	});
	
	//업로드 대기 이미지 선택 체크박스 관련
	$("#checkAll").click(function(){
		chkAll();
	});

}

//업로드 대기 이미지 동적 생성
function makeThumbnail(){
	var str="";
	str+="<li class='imgListUnit'>";
	str+="<input type='checkbox' class='chk'/>";
	str+="<img src='' alt='선택한 업로드 이미지'/>";
	str+="</li>";
	$(".selectedImgList").append(str);
}

//업로드 대기 이미지 체크박스 전체선택/전체해제
function chkAll(){
	if($("#checkAll").prop("checked")){
		$(".chk").prop("checked",true);
	}else{
		$(".chk").prop("checked",false);
	}
}

//체크박스 선택된 업로드 대기 이미지 지우기
function imgRegistCancel(){
	alert("삭제버튼 눌렀다.");
	if($(".chk").prop("checked")==true){
		$(".selectedImgList").remove(".imgListUnit");
	}
}

//form 전송
function send(){
	alert("작성한 리뷰를 등록합니다.");
	$("form[name='review-write-form']").attr({
		method:"post",
		action:"/review/write"
	});
	$("form[name='review-write-form']").submit();
}