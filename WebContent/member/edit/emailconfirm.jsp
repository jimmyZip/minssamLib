<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<head>
<script>

	function infoCheck() {
		$.ajax({
			url : "/rest/member/infoCheck",
			type : "post",
			data : {
				id : uid.value,
				email : uemail.value
			},
			success : function(result) {	
				if(result!=null){
					sendMail();
					alert("메일이 전송되었습니다.");
				}else{
					alert("일치하는 정보가 없습니다.");
				}
			},
			error : function(result) {

			}

		});
	}

	function sendMail(){
		$.ajax({
			url : "/rest/member/sendMail",
			type : "post",
			data : {
				id : uid.value,
				email : uemail.value
			},
			success : function(data) {	
				
			},
			error : function(data) {

			}

		});
	}

	function ok(){
		var joinCode =  "<%=(String)session.getAttribute("joinCode")%>";
		//alert("동작함"+joinCode);
		if(joinCode==confirmNumber.value){
			goResetPass()
		}else{
			alert(joinCode);
		}
	}
	
</script>
</head>
<body>
   <div class="find_wrap">
      <form name="find-form">
         <fieldset>
            <legend>이메일 인증후 비밀번호 변경가능</legend>
            <div class="login_area">
               <div class="input_info">
                  <input id="uid" type="text" name="uid" placeholder="아이디를 입력해주세요" />
                  <input id="uemail" type="text" name="uemail" placeholder="이메일을 입력해주세요" />
               		
               </div>
               <p class="login_btn">
                  <a href="javascript:infoCheck()" title="찾기 버튼">번호받기</a>
               </p>
            </div>
            <div class="searchRegistArea">
               <input type="text" id="confirmNumber" name="confirmNumber" placeholder="인증번호를 입력해주세요">
            	<input type="button" onclick="ok();" value="인증번호확인">
            </div>
         </fieldset>
      </form>
   </div>
</body>
</html>