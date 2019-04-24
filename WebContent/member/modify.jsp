<%@page import="com.books.model.domain.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/include/head.jsp" %>
<%@ include file="/include/header.jsp" %>


<script>
$(function() {
	$("form[name='edit-form']").find("button").click(function() {
		edit();
	});

});

function edit(){
	$("form").attr({
		action:"/member/edit",
		method:"post"
	});
	$("form").submit();
}
</script>
</head>
<body>
    <!-- hedaer end -->
    <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">개인정보 수정</h2> 
	    </div>
    </div>
<div class="wrap main cl mypage">
	<%@include file="/include/side.jsp" %>
	<div>
	
		<form name="edit-form">
			<input type="hidden" name="member_id" value="<%=member.getMember_id() %>">
			<input type="text" name="id" value="<%=member.getId() %>" disabled><br>
   			<input type="text" placeholder="현재 비밀번호"><br>
   			<input type="text" name="pass" placeholder="변경할 비밀번호"><br>
   			<input type="text" placeholder="비밀번호 확인" ><br>
   			<input type="text" value="<%=member.getName() %>" disabled><br>
   			<input type="text" name="nickname" placeholder="변경할 닉네임"><br>
   			<input type="text" name="email" placeholder="변경할 email"><br>
   			<button type="button">수정</button>
		</form>
	</div> 
</div>



<%@include file="/include/footer.jsp" %>
</body>
</html>