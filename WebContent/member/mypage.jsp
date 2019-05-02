<%@page import="com.books.model.domain.member.Bookmark"%>
<%@page import="java.util.List"%>
<%@page import="com.books.common.Pager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
	//List<Bookmark> markList=(List)request.getAttribute("markList");
	//pager.init(request, markList.size());
	List<Bookmark> userBookmarkList=(List)request.getAttribute("userBookmarkList");
	//System.out.println(userBookmarkList.size());
	//System.out.println(userList.get(0).getMember().getId());
%>
<%-- <%
	if (session.getAttribute("member") != null) {
		System.out.print("세션있음");
	} else {
		System.out.print("세션없음");
	}
//조장님 이 부분도 include로 빼야 하나요
%> --%>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp" %>
<title>마이 페이지</title>
<script>
 $(function(){
	getList();
});

function getList(){
	$.ajax({
		url:"/member/mypage",
		type:"get",
		success:function(result){
			viewList(result);
		}
	});
} 
function bookmarkDelete(bookmark_id){
	$.ajax({
		url:"/member/mypage/"+bookmark_id,
		type:"delete",
		success:function(){
			getList();
		}
	});
}

function fly(isbn){
	alert(isbn);
	location.href="/book/search/detail/"+isbn;
}
/* function del(mark_no){
	if(!confirm("삭제하시겠습니까?")){
		return null;
	}
	$.ajax({
		url:"/member/mypage/"+bookmark_id,
		type:"delete",
		success:function(){
			getList();
		}
	});
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
	           
	           <tbody id="container" name="del" class="mypageContainer">
				<%for(int i=0; i<userBookmarkList.size();i++){ %>
	       			<% Bookmark mark=userBookmarkList.get(i); %>
	       			<tr>
                       <td>																							
                           <a href="#"><div onClick="fly(<%=mark.getBook().getIsbn() %>)" class="my-lecture-img" style="background-image:url('<%=mark.getBook().getImage()%>');"></div></a>
                       </td>
                       <td><%= mark.getBook().getTitle()%></td>
                       <td><input type="hidden" name="bookmark_id" value="<%=mark.getBookmark_id()%>"/></td>
                       <td><%=mark.getBookmark_date() %></td>
                       <td>
                       		<button onClick="bookmarkDelete(<%=mark.getBookmark_id()%>)">삭제</button>
                       </td>
                	</tr>
                	<%} %>
 					<!-- javascript:book_markDel() -->
	           </tbody>
	       </table>
	   </div>
	
	</div>
	
	
	
	<!-- footer start -->
	<%@include file="/include/footer.jsp" %>

	<!-- footer end -->

</body>
</html>       