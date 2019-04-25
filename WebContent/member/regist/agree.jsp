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
<script>
var accessTerms = document.getElementById('accessTerms');
var info = document.getElementById('info');
</script>
</head>
<body>
	<form>

		<div class="container">
			
			<input type="checkbox" id="accessTerms" /> 
			<label> 민쌤의 서재이용약관 동의<br></label>
			<textarea name="content" style="height: 200px">이용약관 내용~~~~</textarea>
			
			<input type="checkbox" id="info" /> 
			<label> 개인정보 수집 및 이용에 대한안내</label>
			<textarea name="content" style="height: 200px">개인정보 동의내용~~~</textarea>
			
		</div>
		
		<div class="row">
			<input type="button" value="동의" onclick="location.href='/member/regist/registform.jsp'">
			<input type="button" value="비동의" onclick="location.href='/index.jsp'">
		</div>
	</form>
</body>
</html>