<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	if (session.getAttribute("member") != null) {
		System.out.print("세션있음");
	} else {
		System.out.print("세션없음");
	}
//조장님 이 부분도 include로 빼야 하나요
%>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp" %>
<title>마이 페이지</title>
</head>
<!-- head end -->
<body>
    <!-- header start -->
	<%@include file="/include/header.jsp"%>
	<!-- header end -->
	<!-- page visual -->
    <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">북마크</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
	    </div>
    </div>
	<!-- blog list start -->
	
	<div class="wrap main cl mypage">
	<!-- 사이드 메뉴 include -->
	<%@include file="/include/side.jsp" %>
	   
	   <div class="list-section">
	       <table class="table_basic my_lecture_list">
	           <thead>
	               <tr>
                       <th>이미지</th>
                       <th>책 제목</th>
                       <th></th>
                       <th>날짜</th>
                       <th>비고</th>
	               </tr>
	           </thead>
	           <tbody id="container">
					           
	       			<tr>
                       <td>
                           <a href="#"><div class="my-lecture-img" style="background-image:url('/upload/13394898.jpg');"></div></a>
                       </td>
                       <td>곰돌이 푸</td>
                       <td></td>
                       <td>regdate 받아와서 넣기</td>
                       <td><button onClick="#">삭제</button></td>
                	</tr>
                   
                   
                   <tr>
                       <td>
                           <a href="#"><div class="my-lecture-img" style="background-image:url('/upload/06426567.jpg');"></div></a>
                       </td>
                       <td>안아프니까 청춘이다</td>
                       <td></td>
                       <td>regdate 받아와서 넣기</td>
                       <td><button onClick="#">삭제</button></td>
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