<%@page import="com.books.common.Pager"%>
<%@page import="com.books.model.domain.book.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<Review> reviewList = (List)request.getAttribute("reviewList");
	Pager pager = (Pager)request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp" %>
<style>
.page_href{
	display: unset;
}
</style>
<script>
function deleteReview(review_id){
	if(!confirm("삭제 하시겠습니까?")){
		return
	}
	
	$.ajax({
		url:"/admin/review/"+review_id,
		type:"delete",
		success:function(result){
			var json = JSON.parse(result);
			if(json.resultCode == 0){
				alert(json.msg);
			}
			location.reload(true);
		}
	})
}
</script>
<title>관리자용 페이지 - 리뷰관리</title>
</head>
<!-- head end -->
<body>
	
    <!-- header start -->
	<%@include file="/include/header.jsp"%>
	<!-- header end -->
	<!-- page visual -->
    <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">관리자용 페이지 입니다</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
	    </div>
    </div>
	<!-- blog list start -->
	
	<div class="wrap main cl mypage">
	<!-- 사이드 메뉴 include -->
	<%@include file="/include/adminSide.jsp" %>
	   <div class="list-section">
	       <table class="table_basic my_lecture_list">
	           <thead>
	               <tr>
                       <th>순서</th>
                       <th>이미지</th>
                       <th>리뷰 제목</th>
                       <th>내용</th>
                       <th>작성자</th>
                       <th>작성일</th>
                       <th>삭제</th>
	               </tr>
	           </thead>
	           <tbody id="container">
	           		<%int num = pager.getNum(); %>
	           		<%int curPos = pager.getCurPos(); %>
	           		<%for(int i=0; i<pager.getPageSize(); i++){ %>
		           		<%if(num<1) break; %>
		           		<%Review review = reviewList.get(curPos++); %>
							<tr>
								<td><%=num-- %></td>
								<td><img src=<%=review.getImg() %> /></td>
								<td><%=review.getTitle() %></td>
								<td><%=review.getContent() %></td>
								<td><%=review.getMember().getNickname() %>(<%=review.getMember().getId() %>)</td>
								<td><%=review.getRegdate() %></td>
								<td><button onClick='deleteReview(<%=review.getReview_id()%>)'>삭제</button></td>
							</tr>
						<%} %>
						<tr>
							<td colspan="7">
								<%if(pager.getFirstPage()-1>0){ %>
									<a class="page_href" href="/admin/review/page?currentPage=<%=pager.getFirstPage()-1%>">[prev]</a>
								<%}else{ %>
									<a class="page_href" href="javascript:alert('첫페이지 입니다.')">[prev]</a>
								<%} %> 
								<%for(int i=pager.getFirstPage(); i<=pager.getLastPage(); i++){ %>
									<%if(i>pager.getTotalPage()) break; %>
									<a class="page_href" href="/admin/review/page?currentPage=<%=i%>">[<%=i %>]</a>
								<%} %>
								<%if(pager.getLastPage()+1<pager.getTotalPage()) {%>
									<a class="page_href" href="/admin/review/page?currentPage=<%=pager.getLastPage()+1%>">[next]</a>
								<%}else{ %>
									<a class="page_href" href="javascript:alert('마지막 페이지입니다.')">[next]</a>
								<%} %>
								
							</td>
						</tr>
	           </tbody>
	       </table>
	   </div>
	</div>
	
	<!-- footer start -->
	<%@include file="/include/footer.jsp" %>

	<!-- footer end -->

</body>
</html>       