<%@page import="com.books.model.domain.book.Review"%>
<%@page import="com.books.model.domain.book.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String isbn = (String)request.getAttribute("isbn");
	List<Book> detailList = (List)request.getAttribute("detailList");
	Book bookInfo = detailList.get(0);
	Review review = new Review();
	review.setIsbn(isbn);
	System.out.println("review에 주입한 isbn :: "+review.getIsbn());
%>
<head>
<link rel="stylesheet" type="text/css" href="/asset/css1/preview.css">
<script src="/asset/js/previewFile.js" type="text/javascript"></script>
</head>
<div class="wrap main cl">
		<div class="content-section write-section">
			<h2 style="display: block !important;">Review 미리보기</h2>
			<%--Book bookInfo = detailList.get(0); --%>
			<div class="write-form-wrap">
				<div class="container">
					<form>
						<input type="text" id="title" name="title" readonly value="리뷰제목입력" /><!-- 
				   --><input type="text" id="writer" name="writer" readonly value="" />
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
						<textarea id="content" name="content"></textarea>
						<div class="myReviewImg">
							<!-- 리뷰 게시글에 등록할 목적으로 이미지를 선택했음을 보여주는 영역 -->
							<div class="showImgZone">
								<hr>
								<ul class="selectedImgList">
									<li class="imgListUnit">									
										<img src="" alt="선택한 업로드 이미지"/>
									</li>
								</ul>
							</div>
						</div>
					</form>
					<ul class="btnArea">
						<li><input type="button" value="닫기"/></li>
					</ul>
				</div>
			</div>
		</div>
	</div>