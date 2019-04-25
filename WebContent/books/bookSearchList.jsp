<%@page import="java.io.Console"%>
<%@page import="com.books.model.domain.book.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<Book> searchList = (List)request.getAttribute("searchList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Book Search Result</title>
<%@include file="/include/head.jsp" %>
<script>
function loginFailAlert(){
	alert("로그인이 필요한 서비스 입니다.");
}

</script>
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
				<h3><span><%=request.getAttribute("searchWord") %></span>검색결과</h3>
				
				<%for(int i=0; i<searchList.size(); i++){ %>
				<%Book book = searchList.get(i); %>
				<%// 평점 계산
					int scoreCnt = book.getScore().size();
					int avgScore = 0;
					if(scoreCnt>0){	// score 평가 한거만 표시
						int totalScore = 0;
						for(int s=0; s<scoreCnt; s++){ // 점수 합계 계산
							totalScore+=book.getScore().get(i).getScore();
						}
						avgScore = totalScore/scoreCnt;
					}
				%>
				<!-- 도서 검색결과 1건 단위 -->
				<div class="book-list">
					<dl class="book-list-inner">
						<dt class="imgArea">
							<img src="<%=book.getImage() %>" alt="도서 이미지">
						</dt>
						<dd class="descArea">
							<!-- detail 페이지로 넘어갈 링크 주소 필요!! -->
							<a href="#<%=book.getIsbn()%>" ><p class="bTitle"><%=book.getTitle() %></p></a>
							<p class="bInfo">
								<span><%=book.getPublisher() %></span><i class="divider">&nbsp;|&nbsp;</i><span><%=book.getPubdate() %> </span>
							</p>
							<p class="bScore">
								<span>평점</span>
								<span class="repuStar">	
									<%for(int j=1; j<=5; j++){ %>
										<%if(avgScore>=j){%>
											<!-- 점수보다 현재 반복문 점수가 높으면 표시 -->
											<img src="/asset/images/star_filled.png" alt="별점 이미지_filled">
										<%}else{ %>
											<!-- 아니면 빈 이미지 표시 -->
											<img src="/asset/images/star_empty.png" alt="별점 이미지_empty">
										<%} %>
									<%} %>							

								</span>
								<i class="divider">&nbsp;|&nbsp;</i>
								<span>
									리뷰<i><%=book.getReview().size() %>&nbsp;건</i>
								</span>
							</p>
						</dd>
						<!-- 로그인 안되어있을대 처리 -->
						<%if(session.getAttribute("member") == null){ %>
							<dd class="btnArea">
								<p><a href="javascript:loginFailAlert()" title="북마크 추가">북마크 추가</a></p>
								<p><a href="javascript:loginFailAlert()" title="구매한 도서 추가">구매한 도서 추가</a></p>
								<p><a href="javascript:loginFailAlert()" title="리뷰 보기">리뷰 보기</a></p>
								<p><a href="javascript:loginFailAlert()" title="리뷰 쓰기">리뷰 쓰기</a></p>
							</dd>
						<!-- 로그인 되어 있을때 처리 -->
						<%}else {%>
							<dd class="btnArea">
								<p><a href="#none" title="북마크 추가">북마크 추가</a></p>
								<p><a href="#none" title="구매한 도서 추가">구매한 도서 추가</a></p>
								<p><a href="#none" title="리뷰 보기">리뷰 보기</a></p>
								<p><a href="#none" title="리뷰 쓰기">리뷰 쓰기</a></p>
							</dd>
						<%} %>
					</dl>
				</div>
				<!-- 도서 검색결과 1건 단위 끝-->
				<%} %>
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
