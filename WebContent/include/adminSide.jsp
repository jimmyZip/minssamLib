<%@page import="com.books.common.member.Admin"%>
<%@page import="com.books.model.domain.member.Auth"%>
<%@page import="com.books.model.domain.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%!Admin admin = new Admin();%>
<% 
	Auth auth = ((Member) session.getAttribute("member")).getAuth();
	boolean isAdmin = admin.adminCheck(auth);
	System.out.println(auth.isAdmin_assign());
	System.out.println(auth.isMember_del());
	System.out.println(auth.isReview_del());
	System.out.println(auth.isReview_comment_del());
	System.out.println(auth.isBook_comment_del());
%>
<div class="category-section">
<h2 class="category_h2">Admin PAGE<i class="fas fa-angle-down"></i></h2>
<ol>
	<%if(auth.isAdmin_assign()){ %>
		<li><a href="#" onClick="location.href='/admin/assign'">권한 관리 </a></li>
	<%}%>
	<%if(auth.isMember_del()) {%>
		<li><a href="#" onClick="location.href='/admin/member'">맴버 관리</a></li>
	<%}%>
	<%if(auth.isReview_del()) {%>
		<li><a href="#" onClick="location.href='/admin/review'">리뷰 관리</a></li>
	<%} %>
	<%if(auth.isReview_comment_del()) {%>
		<li><a href="#" onClick="location.href='/admin/review_comment'">리뷰 코멘트 관리</a></li>
	<%} %>
	<%if(auth.isBook_comment_del()) {%>
		<li><a href="#" onClick="location.href='/admin/book_comment'">도서 코멘트 관리</a></li>
	<%} %>
</ol>	    
</div>
