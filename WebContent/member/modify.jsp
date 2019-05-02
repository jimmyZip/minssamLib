<%@page import="com.books.model.domain.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	//Member member = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/header.jsp"%>
<style>
input[type=password]{
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}



input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

.valid {
	color: white;
}

.valid:before {
	position: relative;
	left: -35px;
	/* content: "✔"; */
}

.invalid {
	color: red;
}

.invalid:before {
	position: relative;
	left: -35px;
	/*content: "✖";*/
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	/* $(function() {
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
	 } */
	$(document).ready(function() {
		var nowpass = document.getElementById("nowpass");//현재 비밀번호
		var pass = document.getElementById("pass");//변경할 비밀번호
		var repeatpass = document.getElementById("repeatpass");//변경할 비밀번호 확인

		nowpass.onfocus = function() {
			if (nowpass.value == null) {
				nowpassMsg.classList.remove("valid");
				nowpassMsg.classList.add("invalid");
			}
		}
		pass.onfocus = function() {
			if (pass.value == null) {
				passMsg.classList.remove("valid");
				passMsg.classList.add("invalid");
			}
		}
		repeatpass.onfocus = function() {
			if (repeatpass.value == null) {
				repeatpassMsg.classList.remove("valid");
				repeatpassMsg.classList.add("invalid");
			}
		}

		pass.onkeyup = function() {
			// Validate length
			if (pass.value.length >= 3 && pass.value.length <= 20) {
				passMsg.classList.remove("invalid");
				passMsg.classList.add("valid");
			} else {
				passMsg.classList.remove("valid");
				passMsg.classList.add("invalid");
			}
			if (repeatpass.value == pass.value) {
				repeatpassMsg.classList.remove("invalid");
				repeatpassMsg.classList.add("valid");
			} else {
				repeatpassMsg.classList.remove("valid");
				repeatpassMsg.classList.add("invalid");
			}
		}

		repeatpass.onkeyup = function() {

			if (repeatpass.value == pass.value) {
				repeatpassMsg.classList.remove("invalid");
				repeatpassMsg.classList.add("valid");
			} else {
				repeatpassMsg.classList.remove("valid");
				repeatpassMsg.classList.add("invalid");
			}
		}

	});

		function passCheck() {
			//alert("idcheck");
			$.ajax({
				url : "/rest/member/passCheck",
				type : "post",
				data : {
					pass : nowpass.value,
				},
				success : function(data) {
					alert(data);
					if (data == "일치하지않음") {
						$("#submit").attr("disabled",true);
						nowpassMsg.classList.remove("valid");
						nowpassMsg.classList.add("invalid");
					} else {
						
						if (nowpass.value.length >= 3 && nowpass.value.length <= 20) {
							$("#submit").attr("disabled",false);	
							nowpassMsg.classList.remove("invalid");
							nowpassMsg.classList.add("valid");
						} else {
							$("#submit").attr("disabled",true);
							nowpassMsg.classList.remove("valid");
							nowpassMsg.classList.add("invalid");
						}
					}
				},
				error : function(data) {

				}

			});
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
		<%@include file="/include/side.jsp"%>
		<div class="inputContainer">

			<form name="edit-form" action="/member/edit" method="post">
				<input type="hidden" name="member_id"
					value="<%=member.getMember_id()%>"> 
					<input type="text"name="id" value="<%=member.getId()%>" disabled><br>
					<input type="password" name="nowpass" id="nowpass" placeholder="현재 비밀번호" onchange="passCheck()" required>
				<p id="nowpassMsg" class="valid">
					<b>✖ 현재 비밀번호와 일치하지 않습니다.</b>
				</p>
				<input type="password" name="pass" id="pass" placeholder="변경할 비밀번호"
					pattern="(?=.*\d)(?=.*[a-z]).{3,20}" title="영문 숫자 혼합 3~20글자" required>
				<p id="passMsg" class="valid">
					<b>✖ 영어숫자혼합 20글자이내.</b>
				</p>
				<input type="password" name="repeatpass" id="repeatpass" placeholder="비밀번호 확인" required>
				<p id="repeatpassMsg" class="valid">
					<b>✖ 변경할 비밀번호와 일치하지 않습니다.</b>
				</p>
				<input type="text" value="<%=member.getName()%>" disabled>
				<input type="text" name="nickname"
					value="<%=member.getNickname()%>" placeholder="변경할 닉네임" required>
				<input type="text" name="email" value="<%=member.getEmail()%>"
					placeholder="변경할 email" required>
				<input type="submit" id="submit" name="submit" value="수정">
			</form>

		</div>

	</div>



	<%@include file="/include/footer.jsp"%>
</body>
</html>