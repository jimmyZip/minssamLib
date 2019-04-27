<%@page import="com.books.common.member.Admin"%>
<%@page import="com.books.model.domain.member.Auth"%>
<%@page import="com.books.model.domain.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%!Admin admin = new Admin();%>
<% 
	Auth auth = ((Member) session.getAttribute("member")).getAuth();
	boolean isAdmin = admin.adminCheck(auth);
%>
<div class="category-section">
<h2 class="category_h2">Admin PAGE<i class="fas fa-angle-down"></i></h2>
<ol>
	<li><a href="#" onClick="location.href='/admin/assign'">권한 관리 </a></li>
	<li><a href="#" onClick="location.href='/admin/member'">맴버 관리</a></li>
	<li><a href="#" onClick="location.href='/admin/review'">리뷰 관리</a></li>
	<li><a href="#" onClick="location.href='/admin/review_comment'">리뷰 코멘트 관리</a></li>
	<li><a href="#" onClick="location.href='/admin/book_comment'">도서 코멘트 관리</a></li>
</ol>	    
</div>
