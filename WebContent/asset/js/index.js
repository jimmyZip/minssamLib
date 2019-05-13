/**
 * this javascript source file is for index page recent review, best review, top rated books
 */
$(function(){
	//getTopRatedBook();//calling top rated book list
	getRecentReview();//calling recent review list
});
function getRecentReview(){
	$.ajax({
		url:"/book/review/summary",
		type:"get",
		success:function(result){
			renderRecentRvList(JSON.parse(result));
		},
		error:function(result){
			alert("실패결과 : "+result);
		}
	});
}

//최근리뷰 리스트 화면처리
function renderRecentRvList(json){
	$(".recent-review-inner").html("");
	var count = 1;
	for (var i = 0; i < json.reviewLimitList.length; i++) {
		var obj = json.reviewLimitList[i];
		$(".recent-review-inner").append("<li class=\"recent-review\">");
		$(".recent-review-inner").append("<p class=\"review-no\"><span class=\"rv-num\">"+(count+i)+"</span></p>");
		$(".recent-review-inner").append("<p class=\"review-title\"><span class=\"ellipsis\"  onClick=\"goReviewDetail("+obj.isbn+")\">"+obj.title+"</span></p>");
		$(".recent-review-inner").append("<p class=\"reviewer-info\"><span class=\"reviewer-id\">"+obj.id+"</span></p>");
		$(".recent-review-inner").append("<p class=\"rv-regdate\"><span class=\"review-regdate\">"+obj.regdate+"</span></p>");
		$(".recent-review-inner").append("</li>");
	}
	
	//동적 생성 태그에 대한 스타일처리....매우 비효율적이지만 급하니까...우선 다 적음
	$(".recent-review").css({
		"width":"100%",
		"overflow":"hidden",
	});
	$("p.review-no,p.review-title,p.reviewer-info,p.rv-regdate").css({
		"float":"left",
		"lineHeight":"2rem",
	});
	$(".recent-review-inner .recent-review p.review-no").css({"width":"5%"});
	$(".recent-review-inner .recent-review p.review-title").css({"width":"40%"});
	$(".recent-review-inner .recent-review p.reviewer-info").css({"width":"25%"});
	$(".recent-review-inner .recent-review p.rv-regdate").css({"width":"30%"});
	
	$(".rv-num,.ellipsis,.reviewer-id,.review-regdate").css("color","white");
	$("p.review-title span.ellipsis").css({
		"cursor":"pointer"
	});
	$("p.review-title span.ellipsis").hover(function(){
		$(this).css({
			"color":"red",
			"textDecoration":"underline"
		});
	},function(){
		$(this).css({
			"color":"white",
			"textDecoration":"none"
		});
	});
	//동적 생성 태그에 대한 스타일처리....매우 비효율적이지만 급하니까...우선 다 적음
}

//클릭한 리뷰제목 상세보기
function goReviewDetail(isbn){
	location.href="/book/reviews/"+isbn;
}

//리뷰 더보기 이동
function moreReview(){
	location.href="/book/reviews";
}