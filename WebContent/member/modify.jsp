<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/include/head.jsp" %>
<%@ include file="/include/header.jsp" %>


<script>
$(function(){
	$($("input[type='button']")).click(function(){
		modify();
	});
});

function modify(){
	$("form").attr({
		action:"/member/modify",
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
	
		<form name="edit">
			<input type="test" name="id" value="DB에서 받아와야함" disabled><br>
   			<input type="text" name="ori_pass" placeholder="비밀번호"><br>
   			<input type="text" name="repl_pass" placeholder="변경할 비밀번호"><br>
   			<input type="text" name="repl_pass2" placeholder="비밀번호 확인" ><br>
   			<input type="text" name="name" value="DB에서 받아와야함" disabled><br>
   			<input type="text" name="nickname" placeholder="닉네임"><br>
   			<input type="text" name="email" placeholder="email"><br>
   			<button type="button" onClick="editmember">수정</button>
		</form>
	</div>
</div>



<%@include file="/include/footer.jsp" %>
</body>
</html>