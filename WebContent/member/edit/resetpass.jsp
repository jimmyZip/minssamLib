<%@page import="com.books.model.domain.member.JoinCode"%>
<%@page import="com.books.model.domain.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<head>
<script>

   
   function enterkey() {
       if (window.event.keyCode == 13) {
			passChange();
       }
	}

	function passChange() {
		$.ajax({
			url : "/rest/member/resetPass",
			type : "post",
			data : {
				
				id :"<%=(String)session.getAttribute("id")%>",
				email :"<%=(String)session.getAttribute("email")%>",
				pass : newpass.value
			},
			success : function(data) {
				alert("비밀번호가 변경되었습니다.");
				
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
            <legend>비밀번호 변경</legend>
            <div class="login_area">
               <div class="input_info">
                  <input id="newpass" type="password" name="newpass" placeholder="새비밀번호를 입력해주세요" />
                  <input id="repeatnewpass" type="password" name="repeatnewpass" placeholder="비밀번호를 확인해주세요" onkeyup="enterkey()"/>
               </div>
               <p class="login_btn">
                  <a href="javascript:passChange()" title="변경하기">변경하기</a>
               </p>
            </div>
            <div class="searchRegistArea">
               <p></p>

            </div>
         </fieldset>
      </form>
   </div>
</body>
</html>