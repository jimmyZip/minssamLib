<%@ page contentType="text/html; charset=UTF-8"%>
<script>
	alert("로그아웃 되었습니다.");
</script>
<%
	session.invalidate();//세션무효화
	//이시점부터 기존사용하던 세션사용불가

	response.sendRedirect("/");
%>