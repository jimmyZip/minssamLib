<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<Auth> authList = (List)request.getAttribute("authList");
%>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp" %>
<script>

function getList(){
	$.ajax({
		url:"/admin/assign/list",
		type:"get",
		success:function(result){
			viewList(result);
		}
	});
}

function authAdd(){
	$.ajax({
		url:"/admin/assign",
		type:"post"
	});
}

function authDelete(auth_id){
	alert("삭제 : " + auth_id);
	$.ajax({
		url:"/admin/assign/"+auth_id,
		type:"delete"
	});
}

function authModi(auth_id){
	alert("수정 : " + auth_id);
	/*
	$.ajax({
		url:"/admin/assign/"+auth_id
		type:"post",
		data:{
			_method:"PUT"
		}
	});
	*/
	
}

function viewList(result){
	alert(result);
}
</script>
<title>관리자용 페이지 - 권한관리</title>
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
                       <th>이름 &nbsp;&nbsp; <button onClick="authAdd()">신규추가</button></th>
                       <th>권한 수정</th>
                       <th>멤버 관리</th>
                       <th>리뷰 관리</th>
                       <th>리뷰 코멘트 관리</th>
                       <th>책 코멘트 관리</th>
                       <th>비고</th>
	               </tr>
	           </thead>
	           <tbody id="container">
	           		<%for(int i=0;i<authList.size();i++){ %>
	           		<%Auth authOne = authList.get(i); %>
	       			<tr>
                       <td><input type="text" value="<%=authOne.getAuth_name() %>"></td>
                       <td><input type="checkbox" <%if(i<2){%> disabled="disabled" <%}%><%if(authOne.isAdmin_assign()) {%>checked="checked" <%}%>></td>
                       <td><input type="checkbox" <%if(i<2){%> disabled="disabled" <%}%><%if(authOne.isMember_del()) {%>checked="checked" <%}%>></td>
                       <td><input type="checkbox" <%if(i<2){%> disabled="disabled" <%}%><%if(authOne.isReview_del()) {%>checked="checked" <%}%>></td>
                       <td><input type="checkbox" <%if(i<2){%> disabled="disabled" <%}%><%if(authOne.isReview_comment_del()) {%>checked="checked" <%}%>></td>
                       <td><input type="checkbox" <%if(i<2){%> disabled="disabled" <%}%><%if(authOne.isBook_comment_del()) {%>checked="checked" <%}%>></td>
                       <td>
	                       	<button onClick="authDelete('<%=authOne.getAuth_id() %>')" <%if(i<2){ %>disabled="disabled"<%} %>>삭제</button>
	                       	<button onClick="authModi('<%=authOne.getAuth_id() %>')" >수정</button>
                       </td>
                	</tr>
                	<%} %>
	           </tbody>
	       </table>
	   </div>
	
	</div>
	
	<!-- footer start -->
	<%@include file="/include/footer.jsp" %>
	<!-- footer end -->
</body>
</html>       