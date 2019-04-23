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
			<span class="red shadow">민쌤의 서재 리뷰 페이지입니다.</span>
			<h2>Book Review</h2>
		</div>
	</div>
	<!-- book review list start -->
	<div class="wrap main cl">
		<div class="content-section list-section campus-section">
			<h2 style="display: block !important;">민쌤의 서재 도서 Review</h2>
			<div class="campus-wrap">
				<div class="campus-list">
					<a href="/campus/detail.jsp" class="cl"> 
						<img src="/asset/images/campus_sample.jpg" alt="캠퍼스 이미지">
						<span>bookname</span>
						<span></span>
					</a>
				</div>
				<div class="campus-list">
					<a href="/campus/detail.jsp" class="cl">
						<img src="/asset/images/campus_sample.jpg" alt="캠퍼스 이미지">
						<span>블록체인	3기 열공 모습</span>
					</a>
				</div>
				<div class="campus-list">
					<a href="/campus/detail.jsp" class="cl"> <img
						src="/asset/images/campus_sample.jpg" alt="캠퍼스 이미지"> <span>블록체인
							3기 열공 모습</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 캠퍼스 Story list end -->
	<!-- footer start -->
    <%@ include file="/include/footer.jsp" %>
    <!-- footer end -->
</body>
</html>
