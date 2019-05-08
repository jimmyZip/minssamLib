<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp" %>
<style>
.page_href{
	display: unset;
}
</style>
<script>
function commentDelete(comment_id){
	if(!confirm("삭제 하시겠습니까?")){
		return
	}
	
	$.ajax({
		url:"/admin/review_comment/"+comment_id,
		type:"delete",
		success:function(result){
			var json = JSON.parse(result);
			if(json.resultCode == 0){
				alert(json.msg);
			}
			location.reload(true);
		}
	})
}
</script>
<title>관리자용 페이지 - 리뷰 코멘트 관리</title>
</head>
<!-- head end -->
<body>
	
    <!-- header start -->
	<%@include file="/include/header.jsp"%>
	<!-- header end -->
	<!-- page visual -->
    <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">관리자용 페이지 입니다</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
	    </div>
    </div>
	<!-- blog list start -->
	
	<div class="wrap main cl mypage">
	<!-- 사이드 메뉴 include -->
	<%@include file="/include/adminSide.jsp" %>
	   <div class="list-section">
	       <table class="table_basic my_lecture_list">
	           <thead>
	               <tr>
	                   <th>순서</th>
                       <th>리뷰 제목</th>
                       <th>코멘트 내용</th>
                       <th>작성자</th>
                       <th>작성일</th>
                       <th>삭제</th>
	               </tr>
	           </thead>
	           <tbody id="container">
	           	<c:set var="num" value="${pager.num}"/>
	           	<c:set var="curPos" value="${pager.curPos}"/>
	           		
	           		<c:forEach var="comment" items="${reviewCommentList}" begin="${pager.curPos}" end="${pager.curPos+pager.pageSize-1}">
	           		   <tr>
						   <td>${num}</td>
		                   <td>${comment.review.title}</td>
		                   <td>${comment.content}</td>
		                   <td>${comment.member.nickname}(${comment.member.id})</td>
		                   <td>${comment.regdate}</td>
		                   <td><button onClick='commentDelete(${comment.reviewComment_id})'>삭제</button></td>
		               </tr>
		               <c:set var="num" value="${num-1}"/>
                   </c:forEach>
                   <tr>
						<td colspan="6">
							<!-- 이전 블럭 -->
							<c:if test="${pager.firstPage-1>0} }">
								<a class="page_href" href="/admin/review_comment/page?currentPage=${pager.firstPage-1}">[prev]</a>
							</c:if>
							<c:if test="${pager.firstPage-1<=0}">
								<a class="page_href" href="javascript:alert('첫페이지 입니다.')">[prev]</a>
							</c:if>
							
							<!-- 페이지 표시 -->
							<c:forEach var="i" begin="${pager.firstPage}" end="${pager.lastPage}">
								<c:if test="${i<=pager.totalPage}">
									<a class="page_href" href="/admin/review_comment/page?currentPage=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음 블럭 -->
							<c:if test="${pager.lastPage+1<pager.totalPage}">
								<a class="page_href" href="/admin/review_comment/page?currentPage=${pager.lastPage+1}">[next]</a>
							</c:if>
							<c:if test="${pager.lastPage+1>=pager.totalPage }">
								<a class="page_href" href="javascript:alert('마지막 페이지입니다.')">[next]</a>
							</c:if>
						</td>
					</tr>
	           </tbody>
	       </table>
	   </div>
	
	</div>
	
	<!-- footer start -->
	<%@include file="/include/footer.jsp" %>

	<!-- footer end -->

</body>
</html>       