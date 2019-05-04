<%@page import="com.books.common.Pager"%>
<%@page import="com.books.model.domain.book.BookComment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<BookComment> commentList = (List)request.getAttribute("bookCommentList");
	Pager pager = (Pager)request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp" %>
<script>
$(function(){
	getList();
});

//리스트 받아 옴
function getList(){
	$.ajax({
		url:"/admin/book_comment",
		type:"get",
		success:function(result){
			viewList(result);
		}
	});
}

// 리스트 출력
function viewList(json){
	var con = $("container");
}

// 삭제
function bookCommentDelete(id){
	$.ajax({
		url:"/admin/book_comment/"+id,
		type:"delete",
		success:function(){
			getList();
		}
	});
}

</script>
<title>관리자용 페이지 - 책 코멘트 관리</title>
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
                       <th>책 제목</th>
                       <th>내용</th>
                       <th>작성자</th>
                       <th>작성일</th>
                       <th>삭제</th>
	               </tr>
	           </thead>
	           <tbody id="container">
				   <% int num = pager.getNum();%>
           		   <% int curPos = pager.getCurPos(); %>
           		   <%for(int i=0; i<pager.getPageSize(); i++){ %>
           		   <%if(num<1); break; %>
           		    <%BookComment comment = commentList.get(i); %>
           		    <tr>
           		    	<td><%=num-- %></td>
           		    	<td>도서 제목</td>
           		    	<td><%=comment.getContent() %></td>
           		    	<td><%=comment.getMember().getNickname() %>(<%=comment.getMember().getId() %>)</td>
           		    	<td><%=comment.getRegdate() %></td>
           		    	<td>
           		    		<button onClick='bookCommentDelete(<%=comment.getBookComment_id()%>)'>삭제</button>
           		    	</td>
           		    </tr>
           		   <%} %>
           		   
           		   <tr>
						<td colspan="6">
							[prev] 
							<%for(int i=pager.getFirstPage(); i<=pager.getLastPage(); i++){ %>
								<%if(i>pager.getTotalPage()) break; %>
								[<%=i %>]
							<%} %>
							[next]
							
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