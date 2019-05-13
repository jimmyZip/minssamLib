<%@page import="com.books.model.domain.book.Review"%>
<%@page import="com.books.model.domain.book.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String isbn = (String)request.getAttribute("isbn");
	List<Book> detailList = (List)request.getAttribute("thisDetailList");
	Review thisReview = (Review)request.getAttribute("thisReview");
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<title>book review edit form</title>
<script src="/asset/js/review_update.js" type="text/javascript"></script>
</head>
<body>
	<!-- header start -->
	<%@include file="/include/header.jsp"%>
	<!-- header end -->
	<!-- subpage visual start -->
	<div class="bg bg_review">
		<div class="wrap">
			<span class="red shadow">민쌤의 서재 작성한 리뷰 수정페이지입니다.</span>
			<h2>Book Review update</h2>
		</div>
	</div>
	<!-- subpage visual end -->
	<!-- book review write start -->
	<div class="wrap main cl">
		<div class="content-section write-section">
			<h2 style="display: block !important;">Review 수정하기</h2>
			<%Book bookInfo = detailList.get(0); %>
			<div class="write-form-wrap">
				<div class="container">
					<!-- <form enctype="multipart/form-data" name="review-update-form"> -->
					<form enctype="multipart/form-data" name="review-update-form">
						<input type="hidden" name="member.member_id" value="<%=member.getMember_id()%>"/>
						<input type="hidden" name="review_id" value="<%=thisReview.getReview_id()%>"/>						
						<input type="hidden" name="isbn" value="<%=thisReview.getIsbn() %>"/>
						<input type="text" id="title" name="title" value="<%=thisReview.getTitle() %>"/><!-- 
				   --><input type="text" id="writer" name="writer" readonly value="<%=member.getId() %>(<%=member.getName() %>)님" />
						<dl class="bookInfoArea">
							<dt class="bookImg">
								<img src="<%=bookInfo.getImage() %>" alt="<%=bookInfo.getTitle() %> 이미지"/>
							</dt>
							<dd class="bookDesc">
								<h3>리뷰할 도서 정보</h3>
								<p>
									<b>제목&nbsp;</b>
									<span><%=bookInfo.getTitle() %></span>
								</p>
								<p>
									<b>저자&nbsp;</b>
									<span><%=bookInfo.getAuthor() %></span>
								</p>
								<p>
									<b>출판사&nbsp;</b>
									<span><%=bookInfo.getPublisher() %></span>
								</p>
								<p>
									<b>출판일&nbsp;</b>
									<span><%=bookInfo.getPubdate() %></span>
								</p>
							</dd>
						</dl>						
						<textarea id="content" name="content">
							<%= thisReview.getContent()%>
						</textarea>
						<div class="myReviewImg">
							<p class="imgSelectZone">							
								<label for="img">첨부할 이미지선택</label>
								<input type="file" id="img" name="img"/>
							</p>
							<!-- 리뷰 게시글에 등록할 목적으로 이미지를 선택했음을 보여주는 영역 -->
							<div class="showImgZone">
								<p>
									<input type="checkbox" id="checkAll"/>
									<label for="checkAll">이미지 전체 선택/해제</label>
									<span onClick="imgRegistCancel()">삭제</span>
								</p>
								<hr>
								<ul class="selectedImgList"></ul>
							</div>
						</div>
					</form>
					<ul class="btnArea">
						<li><input type="button" value="수정등록"/></li>
						<li><input type="button" value="목록보기"/></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- book review write end -->
	<!-- footer start -->
	<%@ include file="/include/footer.jsp"%>
	<!-- footer end -->
</body>
</html>