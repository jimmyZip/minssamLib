<%@page import="com.books.model.domain.book.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Book Review Page</title>
<%@include file="/include/head.jsp" %>
<link rel="stylesheet" type="text/css" href="/asset/css1/review_list.css">
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
			<c:if test="${allReviewList.size()==0}">
				<h4>아직 유저 작성 리뷰가 없습니다.</h4>
			</c:if>
			<ul class="review-list-wrap">
				<c:set var="curPos" value="{pager.curPos}"/>
				<c:forEach var="reviewList" items="${allReviewList}" begin="${pager.curPos}" end="${pager.curPos+pager.pageSize-1}">
					<!-- 리뷰 1단위 -->
					<li class="review-list">
						<a href="#none" class="rv-inner"> 
							<p class="review-img" style="background-image:url(/upload/${reviewList.img});background-repeat:no-repeat;background-size:contain;background-position:center center;"></p>	
							<p class="review-info">
								<span class="bookTit">${reviewList.book.title }</span>
								<span class="reviewTit">${reviewList.title }</span>
							</p>
							<div class="reaction-area">						
								<p class="like-reaction">
									<img src="/asset/images/like_fade_ver2.png" alt="좋아요"/>
									<i class="likeCnt">1</i>
								</p>
								<p class="rpl-reaction">
									<span>댓글</span>
									<i class="rplCnt">건</i>
								</p>
							</div>
						</a>
					</li>
					<!-- 리뷰 1단위 -->
				</c:forEach>
			</ul>
			<!--paging start-->
		    <div class="page cl">
		    	<!-- 이전 블럭 -->
				<c:if test="${pager.firstPage-1>0} }">
					<a href="/book/reviews?currentPage=${pager.firstPage-1}">prev</a>
				</c:if>
				<c:if test="${pager.firstPage-1<=0}">
					<a href="javascript:alert('첫페이지 입니다.')">prev</a>
				</c:if>
				<!-- 페이지 표시 -->
				<c:forEach var="i" begin="${pager.firstPage}" end="${pager.lastPage}">
					<c:if test="${i<=pager.totalPage}">
						<a class="cnt" href="/book/reviews?currentPage=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<!-- 다음 블럭 -->
				<c:if test="${pager.lastPage+1<pager.totalPage}">
					<a href="/book/reviews?currentPage=${pager.lastPage+1}">next</a>
				</c:if>
				<c:if test="${pager.lastPage+1>=pager.totalPage }">
					<a href="javascript:alert('마지막 페이지입니다.')">next</a>
				</c:if>
		    </div>
			<!-- paging end -->
		</div>
	</div>
	<!-- 캠퍼스 Story list end -->
	<!-- footer start -->
    <%@ include file="/include/footer.jsp" %>
    <!-- footer end -->
</body>
</html>
