<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<head>
<script>
<<<<<<< HEAD
function requestLogin(){
   $("form[name='login-form']").attr({
      method:"post",
      action:"/member/login"
   });
   $("form[name='login-form']").submit(); 
   
}
function enterkey() {
    if (window.event.keyCode == 13) {
         requestLogin();
    }
}

</script>
</head>
<body>
   <div class="login_wrap">
      <form name="login-form">
         <fieldset>
            <legend>회원 로그인</legend>
            <div class="login_area">
               <div class="input_info">
                  <div class="id_area">
                     <input id="userid" type="text" name="id" onkeyup="enterkey()" placeholder="아이디를 입력하세요"/>
                  </div>
                  <p class="login_btn">
                     <a href="javascript:requestLogin()"  onkeyup="enterkey()" title="로그인 버튼">로그인</a>
                  </p>
                  <div class="pass_area">
                     <input id="pass" type="password" name="pass" onkeyup="enterkey()" placeholder="비밀번호를 입력해주세요"/> 
                  </div>   
               </div>
               <p class="search_id_pw">
                  <a href="#" title="아이디 찾기">아이디</a><span>·</span><a href="#"
                     title="비밀번호 찾기">비밀번호 찾기</a>
               </p>
               <p class="sign_up_area">
                  <a href="/member/regist/agree.jsp" title="회원가입 버튼">회원가입</a>
               </p>
            </div>
         </fieldset>
      </form>
   </div>
=======
	function requestLogin() {
		$("form[name='login-form']").attr({
			method : "post",
			action : "/member/login"
		});
		$("form[name='login-form']").submit();

	}
</script>
</head>
<body>
	<div class="login_wrap">
		<form name="login-form">
			<fieldset>
				<legend>회원 로그인</legend>
				<div class="login_area">
					<div class="input_info">
						<input id="userid" type="text" name="id" placeholder="아이디를 입력하세요" />
						<input id="pass" type="password" name="pass" placeholder="비밀번호를 입력해주세요" />
					</div>
					<p class="login_btn">
						<a href="javascript:requestLogin()" title="로그인 버튼">로그인</a>
					</p>
				</div>
				<div class="searchRegistArea">
					<p class="search_id_pw">
						<a href="#" title="아이디 찾기">아이디 찾기</a><span>·</span><a href="#"
							title="비밀번호 재설정">비밀번호 재설정</a>
					</p>
					<p class="sign_up_area">
						<a href="/member/regist/agree.jsp" title="회원가입 버튼">회원가입</a>
					</p>
				</div>
			</fieldset>
		</form>
	</div>
>>>>>>> 2ed93b8881d42d124e42bcedb0ae41db4584b95c
</body>
</html>