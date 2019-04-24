<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<style>
* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

input[type=password], select, textarea, input[type=email] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=button] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=button]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}
/*email 입력부분*/
#emailArea {
	overflow: hidden;
}

input[type=email], select {
	float: left;
}

input[type=email] {
	width: 70%;
}

select {
	width: 30%;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function() {
	$("form[name='regist-form']").find("button").click(function() {
		regist();
	});

});


	function regist(){
		$("form").attr({
			method:"post",
			action:"/member/regist"
		});
		$("form").submit();
	} 


</script>
</head>
<body>

	<h2>회원가입</h2>

	<div class="container">
		<form name="regist-form">
			<div class="row">
				<div class="col-25">
					<label for="fname">ID</label>
				</div>
				<div class="col-75">
					<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="lname">Password</label>
				</div>
				<div class="col-75">
					<input type="password" id="pass" name="pass"
						placeholder="비밀번호를 입력해주세요">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="lname">Repeat Password</label>
				</div>
				<div class="col-75">
					<input type="password" id="repeatPass" name="repeatPass"
						placeholder="비밀번호를 다시 입력해주세요">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="name">Name</label>
				</div>
				<div class="col-75">
					<input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="name">Nickname</label>
				</div>
				<div class="col-75">
					<input type="text" id="nickName" name="nickname"
						placeholder="사용하실 닉네임을 입력해주세요">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="email">Email</label>
				</div>
				<div class="col-75" id="emailArea">
					<input type="email" id="email" name="email" placeholder="email 주소 입력">
	
				</div>
			</div>

			<div class="row">
				<button type="button" value="회원가입">회원가입</button>
			</div>
		</form>
	</div>

</body>
</html>
