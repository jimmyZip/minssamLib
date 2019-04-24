<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 회원가입 약관에관하여 동의를 구하는 페이지에요  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
</script>

<style>
input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}
</style>
</head>
<body>
	<form>

		<div class="container">

			<input type="checkbox" id="king" onClick="checkAll()" /> 
			<label>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택),프로모션 안내 메일 수신(선택)에 모두 동의합니다.<br></label>
			
			<input type="checkbox" id="accessTerms" /> 
			<label> 민쌤의 서재이용약관 동의(필수)<br></label>
			<textarea name="content" style="height: 200px">이용약관 내용~~~~</textarea>
			
			<input type="checkbox" id="info" /> 
			<label> 개인정보 수집 및 이용에 대한안내(필수) </label>
			<textarea name="content" style="height: 200px">개인정보 동의내용~~~</textarea>
			
			<input type="checkbox" id="loc" /> 
			<label> 위치 정보 이용약관동의(선택)<br></label>
			<textarea name="content" style="height: 200px">이용약관 내용~~~~</textarea>
			<input type="checkbox" id="event" /> <label> 이벤트 등 프로모션 알림 메일수신(선택) </label>

		</div>
		
		<div class="row">
			<input type="button" value="동의" onclick="location.href='/member/regist/registform.jsp'">
			<input type="button" value="비동의" onclick="location.href='/index.jsp'">
		</div>
	</form>
</body>
</html>