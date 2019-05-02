<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<head>
<script>
   function idFind() {
      $("form[name='login-form']").attr({
         method : "post",
         action : "/member/findId"
      });
      $("form[name='login-form']").submit();

   }
   
   function enterkey() {
       if (window.event.keyCode == 13) {
			requestLogin();
       }
}

	function idFind() {
		//alert("idcheck");
		$.ajax({
			url : "/rest/member/idFind",
			type : "post",
			data : {
				name : name.value,
				email : email.value
			},
			success : function(data) {
				alert(data);
				if (data == "찾음") {
					
				} else {

				}
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
                  <input id="name" type="text" name="name" placeholder="이름을 입력해주세요" />
                  <input id="email" type="text" name="email" placeholder="이메일을 입력해주세요" onkeyup="enterkey()"/>
               </div>
               <p class="login_btn">
                  <a href="javascript:idFind()" title="찾기 버튼">찾기</a>
               </p>
            </div>
            <div class="searchRegistArea">
               
               <p></p>             
               
               <p class="sign_up_area">
					
               </p>
            </div>
         </fieldset>
      </form>
   </div>
</body>
</html>