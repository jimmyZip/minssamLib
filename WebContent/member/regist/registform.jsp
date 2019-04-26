<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 회원가입 페이지임 -->
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
	overflow: hidden;
}

form, .msgContainer {
	float: left;
}

.msgContainer {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	float: left;
	width: 25%;
/* 	background-color: yellow; */
}

form {
	width: 75%;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.message {
	float: left;
	width: 25%;
	margin-top: 6px;
}

#message {
	display: none;
	background: #f1f1f1;
	color: #000;
	position: relative;
	padding: 20px;
	margin-top: 10px;
}

.col-60 {
	float: left;
	width: 70%;
	margin-top: 6px;
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

/* Add a green text color and a checkmark when the requirements are right */
.valid {
	color: #f2f2f2;
}

.valid:before {
	position: relative;
	left: -35px;
	/* content: "✔"; */
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
	color: red;
}

.invalid:before {
	position: relative;
	left: -35px;
	content: "✖";
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var id =	 document.getElementById("id");//아이디에러창
	var pass = document.getElementById("pass");//비밀번호
	var repeatpass= document.getElementById("repeatpass");//비밀번호 확인
	var name= document.getElementById("name");//이름확인
	var nickname= document.getElementById("nickname");//
	var email= document.getElementById("email");//

	var idMsg = document.getElementById("idMsg");
	var passMsg = document.getElementById("passMsg");
	var repeatpassMsg = document.getElementById("repeatpassMsg");
	var nameMsg = document.getElementById("nameMsg");
	var nicknameMsg = document.getElementById("nicknameMsg");
	var emailMsg = document.getElementById("emailMsg");


	id.onfocus = function() {
		if(id.value==null){
			idMsg.classList.remove("valid");
			idMsg.classList.add("invalid");
		}
	}
	pass.onfocus = function() {
		if(pass.value==null){
			passMsg.classList.remove("valid");
			passMsg.classList.add("invalid");
		}
	}
	repeatpass.onfocus = function() {
		if(repeatpass.value==null){
			repeatpassMsg.classList.remove("valid");
			repeatpassMsg.classList.add("invalid");
		}
	}
	name.onfocus = function() {
		if(name.value==null){
			nameMsg.classList.remove("valid");
			nameMsg.classList.add("invalid");
		}
	}
	nickname.onfocus = function() {
		if(nickname.value==null){
			nicknameMsg.classList.remove("valid");
			nicknameMsg.classList.add("invalid");
		}
	}
	email.onfocus = function() {
		if(email.value==null){
			emailMsg.classList.remove("valid");
			emailMsg.classList.add("invalid");
		}
	}
	
	/* 
		document.getElementById("idmessage").style.display = "block";
	id.onblur = function() {
		document.getElementById("idmessage").style.display = "none";
	} */

	id.onkeyup = function() {
		// Validate length
		if (id.value.length >= 3 && id.value.length <=20) {
			idMsg.classList.remove("invalid");
			idMsg.classList.add("valid");
		} else {
			idMsg.classList.remove("valid");
			idMsg.classList.add("invalid");
		}
	}

	pass.onkeyup = function() {
		// Validate length
		if (pass.value.length >= 3 && pass.value.length <=20) {
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

	name.onkeyup = function() {
		// Validate length
		if (name.value.length >= 3 && name.value.length <=20) {
			nameMsg.classList.remove("invalid");
			nameMsg.classList.add("valid");
		} else {
			nameMsg.classList.remove("valid");
			nameMsg.classList.add("invalid");
		}
	}

	nickname.onkeyup = function() {
		// Validate length
		if (nickname.value.length >= 3 && nickname.value.length <=20) {
			nicknameMsg.classList.remove("invalid");
			nicknameMsg.classList.add("valid");
		} else {
			nicknameMsg.classList.remove("valid");
			nicknameMsg.classList.add("invalid");
		}
	}
	
	email.onkeyup = function() {
		// Validate length
		if (email.value.length >= 3 && email.value.length <=20) {
			emailMsg.classList.remove("invalid");
			emailMsg.classList.add("valid");
		} else {
			emailMsg.classList.remove("valid");
			emailMsg.classList.add("invalid");
		}
	}

	
});
	$(function() {
		$("form[name='regist-form']").find("button").click(function() {
			regist();
		});

	});

	function regist() {
		
		$("form").attr({
			method : "post",
			action : "/member/regist"
		});
		$("form").submit();
	}

</script>



</head>
<body>

	<h2>회원가입</h2>

	<div class="container">
		<form name="regist-form" action="/member/regist" method="post">
			<div class="row">
				<div class="col-25">
					<label for="fname">ID</label>
				</div>
				<div class="col-60">
					<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요"
					pattern="{3,20}" required>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="lname">Password</label>
				</div>
				<div class="col-60">
					<input type="password" id="pass" name="pass"
						placeholder="비밀번호를 입력해주세요"
						pattern="(?=.*\d).{3,20}" 
						title="형식에 알맞게 입력해주세요" required>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="lname">Repeat Password</label>
				</div>
				<div class="col-60">
					<input type="password" id="repeatpass" name="repeatpass"
						placeholder="비밀번호를 다시 입력해주세요" 
						pattern="(?=.*\d).{3,20}" 
						required>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="name">Name</label>
				</div>
				<div class="col-60">
					<input type="text" id="name" name="name" placeholder="이름을 입력해주세요" 
						pattern="(?=.*\d).{3,20}" 
						title="형식에 알맞게 입력해주세요" required>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="name">Nickname</label>
				</div>
				<div class="col-60">
					<input type="text" id="nickname" name="nickname"
						placeholder="사용하실 닉네임을 입력해주세요" 
						pattern="(?=.*\d).{3,20}" required>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="email">Email</label>
				</div>
				<div class="col-60">
					<input type="email" id="email" name="email"
						placeholder="email 주소 입력" 
						pattern="/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/"
						title="형식에 맞게 입력해주세요"
						required>
				</div>
			</div>
			<div class="row">
				<input type="submit"  value="회원가입">
			</div>
		</form>
		<div class="msgContainer">
		
			<div id="row">
				<p id="idMsg" class="valid">
					<b>3글자에서 20자이내로 작성해주세요</b>
				</p>
			</div>
			
			<div id="row">
				<p id="passMsg" class="valid">
					<b>3글자에서 20자이내로 작성해주세요</b>
				</p>
			</div>
			
			<div id="row">
				<p id="repeatpassMsg" class="valid">
					<b>비밀번호가 일치하지 않습니다</b>
				</p>
			</div>

			<div id="row">
				<p id="nameMsg" class="valid">
					<b>3글자에서 20글자사이로 입력해주세요</b>
				</p>
			</div>
			
			<div id="row">
				<p id="nicknameMsg" class="valid">
					<b>3글자에서 20글자사이로 입력해주세요</b>
				</p>
			</div>

			<div id="row">
				<p id="emailMsg" class="valid">
					<b>이메일 형식에 맞게 입력해 주세요</b>
				</p>
			</div>			
					
		</div>
	</div>

</body>

</html>
