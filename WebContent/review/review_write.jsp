<%@page import="com.books.model.domain.book.Review"%>
<%@page import="com.books.model.domain.book.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String isbn = (String)request.getAttribute("isbn");
	List<Book> detailList = (List)request.getAttribute("detailList");
	Review review = new Review();
	review.setIsbn(isbn);
	System.out.println("review에 주입한 isbn :: "+review.getIsbn());

%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<title>book review write form</title>
</head>
<body>
	<!-- header start -->
	<%@include file="/include/header.jsp"%>
	<!-- header end -->
	<!-- subpage visual start -->
	<div class="bg bg_review">
		<div class="wrap">
			<span class="red shadow">민쌤의 서재 리뷰 페이지입니다.</span>
			<h2>Book Review</h2>
		</div>
	</div>
	<!-- subpage visual end -->
	<!-- book review write start -->
	<div class="wrap main cl">
		<div class="content-section write-section">
			<h2 style="display: block !important;">Review 작성하기</h2>
			<%Book bookInfo = detailList.get(0); %>
			<div class="write-form-wrap">
				<div class="container">
					<form enctype="multipart/form-data" name="review-write-form">
						<input type="hidden" name="member.member_id" value="<%=member.getMember_id()%>"/>
						<input type="hidden" name="isbn" value="<%=review.getIsbn() %>"/>
						<!-- <input type="hidden" name="score.score"/> -->
						<input type="text" id="title" name="title" placeholder="리뷰제목입력" /><!-- 
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
							<!-- 
							<dd class="bookScore">
								<b>제 점수는요?</b>
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
							</dd>
							 -->
						</dl>						
						<textarea id="content" name="content"></textarea>
						<div class="myReviewImg">
							<p class="imgSelectZone">							
								<label for="img">첨부할 이미지선택</label>
								<input type="file" id="img" name="myImg"/>
							</p>
							<!-- 리뷰 게시글에 등록할 목적으로 이미지를 선택했음을 보여주는 영역 -->
							<div class="showImgZone">
								<p>
									<input type="checkbox" id="checkAll"/>
									<label for="checkAll">이미지 전체 선택/해제</label>
									<span onClick="imgRegistCancel()">삭제</span>
								</p>
								<hr>
								<ul class="selectedImgList">
									<!-- 
									<li class="imgListUnit">									
										<input type="checkbox" class="chk"/>
										<img src="" alt="선택한 업로드 이미지"/>
									</li>
									 -->
								</ul>
							</div>
						</div>
					</form>
					<ul class="btnArea">
						<li><input type="button" value="미리보기"/></li>
						<li><input type="button" value="임시저장"/></li>
						<li><input type="button" value="리뷰등록"/></li>
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