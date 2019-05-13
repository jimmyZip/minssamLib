<%@page import="com.books.common.Pager"%>
<%@page import="java.io.Console"%>
<%@page import="com.books.model.domain.book.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<Book> searchList = (List)request.getAttribute("searchList");
	String isbn = searchList.get(0).getIsbn();
	String searchWord = request.getAttribute("searchWord").toString();
	String currentPage = request.getAttribute("currentPage").toString();
	Pager pager = (Pager)request.getAttribute("pager");
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
$(function(){
	var isbn = "<%=isbn%>";
});
// 북마크 추가하는 함수
function addBookmark(isbn){
	$.ajax({
		url:"/bookmark/insert/"+isbn,
		type:"get",
		success:function(result){
			var json = JSON.parse(result)
			if(json.resultCode==1){ // 추가 성공
				alertResultCode(result);
			}else{ // 이미 추가된 파일
				if(confirm(json.msg+"삭제하시겠습니까?")){
					deleteBookmark(isbn);
				}
			}
		}
	});
}

// 북마크 삭제 함수
function deleteBookmark(isbn){
	$.ajax({
		url:"/bookmark/delete/"+isbn,
		type:"get",
		success:function(result){
			alertResultCode(result);
		}
	});
}

// 주문도서목록 추가 함수
function addOrderbook(isbn){
	$.ajax({
		url:"/orderbook/insert/"+isbn,
		type:"get",
		success:function(result){
			var json = JSON.parse(result)
			if(json.resultCode==1){ // 추가 성공
				alertResultCode(result);
			}else{ // 이미 추가된 파일
				if(confirm(json.msg+"삭제하시겠습니까?")){
					deleteOrderbook(isbn);
				}
			}
		}
	});
}

// 주문도서목록 삭제하는 함수
function deleteOrderbook(isbn){
	$.ajax({
		url:"/orderbook/delete/"+isbn,
		type:"get",
		success:function(result){
			alertResultCode(result);
		}
	});
}

// 리뷰 목록 보기
function viewReview(isbn){
	<%if(session.getAttribute("member") != null){%> 
		// 로그인 한 사용자만 동작
		$.ajax({
			url:"/book/search/insert?isbn="+isbn,
			type:"get"
		});
	<%}%>
	
	// 페이지 이동
	location.href="/book/search/detail/"+isbn;
}

// 리뷰 작성하러가기
function writerReview(isbn){
	location.href="/book/reviews/"+isbn;
}

// 세부 목록 보기
function bookDetailView(isbn){
	//alert(isbn);
	//console.log(isbn);
	// 검색 페이지 추가
	<%if(session.getAttribute("member") != null){%> 
		// 로그인 한 사용자만 동작
		$.ajax({
			url:"/book/search/insert?isbn="+isbn,
			type:"get"
		});
	<%}%>

	// 페이지 이동
	location.href="/book/search/detail/"+isbn;
}

// 결과 코드 alert 창으로 보여주는 코드
function alertResultCode(json){
	var json = JSON.parse(json);
	alert(json.msg);
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
				<h3 class="schResultH3"><span><%=searchWord %></span>검색결과</h3>
				<%if(searchList.size()==0){ %>
					<h4>검색 결과가 없습니다.</h4>
				<%} %> 
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
							<a href="javascript:bookDetailView(<%=book.getIsbn()%>)" ><p class="bTitle bListTitle"><%=book.getTitle() %></p></a>
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
									<i><%=(double)avgScore %>점</i>							
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
								<p><a href="javascript:addBookmark('<%=book.getIsbn() %>')" title="북마크 추가">북마크 추가</a></p>
								<p><a href="javascript:addOrderbook('<%=book.getIsbn() %>')" onClick="addOrderbook('<%=book.getIsbn() %>>')" title="구매한 도서 추가">구매한 도서 추가</a></p>
								<p><a href="javascript:viewReview('<%=book.getIsbn() %>')" title="리뷰 보기">리뷰 보기</a></p>
								<p><a href="javascript:writerReview('<%=book.getIsbn() %>')" title="리뷰 쓰기">리뷰 쓰기</a></p>
							</dd>
						<%} %>
					</dl>
				</div>
				<!-- 도서 검색결과 1건 단위 끝-->
				<%} %>
			</div>
		</div>
	</div>
 	<!--paging start-->
    <div class="page cl">
    	<%if(pager.getFirstPage()-1>0) {%>
        <a href="/book/search/<%=searchWord%>/<%=pager.getFirstPage()-1%>">prev</a>
        <%}else{ %>
        <a href="javascript:alert('첫페이지 입니다.')">prev</a>        
        <%} %>
        <%for(int i=pager.getFirstPage(); i<=pager.getLastPage(); i++){ %>
        	<%if(i>pager.getTotalPage()) break; %>
        	<%if(i==pager.getCurrentPage()){ %>
        		<a href="/book/search/<%=searchWord %>/<%=i %>" class="cnt"><%=i %></a>
        	<%}else{ %>
        		<a href="/book/search/<%=searchWord %>/<%=i %>"><%=i %></a>
        	<%} %>
        <%} %>
        <%if(pager.getLastPage()+1<pager.getTotalPage() && pager.getLastPage()+1<100) {%>
        	<a href="/book/search/<%=searchWord%>/<%=pager.getLastPage()+1%>">next</a>
        <%}else{ %>
        	<a href="javascript:alert('마지막 페이지입니다.')">next</a>
        <%} %>
    </div>
    <!-- paging end -->
	<!-- book search result list end -->
	<!-- footer start -->
    <%@ include file="/include/footer.jsp" %>
    <!-- footer end -->
</body>
</html>
