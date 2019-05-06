var flag=true;
$(document).ready(function(){
	//도서상세정보 자동 포커스 이동
	$("#bookIntro").focus();
	$(".tooltipText").hide();
	//댓글영역 toggle
	$(".reviewCommentWrap").hide();
	$(".showReply").click(function(event){
		var s=$(this).index();
		alert(s+"번째 쇼리플버튼 클릭");
		showAndHide(s);
		flag=!flag;
	});
	
	//리뷰어가 책에 대해 매긴 점수 카운트
	$($(".starImg").find("img")).click(function(event){
		var i=$(this).index();
		//var clicked=false;
		scoring(i);
	});
	
	//tooltip
	
	$("#scoreTooltip").mouseover(function(){
		$(".tooltipText").fadeIn(400).css({
			"left":$("#scoreTooltip").offset().left+$("#scoreTooltip").width()+"px",
			"top":$("#scoreTooltip").offset().top-50+"px"
		});
	}).mouseout(function(){
		$(".tooltipText").fadeOut(400);
	});
});
//해당 댓글 toggle
function showAndHide(s){
	alert(s);
	$($(".reviewCommentWrap")[s-1]).toggle(200,"linear",function(){
		if(flag==false){
			$($(".showReply")[s-1]).text("이 리뷰에 대한 댓글접기");
		}else{
			$($(".showReply")[s-1]).text("이 리뷰에 대한 댓글보기");
		}
	});
}

//책에 매긴 점수 계산
function scoring(i){
	//몇 번째 별을 클릭했는지 찾기
	console.log(i+"번째 녀석을 클릭");
	//i번째 녀석까지 별을 채워진 별로 반전
	for(var a=0;a<=4;a++){
		$($(".starImg").find("img")[a]).attr('src','/asset/images/star_empty.png');
	}	
	for(var a=0;a<=i;a++){
		$($(".starImg").find("img")[a]).attr('src','/asset/images/star_filled.png');
	}	
	//별 갯수만큼 스코어 부여
	var score = 0;
	score=i+1;
	console.log("리뷰어가 이 책에 매긴 점수 : "+score+"점");
	$(".reviewScore").text(score);
	$("input[name='score.score']").val(score);
	console.log("hidden 타입 score에 담은 스코어밸류"+$("input[name='score']").val());
}

//리뷰쓰기 이동
function goWriteRv(isbn){
	location.href="/book/reviews/"+isbn;
}

//유저가 매긴 책 점수 평점에 반영시키기 비동기
//책에 대한 평점 먼저 조회
function registScore(){
	$.ajax({
		url:"/book/scores",
		type:"get",
		data:{
			name:$("input[name='isbn']").val()
		},
		success:function(result){
			var json = JSON.parse(result);
			var obj;
			if(json.length<1){
				alert("검색 결과가 없습니다. 수행결과 건수: "+json.length);
			}else{
				obj=json[0];
				setAverageScore(obj);
			}
		}
	});
}