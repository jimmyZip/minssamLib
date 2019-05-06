<%@page import="com.books.model.domain.book.Book"%>
<%@page import="com.books.common.Pager"%>
<%@page import="com.books.model.domain.book.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.books.model.domain.member.Searchbook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%!Pager pager = new Pager(); %>
<%
	List<Book> detailList = (List)request.getAttribute("detailList");
	//System.out.println(detailList.size());
	//System.out.println(detailList.get(0).getLink());
	List<Review> reviewList = (List)request.getAttribute("reviewList");
	//if(reviewList.size()>0){		
		//pager.init(request, reviewList.size());
	//}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<title>Book Detail Info</title>
</head>
<body>
	<!-- header start -->
	<%@include file="/include/header.jsp" %>
	<!-- header end -->
	<div class="bg bg_bookDetail">
		<div class="wrap">
			<span class="red shadow">검색도서 상세정보 페이지입니다.</span>
			<h2>Book Detail Info</h2>
		</div>
	</div>
	<!-- bookDetail start -->
	<%Book bookDetail = detailList.get(0); %>
	<div class="wrap main cl">
		<div class="content-section list-section campus-section">
			<h2 style="display: block !important;">도서 상세정보</h2>
			<div class="book-result-wrap">
				<h3><span><%=bookDetail.getTitle() %></span>상세정보</h3>
				<!-- 도서 검색결과 1건 단위, 관련 css문서는 campus.css -->
				<div class="book-list">
					<dl class="book-list-inner">
						<dt class="imgArea">
							<img src="<%=bookDetail.getImage() %>" alt="도서 이미지">
						</dt>
						<dd class="descArea">
							<p class="bTitle"><%=bookDetail.getTitle() %></p>
							<p class="bInfo">
								<span>출판사</span><i class="divider">&nbsp;|&nbsp;</i><span>출판일</span><i class="divider">&nbsp;|&nbsp;</i><span>ISBN</span>
							</p>
							<p class="bInfo">
								<span><%=bookDetail.getPublisher() %></span><i class="divider">&nbsp;|&nbsp;</i><span><%=bookDetail.getPubdate() %></span><i class="divider">&nbsp;|&nbsp;</i><span><%=bookDetail.getIsbn() %></span>
							</p>
							<div class="bScore">
								<span>평점</span>
								<i id="scoreTooltip">?</i>
								<!-- 평점계산 안내 tooltip --> 
								<p class="tooltipText">
									회원님들께서 도서 상세페이지에서 매긴 별점의 합을
									별점부여에 참여하신 회원 수로 나누어
									평점을 계산하고 정수단위 갯수의 별을 표시합니다.
								</p>
								
								<span class="repuStar">									
									<img src="/asset/images/star_filled.png" alt="별점 이미지_filled">
									<img src="/asset/images/star_filled.png" alt="별점 이미지_filled">
									<img src="/asset/images/star_filled.png" alt="별점 이미지 _filled">
									<img src="/asset/images/star_filled.png" alt="별점 이미지_filled">
									<img src="/asset/images/star_empty.png" alt="별점 이미지_empty">
								</span>
								<i class="divider">&nbsp;|&nbsp;</i>
								<span>
									리뷰<i><%=reviewList.size() %>&nbsp;건</i>
								</span>
							</div>
						</dd>
						<!-- 로그인 안되어있을대 처리 -->
						<%if(session.getAttribute("member") == null){ %>
							<dd class="btnArea">
								<p><a href="javascript:loginFailAlert()" title="북마크 추가">북마크 추가</a></p>
								<p><a href="javascript:loginFailAlert()" title="구매한 도서 추가">구매한 도서 추가</a></p>
								<p><a href="javascript:loginFailAlert()" title="리뷰 쓰기">리뷰 쓰기</a></p>
							</dd>
						<!-- 로그인 되어 있을때 처리 -->
						<%}else {%>
							<dd class="btnArea">
								<p><a href="#none" title="북마크 추가">북마크 추가</a></p>
								<p><a href="#none" title="구매한 도서 추가">구매한 도서 추가</a></p>
								<p><a href="javascript:goWriteRv(<%=bookDetail.getIsbn() %>)" title="리뷰 쓰기">리뷰 쓰기</a></p>
							</dd>
						<%} %>
					</dl>
				</div>
				<!-- 도서 검색결과 1건 단위 끝-->
			</div>
			<section class="bookIntro">
				<h3>책 소개</h3>
				<a href="#none" id="bookIntro"></a>
				<article class="introInner">
					<h4>이 책으로 말할 것 같으면~</h4>
					<p><%=bookDetail.getDescription() %></p>
				</article>
			</section>
			<section class="bookScore">
				<h3>이 책에 대한 점수를 매겨주세요</h3>
				<article class="scoreInner">
					<h4>제 점수는요~?</h4>
					<p class="starImg">
						<img src="/asset/images/star_empty.png" alt="별점 이미지"/>
						<img src="/asset/images/star_empty.png" alt="별점 이미지"/>
						<img src="/asset/images/star_empty.png" alt="별점 이미지"/>
						<img src="/asset/images/star_empty.png" alt="별점 이미지"/>
						<img src="/asset/images/star_empty.png" alt="별점 이미지"/>
					</p>
					<p class="scoringArea">							
						<i class="reviewScore">0</i><span>&nbsp;점</span>
					</p>
					<form name="score-form">
						<input type="hidden" name="isbn" value="<%=bookDetail.getIsbn()%>"/>
						<input type="hidden" name="score" value=""/>
					</form>
					<button class="updateAvgScore" onclick="registScore()">내 점수를 평점에 반영하기</button>
				</article>
			</section>
			<section class="reviewAreaWrap">
				<%--
					int num=pager.getNum();
					int curPos = pager.getCurPos();
				--%>
				<%--for(int i=0;i<pager.getPageSize();i++){ --%>
				<%--if(num<1) break; --%>
				<%--Review review=reviewList.get(curPos++); --%>
				<!-- 리뷰 한 단위 시작 -->
				<h3>Review</h3>
				
				<div class="reviewArea">
					<h4>이 책에 대한 독자 회원님들의 평가</h4>
					<%Review review = new Review(); %>
					<%if(reviewList.size()==0) {%>
					<ul class="reviewInnerWrap">
						<!-- 리뷰 한 단위 시작 -->
						<li class="reviewUnit emptyReviewUnit">
							아직 이 책에 대해 작성된 회원님들의 리뷰가 없습니다.
						</li>
						<!-- 리뷰 한 단위 종료 -->
					</ul>
					<%} else{%>
					<%for(int i=0;i<reviewList.size();i++){ %>
					<%review = reviewList.get(i);%>
					<!-- 리뷰 감싸는 영역 -->
					<ul class="reviewInnerWrap">
						<li class="reviewUnit">
							<div class="reviewImg">
								<%if(review.getImg()==null){ %>
									<img class="reviewThumb" src="/asset/images/review_img_sample.jpg" alt="리뷰 썸네일 디폴트 이미지"/>
								<%}else{ %>
									<img class="reviewThumb" src="<%=review.getImg() %>" alt="리뷰 등록자가 등록한 리뷰 썸네일 이미지"/>
								<%} %>
							</div>
							<div class="reviewTitStat">
								<p class="reviewTitle"><%=review.getTitle() %></p>
								<div class="reviewStat">
									<p class="reviewWriter">
										<span>작성자</span>
										<i class="writerInfo"><%=review.getMember().getId() %>&nbsp;(<%=review.getMember().getNickname() %>)</i>
									</p>
									<p class="ddabong">
										<img src="/asset/images/like_on.png" alt="좋아요 이미지"/>
										<i class="ddabongCnt">10</i>
									</p>
									<p class="commentOnReview">
										<span>댓글</span>
										<i class="commentCnt">1건</i>
									</p>
								</div>
								<div class="reviewText"><%=review.getContent() %></div>
							</div>
						</li>
						<!-- 리뷰 한 단위 종료 -->
					</ul>
					<!-- 리뷰 감싸는 영역 종료 -->
				</div>
				<button class="showReply" type="button">이 리뷰에 대한 댓글보기</button>
				<!-- 이 책에 대한 리뷰에 달린 댓글 감싸는 영역 -->
				<div class="reviewCommentWrap">
					<h4>리뷰에 대한 댓글</h4>
					<ul class="commentList">
						<!-- 댓글 한 단위 -->
						<li class="commentUnit">
							<div class="commentInfo">							
								<p class="commentNum">No</p>
								<p class="commentNick">닉네임</p>
								<p class="commentContent">정말 띵작입니다. 강추강추</p>
							</div>
							<div class="replyListBtn">
								<a href="#none" class="replyEdit">수정하기</a>
								<a href="#none" cass="replyDel">삭제하기</a>
							</div>
						</li>
						<!-- 댓글 한 단위 -->
					</ul>
					<div class="postCommentWrap">
						<form name="comment-form">
							<p>
								<input class="replycontent" type="text" name="replycontent" placeholder="코멘트를 입력해주세요"/>
							</p>
						</form>
						<button type="button">코멘트 등록</button>
					</div>
					<!--paging start-->
				    <div class="page cl">
				        <a href="#">prev</a>
				        <a href="#" class="cnt">1</a>
				        <a href="#">2</a>
				        <a href="#">3</a>
				        <a href="#">···</a>
				        <a href="#">next</a>
				    </div>
			    <!-- paging end -->
				</div>
				<!-- 이 책에 대한 리뷰에 달린 댓글 감싸는 영역 -->
			<%} %>
			<%} %>
			</section>
		    <!-- googlemap area
		    <div class="gmapAreaWrap">
		    	<h3>Where this book is</h3>
		    	<div class="gmapArea">
		    		<h4>이 책을 보유한 도서관 위치보기</h4>
		    		<section id="googleMap"></section>
		    	</div>
		    </div>
		    -->
		    <!-- go buy thisbook area -->
		    <div class="orderArea">
		    	<h4>이 책을 구매하시려면</h4>
		    	<p class="orderBtn">
		    		<a href="<%=bookDetail.getLink()%>" title="초록창에서 구매정보 보러 가기" target="_blank">뇌입어에서 구매정보 보러 가기</a>
		    	</p>
		    </div>
		    <!-- go buy thisbook area end-->
		</div>
	</div>
	<!-- bookDetail end -->
	<!-- footer start -->
    <%@ include file="/include/footer.jsp" %>
    <!-- footer end -->
</body>
</html>