<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
	<div class="wrap main cl">
		<div class="content-section list-section campus-section">
			<h2 style="display: block !important;">도서 상세정보</h2>
			<div class="book-result-wrap">
				<h3><span>0000</span>상세정보</h3>
				<!-- 도서 검색결과 1건 단위 -->
				<div class="book-list">
					<dl class="book-list-inner">
						<dt class="imgArea">
							<img src="/asset/images/book_sample_2.jpg" alt="도서 이미지">
						</dt>
						<dd class="descArea">
							<p class="bTitle">책 제목</p>
							<p class="bInfo">
								<span>출판사</span><i class="divider">&nbsp;|&nbsp;</i><span>출판일</span>
							</p>
							<p class="bScore">
								<span>평점</span>
								<span class="repuStar">									
									<img src="/asset/images/star_filled.png" alt="별점 이미지_filled">
									<img src="/asset/images/star_filled.png" alt="별점 이미지_filled">
									<img src="/asset/images/star_filled.png" alt="별점 이미지 _filled">
									<img src="/asset/images/star_filled.png" alt="별점 이미지_filled">
									<img src="/asset/images/star_empty.png" alt="별점 이미지_empty">
								</span>
								<i class="divider">&nbsp;|&nbsp;</i>
								<span>
									리뷰<i>(리뷰 갯수)&nbsp;건</i>
								</span>
							</p>
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
								<p><a href="#none" title="리뷰 쓰기">리뷰 쓰기</a></p>
							</dd>
						<%} %>
					</dl>
				</div>
				<!-- 도서 검색결과 1건 단위 끝-->
			</div>
			<section class="bookIntro">
				<h3>책 소개</h3>
				<article class="introInner">
					<h4>이 책으로 말할 것 같으면~</h4>
					<p>
						『이것이 자바다』는 15년 이상 자바 언어를 교육해온 자바 전문강사의 노하우를 아낌 없이 담아낸 자바 입문서이다. 자바 입문자를 배려한 친절한 설명과 배려로 1장에 풀인원 설치 방법을 제공하여 쉽게 학습환경을 구축할 수 있다. 또한 중급 개발자로 나아가기 위한 람다식(14장), JavaFX(17장), NIO(18~19장) 수록되어 있으며 각 챕터마다 확인문제 제공. 풀이와 답은 인터넷 강의에서 친절한 해설을 통해 알려준다.
					</p>
				</article>
			</section>
			<section class="reviewAreaWrap">
				<h3>Review</h3>
				<div class="reviewArea">
					<h4>이 책에 대한 독자 회원님들의 평가</h4>
					<p class="writeBtn">
						<a>리뷰 쓰기</a>
					</p>
					<!-- 리뷰 감싸는 영역 -->
					<ul class="reviewInnerWrap">
						<!-- 리뷰 한 단위 시작 -->
						<li class="reviewUnit">
							<div class="reviewImg">
								<img class="reviewThumb" src="/asset/images/review_img_samle.jpg" alt="리뷰 썸네일 이미지"/>
							</div>
							<div class="reviewTitStat">
								<p class="reviewTitle">리뷰제목</p>
								<div class="reviewStat">
									<p class="ddabong">
										<img src="/asset/images/like_on.png" alt="좋아요 이미지"/>
										<i class="ddabongCnt"></i>
									</p>
									<p class="commentOnReview">
										<span>댓글</span>
										<i class="commentCnt">건</i>
									</p>
								</div>
								<p class="reviewContent">
									It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
								</p>
							</div>
						</li>
						<!-- 리뷰 한 단위 종료 -->
					</ul>
					<!-- 리뷰 감싸는 영역 종료 -->
				</div>
				<button type="button">리뷰에 대한 댓글보기</button>
				<!-- 이 책에 대한 리뷰에 달린 댓글 감싸는 영역 -->
				<div class="reviewCommentWrap">
					<h4>리뷰에 대한 댓글</h4>
					<ul class="commentList">
						<!-- 댓글 한 단위 -->
						<li class="commentUnit">
							<p class="commentContent">정말 띵작입니다. 강추강추</p>
							<p class="replyListBtn">
								<a href="#none" class="replyEdit"><span>수정하기</span></a>
								<a href="#none" cass="replyDel"><span>삭제하기</span></a>
							</p>
						</li>
						<!-- 댓글 한 단위 -->
					</ul>
					<div class="postCommentWrap">
						<form name="comment-form">
							<fieldset>
								<p>
									<input type="text" name="replycontent" placeholder="코멘트를 입력해주세요"/>
								</p>
							</fieldset>						
						</form>
						<p>
							<button type="button">코멘트 등록</button>
						</p>
					</div>
				</div>
				<!-- 이 책에 대한 리뷰에 달린 댓글 감싸는 영역 -->
			</section>
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
	</div>
	<!-- bookDetail end -->
	<!-- footer start -->
    <%@ include file="/include/footer.jsp" %>
    <!-- footer end -->
</body>
</html>