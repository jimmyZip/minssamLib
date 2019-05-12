/**
 * 
 */
$(document).ready(function(){
	//모달 숨겨놓기
	$("#reviewFull,#reviewView").hide();
	init();
});
function init(){
	//editor 사용
	//CKEDITOR.replace('content');
	//form data 임시저장
	$($("input[type='button']")[0]).click(function(){
		tempSave();
	});
	
	//작성내용 미리보기
	$($("input[type='button']")[1]).click(function(){
		preview();
	});
	/*
	$("form[data-use-autosave=true]").each(function() { // 저장기능을 사용중인 폼을 찾습니다.
		if(window.localStorage.getItem('formData')){
			
		}
    });
	*/
	
	//form 전송
	$($("input[type='button']")[2]).click(function(){
		send();
	});
	
	//업로드 대기 이미지 등록
	//$("input[type=file]").click(function(){
	$("input[type=file]").change(function(){
		makeThumbnail(this);
	});
	
	//업로드 대기 이미지 선택 체크박스 관련
	$("#checkAll").click(function(){
		chkAll();
	});
}

//form data 임시저장
function tempSave(){
	alert("Internet Explorer 8이하 구형브라우저는 지원하지 않는 기능입니다.<br>작성중인 내용을 중간저장합니다.");
	var title = $("input[name='title']").val();
	var content = $("textarea[name='content']").val();
	var myImg = $("input[name='myImg']").val();
	window.localStorage.setItem('tempTitle',title);
	window.localStorage.setItem('tempContent',content);
	window.localStorage.setItem('tempMyImg',myImg);
	console.log("임시저장한 제목",localStorage.getItem('tempTitle'));
	console.log("임시저장한 내용",localStorage.getItem('tempContent'));
	console.log("임시저장한 이미지",localStorage.getItem('tempMyImg'));
}

//작성내용 미리보기
function preview(){
	if((localStorage.getItem("tempTitle")&&localStorage.getItem("tempContent")&&localStorage.getItem("tempMyImg"))==null){
		alert("임시저장 내역이 없습니다.");
	}else{
		alert("작성내역을 불러옵니다.");
		$("#reviewFull,#reviewView").show();
		$.ajax({
			url:"/review/review_preview.jsp",
			type:"get",
			dataType:"text",
			success:function(result){
				var json = JSON.parse(result);
				if(json.result==1){
					showPreview(json.result);
				}else{
					alert("미리보기 오류");
				}
			}
		});
	}
}

function showPreview(json){
	$("#reviewView").html(json);
}

//review-write 수행할 form 전송
function send(){
	alert("작성한 리뷰를 등록합니다.");
	$("form[name='review-write-form']").attr({
		method:"post",
		action:"/review/write"
	});
	$("form[name='review-write-form']").submit();
	//정상적으로 form 전송하면 임시저장 데이터 비우기
	window.localStorage.clear();
}

//업로드 대기 이미지 동적 생성
function makeThumbnail(input){
	//태그 동적생성
	var str="";
	str+="<li class='imgListUnit'>";
	str+="<input type='checkbox' class='chk'/>";
	str+="<img src='' alt='선택한 업로드 이미지'/>";
	str+="</li>";
	$(".selectedImgList").append(str);
	
	//이미지 소스 미리보기 불러오기
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			$($(".imgListUnit").find("img")).attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
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
		alert("삭제");
		$(".imgListUnit").remove("");
	}
}

