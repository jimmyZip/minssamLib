<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Book Review Page</title>
<%@include file="/include/head.jsp" %>
</head>
<body>
	<!-- header start -->
	<%@include file="/include/header.jsp" %>
	<!-- header end -->
	<div class="bg bg_review">
		<div class="wrap">
			<span class="red shadow">민쌤의 서재 리뷰 게시판입니다.</span>
			<h2>Book Review</h2>
		</div>
	</div>
	<!-- book review list start -->
	<div class="wrap main cl">
		<div class="content-section list-section review-section">
			<h2 style="display: block !important;">민쌤의 서재 도서 Review</h2>
			<ul class="review-list-wrap">
				<li class="review-list">
					<a href="/campus/detail.jsp" class="cl"> 
						<img src="/asset/images/campus_sample.jpg" alt="캠퍼스 이미지">
						<p class="review-info">
							<span class="bookTit">책제목</span>
							<span class="reviewTit">리뷰제목</span>
						</p>
						<div class="reaction-area">
						
						</div>
						<p class="like-reaction">
							<img src="" alt="좋아요"/>
							<i class="likeCnt"></i>
						</p>
						<p>
							<span>댓글</span>
							<i class="rplCnt">건</i>
						</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 캠퍼스 Story list end -->
	<!-- footer start -->
    <%@ include file="/include/footer.jsp" %>
    <!-- footer end -->
</body>
</html>
