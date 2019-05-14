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
		flag=true;
		$(this).next().toggle(200,"linear",function(){
			if(flag==false){
				$(this).text("이 리뷰에 대한 댓글 접기");
			}else{
				$(this).text("이 리뷰에 대한 댓글 보기");
			}
			flag=!flag;
		}.bind(this));
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
			"top":$("#scoreTooltip").offset().top-50+"px"			
		});
	}).mouseout(function(){
		$(".tooltipText").fadeOut(400);
	});
});
////////////////////////////////////////////////////////////////////////////
//북마크 등록
//addBookmark(<%=bookDetail.getIsbn() %>)
function addBookmark(isbn){
	console.log("북마크 등록 js 메서드, 넘기는 매개값은 "+isbn);
	$.ajax({
		url:"/bookmark/insert/"+isbn,
		type:"get",
		success:function(result){
			var json = JSON.parse(result);
			console.log("북마크 등록 js메서드에서 찍은 result"+json.resultCode);
			if(json.resultCode==1){
				//alertResultCode(result);
				alert(json.resultCode);
			}else{ // 이미 추가된 북마크 목록
				if(confirm(json.msg+"삭제하시겠습니까?")){
					deleteOrderbook(isbn);
				}
			}
		}
	});
}

//주문도서목록 추가 함수
//by Minsu Kim,thanks :)
function addOrderbook(isbn){
	$.ajax({
		url:"/orderbook/insert/"+isbn,
		type:"get",
		success:function(result){
			var json = JSON.parse(result);
			alert("주문도서 등록성공");
			if(json.resultCode==1){ // 추가 성공
				alertResultCode(result);
			}else{ // 이미 추가된 목록
				if(confirm(json.msg+"삭제하시겠습니까?")){
					deleteOrderbook(isbn);
				}
			}
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
	location.href="/book/reviews/write/"+isbn;
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
			//member_id : $("input[name='member.member_id']").val(),
			score : $("input[name='score']").val()
		},
		success:function(result){
			var json = JSON.parse(result);
			//alert(json.result);
			//평점 갱신
			if(json.result==1){
				//updateAvgScore();
				console.log("책에 대한 내 점수 등록 결과 : "+json.result);
				console.log($("input[name='member.member_id']").val());
				alert("이 책에 "+$("input[name='score']").val()+"점을 부여하셨습니다.");
				//목록갱신
				getAvgScore();
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
			renderAvgStar(result);
		},
		error:function(result){
			//alert("실패결과"+result);
		}
	});
}

//비동기 평점 update 별출력
//class="repuStar"에 <img src="/asset/images/star_filled.png" alt="별점 이미지_filled">동적 출력
function renderAvgStar(json){
	console.log("renderAvgStar호출");
	console.log("renderAvgStar함수에서 찍어본 매개변수 : "+json);
	$(".repuStar").html("");//별 초기화
	for(var a=0;a<5;a++){
		$(".repuStar").append("<img src=\"/asset/images/star_empty.png\" alt=\"별점 빈 이미지\"/>");
	}
	var result = JSON.parse(json);
	console.log("파싱한 결과 : "+result);
	var total=0;
	var avgScore=0;
	for (var i = 0; i < result.scoreList.length; i++) {
		var obj = result.scoreList[i];
		var jumsu = obj.score;
		console.log("이 책에 부여된 유저의 점수 : "+jumsu);
		total+=jumsu;
	}
	console.log("이 책에 부여된 유저의 점수 합계 : "+total);
	avgScore=parseInt(total/result.scoreList.length);
	console.log("이 책의 계산된 평점은 : "+avgScore);
	if(avgScore>0){
		for(var j=0;j<avgScore;j++){
			$($(".repuStar").find("img")[j]).attr('src','/asset/images/star_filled.png');
		}
	}
	/*
	if(avgScore>0){
		for(var j=0;j<avgScore;j++){
			$(".repuStar").append("<img src=\"/asset/images/star_filled.png\" alt=\"별점 채워진 이미지\"/>");
		}
		for(var k=0;k<5-avgScore;k++){
			$(".repuStar").append("<img src=\"/asset/images/star_empty.png\" alt=\"별점 빈 이미지\"/>");
		}
	}	
	*/
}

//검색목록으로 돌아가기 back to bookSearchList
function goSearchList(){
	alert("이 책의 검색목록으로 돌아갑니다.");
	//location.href="/book/search/{title}/"+1;
	//뒤로가기 히스토리가 있다면 뒤로 가기
	if(document.referrer){		
		history.back();//불완전한 부분. 한 페이지에서 새로고침 하면 목록으로 안가고 직전 페이지 부름
	}else{//만약 history없다면 인덱스로 가기
		location.href='/';
	}
}


//리뷰 삭제
function delReview(review_id){
	if(!confirm("정말 리뷰를 삭제하시겠습니까?")){
		return;
	}
	$.ajax({
		url:"/review/delete/"+review_id,
		type:"delete",
		success:function(result){
			console.log("리뷰삭제요청 result :: "+result);
			var json = JSON.parse(result);
			if(json.result==1){
				alert("리뷰가 삭제되었습니다.");
				location.reload();
			}else{
				alert("본인 작성 글이 아닙니다.");
			}
		}
	});
}

//리뷰수정
function goEditReview(review_id){
	//리뷰 수정 페이지로 이동
	if(!confirm("정말 리뷰를 수정하시겠습니까?")){
		return;
	}
	location.href="/book/reviews/update/"+review_id;
}

//댓글등록
function sendRpl(review_id){
	$.ajax({
		url:"/review/comment/"+review_id,
		type:"post",
		data:{
			content:$($("form[name='comment-form']").find("p").find("input[name='content']")).val()
		},
		success:function(result){
			var json = JSON.parse(result);
			if(json.result==1){
				alert("댓글등록 성공");
				location.reload();
			}else{
				alert("댓글등록 실패");
			}
		}
	});
}