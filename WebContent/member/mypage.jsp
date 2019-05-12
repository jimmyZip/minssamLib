<%@page import="com.books.model.domain.member.Bookmark"%>
<%@page import="java.util.List"%>
<%@page import="com.books.common.Pager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
	List<Bookmark> userBookmarkList=(List)request.getAttribute("userBookmarkList");
	Pager pager = (Pager) request.getAttribute("pager");
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
<title>마이 페이지</title>
<script>
/*  $(function(){
	//getList();
}); */

/* function getList(){
	$.ajax({
		url:"/member/mypage/bookmark",
		type:"get",
		success:function(result){
			viewList(result);
			console.log(result);
		}
	});
} */

function bookmarkDelete(bookmark_id){
	$.ajax({
		url:"/member/mypage/bookmark/"+bookmark_id,
		type:"delete",
		success:function(){
			location.reload();
		}
	});
}

/* function viewList(json){
	var con=$("#container");
	con.html("");//data delete
 	for(var i=0; i<json.length;i++){
		var obj=json[i];
		//                                                                        'fly("+obj.isbn+")'   
		var str ="";
		str+="<tr id=table_tr>";
		str+="<td><a href='#'><div onClick='javascript:fly("+obj.isbn+")' class='my-lecture-img' style=\"background-image:url("+obj.book.image+")\"></div></a></td>";
		str+="<td>"+obj.book.title+"</td>";
		str+="<td><input type='hidden' value="+obj.bookmark_id+"></td>";
		str+="<td>"+obj.bookmark_date+"</td>";
		str+="<td><button onClick='bookmarkDelete("+obj.bookmark_id+")'>삭제</button></td>";
		str+="</tr>";
		con.append(str);
		//console.log(obj.book.image);
	} 
} */

/* function fly(isbn){
	alert(isbn);
	location.href="/book/search/detail/"+isbn;
} */

</script>
</head>
<!-- head end -->
<body>
	
    <!-- header start -->
	<%@include file="/include/header.jsp"%>
	<!-- header end -->
	<!-- page visual -->
    <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">북마크</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
	    </div>
    </div>
	<!-- blog list start -->
	
	<div class="wrap main cl mypage">
	<!-- 사이드 메뉴 include -->
	<%@include file="/include/side.jsp" %>
	   
	   <div class="list-section">
	       <table class="table_basic my_lecture_list">
	           <thead>
	               <tr>
                       <th>이미지</th>
                       <th>책 제목</th>
                       <th></th>
                       <th>날짜</th>
                       <th>비고</th>
	               </tr>
	           </thead>
	         
	        	<tbody id="container" class="mypageContainer">

 				 	<% int num = pager.getNum(); %>
 				 	<% int curPos = pager.getCurPos(); %>
 				 	<%for(int i=0; i<pager.getPageSize(); i++){%>
 				 		<%if(num<1)break; %><!-- num--; -->
 				 		<%Bookmark mark=userBookmarkList.get(curPos++);%>
	 				 	<tr>
					 		<td>
					 			<a href="#"><div onClick="javascript:fly(<%=userBookmarkList.get(i).getBook().getIsbn() %>)" class="my-lecture-img" style="background-image:url('<%=userBookmarkList.get(i).getBook().getImage()%>');"></div></a>
 						 		<%-- <%=curPos%> --%>
					 		</td>
					 		<td>	<%=userBookmarkList.get(i).getBook().getTitle()%></td>
					 		<td><input type="hidden" name="bookmark_id" value="<%=userBookmarkList.get(i).getBookmark_id()%>"/></td>
					 		<td><%=userBookmarkList.get(i).getBookmark_date()%></td>
					 		<td><button onClick="bookmarkDelete(<%=userBookmarkList.get(i).getBookmark_id()%>)">삭제</button></td>
					 	</tr>
				 <%}%>
		       		<tr>
		       			<td colspan='9'>
		       				<%if(pager.getFirstPage()-1>0){ %>
		       					<a class="page_href" href="/member/mypage?currentPage=<%=pager.getFirstPage()-1%>">[이전]</a>
		       				<%}else{ %>
		       					<a class="page_href" href="javascript:alert('첫페이지 입니다.')">[이전]</a>
		       				<%} %>
		       				<%for(int i=pager.getFirstPage(); i<=pager.getLastPage(); i++){ %>
		       					<%if(i>pager.getTotalPage()) break; %>
		       						<a class="page_href" href="/member/mypage?currentPage=<%=i%>">[<%=i %>]</a>
		       				<%} %>
		       				<%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
		       					<a class="page_href" href="/member/mypage?currentPage=<%=pager.getLastPage()+1%>">[다음]</a>
		       				<%}else{ %>
		       					<a class="page_href" href="javascript:alert('마지막 페이지입니다.')">[다음]</a>
		       				<%} %>
		       			</td>
		       		</tr>
	       		</tbody>
	       </table>
	       		<!-- <table id="container_page">
	       		</table> -->
	   </div>
	
	</div>
	
	
	
	<!-- footer start -->
	<%@include file="/include/footer.jsp" %>

	<!-- footer end -->

</body>
</html>       