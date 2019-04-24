<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp" %>
<title>MyPage</title>
</head>
<body>
    <!-- header start -->
        <%@ include file="/include/header.jsp" %>
    <!-- hedaer end -->
    <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">마이 페이지</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
	    </div>
    </div>
	<!-- blog list start -->
	
	<div class="wrap main cl mypage">
	<!-- 사이드 메뉴 include -->
	<%@include file="/include/side.jsp" %>
	   
	   <div class="list-section">
	       <h2>내 강좌</h2>
	       <table class="table_basic my_lecture_list">
	           <thead>
	               <tr>
                       <th>No</th>
                       <th>이미지</th>
                       <th>책 제목</th>
                       <th>날짜</th>
                       <th>비고</th>
	               </tr>
	           </thead>
	           <tbody id="container">
					           
	               <tr>
                       <td>
                           <a href="#"><div class="my-lecture-img" style="background-image:url('/upload/13394898.jpg');"></div>곰돌이 푸</a>
                       </td>
                       <td>46강</td>    
                       <td>60일</td>
                       <td>30일 남음</td>
                       <td>2019-02-24</td>
                   </tr>
                   
                   <tr>
                       <td>
                           <a href="#"><div class="my-lecture-img" style="background-image:url('/upload/06426567.jpg');"></div>안아프니까 청춘이다</a>
                       </td>
                       <td>46강</td>    
                       <td>60일</td>
                       <td>30일 남음</td>
                       <td>2019-02-24</td>
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