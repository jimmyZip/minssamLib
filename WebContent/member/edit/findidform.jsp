<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<head>
<script>

   
   function enterkey() {
       if (window.event.keyCode == 13) {
			idFind();
       }
}

	function idFind() {
		$.ajax({
			url : "/rest/member/findId",
			type : "post",
			data : {
				name : fname.value,
				email : email.value
			},
			success : function(data) {
				alert(data);
				getId.value=data
			},
			error : function(data) {
				
			}

		});
	}
</script>
</head>
<body>
   <div class="find_wrap">
      <form name="find-form">
         <fieldset>
            <legend>아이디 찾기</legend>
            <div class="login_area">
               <div class="input_info">
                  <input id="fname" type="text" name="fname" placeholder="이름을 입력해주세요" />
                  <input id="email" type="text" name="email" placeholder="이메일을 입력해주세요" onkeyup="enterkey()"/>
               </div>
               <p class="login_btn">
                  <a href="javascript:idFind()" title="찾기 버튼">찾기</a>
               </p>
            </div>
            <div class="searchRegistArea">
               <p></p>
               <p class="search_id_pw">
				<a href="javascript:loginModalShow()" title="로그인" >로그인</a><span>·</span><a href="javascript:resetPass()"
                     id="resetpass" title="비밀번호 재설정">비밀번호 재설정</a>
               </p>
				<p><input type="text" value="" id="getId"/></p>
            </div>
         </fieldset>
      </form>
   </div>
</body>
</html>