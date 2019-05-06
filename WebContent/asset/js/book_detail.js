var flag=true;
$(document).ready(function(){
	getAvgScore();
	//도서상세정보 자동 포커스 이동
	$("#bookIntro").focus();
	//툴팁 텍스트 가려놓기
	$(".tooltipText").hide();
	//댓글영역 toggle
	$(".reviewCommentWrap").hide();
	//댓글 펼쳐보기 관련 이벤트 함수호출
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
		$(".tooltipText").fadeIn(500).css({
			"left":$("#scoreTooltip").offset().left+$("#scoreTooltip").width()+10+"px",
			"top":$("#scoreTooltip").offset().top-30+"px"			
		});
	}).mouseout(function(){
		$(".tooltipText").fadeOut(400);
	});
});
////////////////////////////////////////////////////////////////////////////
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
	$("input[name='score']").val(score);
	console.log("hidden 타입 score에 담은 스코어밸류"+$("input[name='score']").val());
}

//리뷰쓰기 이동
function goWriteRv(isbn){
	location.href="/book/reviews/"+isbn;
}

//유저가 매긴 책 점수 평점에 반영시키기 비동기
//책에 대한 평점 update
function registScore(){
	console.log("내 점수를 평점에 반영하기 클릭");
	$.ajax({
		url:"/book/scores",
		type:"post",
		data:{
			isbn : $("input[name='isbn']").val(),
			member_id : $("input[name='member.member_id']").val(),
			score : $("input[name='score']").val()
		},
		success:function(result){
			var json = JSON.parse(result);
			//alert(json.result);
			//평점 갱신
			if(json.result==1){
				//updateAvgScore();
				console.log("책에 대한 내 점수 등록 결과 : "+json.result);
				updateAvgScore(json.result);
			}else{
				alert("내 점수 등록 오류");
			}
		}
	});
}
//bookDetail페이지 로딩 시 보여줄 해당 도서의 평점
//일종의 비동기 목록요청
function getAvgScore(){
	console.log("getAvgScore호출");
	$.ajax({
		url:"/book/scores",
		type:"get",
		data:{
			isbn:$("input[name='isbn']").val()
		},
		success:function(result){
			console.log("getAvgScore 목록요청결과 : "+result);
			renderAvgStar(JSON.parse(result));
		},
		error:function(result){
			//alert("실패결과"+result);
		}
	});
}

//비동기 평점 update
function updateAvgScore(json){
	console.log("updateAvgScore호출");
	$.ajax({
		url:"/book/scores",
		type:"put",
		data:{
			isbn : $("input[name='isbn']").val(),
			member_id : $("input[name='member.member_id']").val(),
			score : json.score
		},
		success:function(result){
			console.log("평점 update result : "+result);
			var obj = JSON.parse(result);
			if(obj.result==1){
				renderAvgStar();
				//renderAvgStar(JSON.parse(result));
			}else{
				alert("평점 업데이트 실패");
			}
			
		},
		error:function(result){
			alert("실패결과 "+result);
		}
	});
}

//비동기 평점 update 별출력
//class="repuStar"에 <img src="/asset/images/star_filled.png" alt="별점 이미지_filled">동적 출력
function renderAvgStar(json){
	console.log("renderAvgStar호출");
	var total=0;
	var avgScore=0;
	for (var i = 0; i < json.scoreList.length; i++) {
		var obj = json.scoreList[i];
		var jumsu = obj.score;
		total+=jumsu;
	}
	avgScore=parseInt(total/json.scoreList.length);
	console.log("이 책의 계산된 평점은 : "+avgScore);
	for(var j=0;j<=avgScore;j++){
		$($(".repuStar").find("img")[j]).attr('src','/asset/images/star_filled.png');
	}
}