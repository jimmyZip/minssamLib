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
$(function(){
	getList();
});

function getList(){
	$.ajax({
		url:"/admin/assign",
		type:"get",
		success:function(result){
			viewList(result);
		}
	});
}

// 추가
function authAdd(){
	$.ajax({
		url:"/admin/assign",
		type:"post",
		success:function(){
			getList();
		}
	});
}

// 삭제
function authDelete(auth_id){
	//alert("삭제 : " + auth_id);
	$.ajax({
		url:"/admin/assign/"+auth_id,
		type:"delete",
		success:function(){
			getList();
		}
	});
}

// 수정
function authModi(auth_id){
	/*
	$.ajax({
		url:"/admin/assign/"+auth_id,
		type:"post",
		data:{
			_method:"PUT"
		},
		success:function(){
			getList();
		}
	});
	*/
	alert("auth_id");
	
}

// 페이지 표시해주는 함수 
function viewList(json){
	var con = $("#container");
	con.html(""); // 데이터 삭제
	for(var i=0; i<json.length; i++){
		var obj = json[i];
		var str = "";
		str+="<tr id=table_tr_"+obj.auth_id+">";
		str+="<td><input type='text' value='"+obj.auth_name+"'></td>";
		if(i<2){ // 기본으로 사용되는건 수정 못하게
			//obj.admin_assign
			if(obj.admin_assign){
				str += "<td><input type='checkbox' disabled='disbled' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox' disabled='disbled'></td>";
			}
			
			//obj.member_del
			if(obj.member_del){
				str += "<td><input type='checkbox' disabled='disbled' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox' disabled='disbled'></td>";
			}
			
			//obj.review_del
			if(obj.review_del){
				str += "<td><input type='checkbox' disabled='disbled' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox' disabled='disbled'></td>";
			}
			
			//obj.review_comment_del
			if(obj.review_comment_del){
				str += "<td><input type='checkbox' disabled='disbled' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox' disabled='disbled'></td>";
			}
			
			//obj.book_comment_del
			if(obj.book_comment_del){
				str += "<td><input type='checkbox' disabled='disbled' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox' disabled='disbled'></td>";
			}
			
			str += "<td><button onClick='authDelete()' disabled='disabled'>삭제</button>"
		
		}else{
			if(obj.admin_assign){
				str += "<td><input type='checkbox' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox'></td>";
			}
			
			//obj.member_del
			if(obj.member_del){
				str += "<td><input type='checkbox' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox'></td>";
			}
			
			//obj.review_del
			if(obj.review_del){
				str += "<td><input type='checkbox' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox'></td>";
			}
			
			//obj.review_comment_del
			if(obj.review_comment_del){
				str += "<td><input type='checkbox' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox'></td>";
			}
			
			//obj.book_comment_del
			if(obj.book_comment_del){
				str += "<td><input type='checkbox' checked='checked'></td>";
			}else{
				str += "<td><input type='checkbox'></td>";
			}
			
			str += "<td><button onClick='authDelete("+obj.auth_id+")'>삭제</button>"
		}
		str += "<button onClick='authModi("+obj.auth_id+")'> 수정</button>";
		str += "</td>";
		str += "</tr>";
		console.log("생성문", str);
		con.append(str);
	}
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
    
	<!-- list start -->
	<div class="wrap main cl mypage">
	<!-- 사이드 메뉴 include -->
	<%@include file="/include/adminSide.jsp" %>
	   <div class="list-section">
	       <table class="table_basic my_lecture_list">
	           <thead>
	               <tr>
                       <th>이름 &nbsp;<button onClick="authAdd()">신규추가</button></th>
                       <th>권한 수정</th>
                       <th>멤버 관리</th>
                       <th>리뷰 관리</th>
                       <th>리뷰 코멘트 관리</th>
                       <th>책 코멘트 관리</th>
                       <th>비고</th>
	               </tr>
	           </thead>
	           <tbody id="container">

	           </tbody>
	       </table>
	   </div>
	
	</div>
	<!-- footer start -->
	<%@include file="/include/footer.jsp" %>
	<!-- footer end -->
</body>
</html>       