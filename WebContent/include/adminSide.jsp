<%@page import="com.books.common.member.Admin"%>
<%@page import="com.books.model.domain.member.Auth"%>
<%@page import="com.books.model.domain.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%!Admin admin = new Admin();%>
<% 
	Auth auth = ((Member) session.getAttribute("member")).getAuth();
%>
<div class="category-section">
<h2 class="category_h2">Admin PAGE<i class="fas fa-angle-down"></i></h2>
<ol>
	<%if(auth.isAdmin_assign()){ %>
		<li><a href="#" onClick="location.href='/admin/assign/page'">권한 관리 </a></li>
	<%}%>
	<%if(auth.isMember_del()) {%>
		<li><a href="#" onClick="location.href='/admin/member/page'">맴버 관리</a></li>
	<%}%>
	<%if(auth.isReview_del()) {%>
		<li><a href="#" onClick="location.href='/admin/review/page'">리뷰 관리</a></li>
	<%} %>
	<%if(auth.isReview_comment_del()) {%>
		<li><a href="#" onClick="location.href='/admin/review_comment/page'">리뷰 코멘트 관리</a></li>
	<%} %>
</ol>	    
</div>