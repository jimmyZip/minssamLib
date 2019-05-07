<%@page import="com.books.common.member.Admin"%>
<%@page import="com.books.model.domain.member.Auth"%>
<%@page import="com.books.model.domain.member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%!Admin admin = new Admin();%>
<% 
	//Member member2=(Member)session.getAttribute("member");
	Auth auth = ((Member) session.getAttribute("member")).getAuth();
	boolean isAdmin = admin.adminCheck(auth);
%>
<div class="category-section">
<h2 class="category_h2">MY PAGE<i class="fas fa-angle-down"></i></h2>

<ol>
	<li><a href="#" onClick="location.href='/member/mypage'">북마크</a></li>
	<li><a href="#" onClick="location.href='/member/searchHistory'">최근 검색 내역</a></li>
<!-- 	<li><a href="javascript:getMyWish()">찜한 강좌 최근 검색 내역</a></li> -->
	<li><a href="#" onClick="location.href='/member/bookHistory.jsp'">구매한 책</a></li>
	<li><a href="#" onClick="location.href='/member/review.jsp'">리뷰 내역</a></li>
	<li><a href="#" onClick="location.href='/member/comment.jsp'">코멘트 내역</a></li>
	<%if(isAdmin) {%>
	<li><a href="#" onClick="location.href='/admin/main'">관리자 페이지</a></li>
	<%} %>
	<li><a href="#" onClick="location.href='/member/modify.jsp'">개인정보 수정</a></li>
</ol>	    
</div>
