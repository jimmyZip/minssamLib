<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book review write form</title>
<%@include file="/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="/asset/css1/review_write.css"/>
<script src="https://cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>
<script src="/asset/js/review_write.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			<h2 style="display: block !important;">Review 작성하기</h2>
			<div class="write-form-wrap">
				<div class="container">
					<form>
						<input type="text" id="writer" name="writer" placeholder="작성자"/>
						<input type="text" id="title" name="title" placeholder="제목입력"/>
						<textarea id="content" name="content"></textarea>
						<input type="button" value="리뷰등록"/>
					</form>
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