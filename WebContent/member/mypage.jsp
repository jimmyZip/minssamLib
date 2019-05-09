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
<title>마이 페이지</title>
<script>
 $(function(){
	getList();
});

function getList(){
	$.ajax({
		url:"/member/mypage/bookmark",
		type:"get",
		success:function(result){
			viewList(result);
			console.log(result);
		}
	});
}

function bookmarkDelete(bookmark_id){
	$.ajax({
		url:"/member/mypage/bookmark/"+bookmark_id,
		type:"delete",
		success:function(){
			getList();
		}
	});
}

function viewList(json){
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
}

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
			<%-- 	 <% int num=pager.getNum(); %>
				 <% int curPos=pager.getCurPos(); %>
				 <% for(int i=0; i<pager.getPageSize(); i++){ %>
					 <% if(num<1) break; %>
					 <% Bookmark mark = userBookmarkList.get(curPos++); %>
					 <tr>
						<td><%=num-- %></td>				 
						<td><%=mark.getBookmark_id() %></td>				 
						<td><%= %></td>				 
						<td><%= %></td>				 
						<td><%= %></td>				 
						<td><%= %></td>				 
					 </tr>
				 <% }%> --%>
	       		</tbody>
	       		<table id="container_page">
	       			<td colspan='5'><a href="#">[이전]</a></td>
	       			<td><a href="#"></a></td>
	       			<td><a href="#">[다음]</a></td>
	       		</table>
	       </table>
	   </div>
	
	</div>
	
	
	
	<!-- footer start -->
	<%@include file="/include/footer.jsp" %>

	<!-- footer end -->

</body>
</html>       