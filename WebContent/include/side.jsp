<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/include/head.jsp" %>

<div class="category-section">
<h2 class="category_h2">MY PAGE<i class="fas fa-angle-down"></i></h2>
<div class="user-photo" title="내 사진"></div>
<div class="user-name">스티븐 잡스</div>
<ol>
	<li><a href="#" onClick="location.href='/member/mypage.jsp'">나의 강좌 북마크</a></li>
	<li><a href="javascript:getMyWish()">찜한 강좌 최근 검색 내역</a></li>
	<li><a href="#" onClick="location.href='/member/bookHistory.jsp'">결제 내역 구매한 책</a></li>
	<li><a href="#" onClick="location.href='/member/review.jsp'">포인트/쿠폰 리뷰 내역</a></li>
	<li><a href="#" onClick="location.href='/member/comment.jsp'">포인트/쿠폰 코멘트 내역</a></li>
	<li><a href="#" onClick="location.href='/member/admin.jsp'">포인트/쿠폰 관리자 페이지</a></li>
	<li><a href="#" onClick="location.href='/member/modify.jsp'">포인트/쿠폰 개인정보 수정</a></li>
</ol>	    
</div>
