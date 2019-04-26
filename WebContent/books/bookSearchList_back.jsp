<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Book Search Result</title>
<%@include file="/include/head.jsp" %>
</head>
<!-- head end -->
<body>
	<!-- header start -->
	<%@include file="/include/header.jsp" %>
	<!-- header end -->
	<div class="bg bg_bookList">
		<div class="wrap">
			<span class="red shadow">민쌤의 서재 도서 검색 목록입니다.</span>
			<h2>Book Search Result</h2>
		</div>
	</div>
	<!-- book search result list start -->
	<div class="wrap main cl">
		<div class="content-section list-section campus-section">
			<h2 style="display: block !important;">도서 목록</h2>
			<div class="book-result-wrap">
				<h3><span>0000</span>검색결과</h3>
				<!-- 도서 검색결과 1건 단위 -->
				<div class="book-list">
					<dl class="book-list-inner">
						<dt class="imgArea">
							<img src="/asset/images/book_sample.jpg" alt="도서 이미지">
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
						<dd class="btnArea">
							<p><a href="#none" title="북마크 추가">북마크 추가</a></p>
							<p><a href="#none" title="구매한 도서 추가">구매한 도서 추가</a></p>
							<p><a href="#none" title="리뷰 보기">리뷰 보기</a></p>
							<p><a href="#none" title="리뷰 쓰기">리뷰 쓰기</a></p>
						</dd>
					</dl>
				</div>
				<!-- 도서 검색결과 1건 단위 끝-->
				<!-- 도서 검색결과 1건 단위 -->
				<div class="book-list">
					<dl class="book-list-inner">
						<dt class="imgArea">
							<img src="/asset/images/book_sample.jpg" alt="도서 이미지">
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
						<dd class="btnArea">
							<p><a href="#none" title="북마크 추가">북마크 추가</a></p>
							<p><a href="#none" title="구매한 도서 추가">구매한 도서 추가</a></p>
							<p><a href="#none" title="리뷰 보기">리뷰 보기</a></p>
							<p><a href="#none" title="리뷰 쓰기">리뷰 쓰기</a></p>
						</dd>
					</dl>
				</div>
				<!-- 도서 검색결과 1건 단위 끝-->
			</div>
		</div>
		<!-- floating side bar menus -->
		<!-- 
		<div class="category-section cl">
			<ol class="category_bookList cl">
				<li class="on"><a href="/campus/">북마크 추가</a></li>
				<li><a href="/campus/">구매한 도서 추가</a></li>
				<li><a href="/campus/">리뷰 보기</a></li>
				<li><a href="/campus/">리뷰 쓰기</a></li>
			</ol>
		</div>
		 -->
		<!-- floating side bar menus ends -->
	</div>
 	<!--페이징-->
    <div class="page cl">
        <a href="#">prev</a>
        <a href="#" class="cnt">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">···</a>
        <a href="#">next</a>
    </div>
	<!-- book search result list end -->
	<!-- footer start -->
    <%@ include file="/include/footer.jsp" %>
    <!-- footer end -->
</body>
</html>
