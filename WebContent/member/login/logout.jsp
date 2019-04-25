<%@ page contentType="text/html; charset=UTF-8"%>
<%
	session.invalidate();//세션무효화
	//이시점부터 기존사용하던 세션사용불가
	response.sendRedirect("/");
%>