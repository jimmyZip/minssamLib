<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp" %>
<title>관리자용 페이지 - 권한관리</title>
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
                       <th>이름</th>
                       <th>권한 수정</th>
                       <th>멤버 관리</th>
                       <th>리뷰 관리</th>
                       <th>리뷰 코멘트 관리</th>
                       <th>책 코멘트 관리</th>
                       <th>비고</th>
	               </tr>
	           </thead>
	           <tbody id="container">
	       			<tr>
                       <td>권한 이름</td>
                       <td><input type="checkbox"></td>
                       <td><input type="checkbox"></td>
                       <td><input type="checkbox"></td>
                       <td><input type="checkbox"></td>
                       <td><input type="checkbox"></td>
                       <td>
	                       	<button onClick="#">삭제</button>
	                       	<button onClick="#">수정</button>
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