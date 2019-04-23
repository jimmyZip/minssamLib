<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Tomcat : 
<%=application.getServerInfo() %>
<br>
Servlet:
<%=application.getMajorVersion() %>.<%=application.getMinorVersion() %>
<br>
JSP:
<%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
</body>
</html>