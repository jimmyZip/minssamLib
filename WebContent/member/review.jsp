<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp" %>
<title>리뷰 내역</title>
<script>
$(function(){
	getList();
});

function getList(){
	$.ajax({
		url:"/member/mypage/review",
		type:"get",
		success:function(result){
			viewList(result);
			//console.log(result);
		}
	});
}

function bookSearchDelete(review_id){
	$.ajax({
		url:"/member/mypage/review/"+review_id,
		type:"delete",
		success:function(){
			getList();
		}
	});
}

function viewList(json){
	var con=$("#container");
	con.html("");//data delete
 	for(var i=0; i<json.length;i++){
		var obj=json[i];
		//                                                                        'fly("+obj.isbn+")'   
		var str ="";
		str+="<tr id=table_tr>";
		str+="<td><a href='#'><div onClick='javascript:fly("+obj.isbn+")' class='my-lecture-img' style=\"background-image:url("+obj.book.image+")\"></div></a></td>";
		str+="<td>"+obj.title+"</td>";
		str+="<td><input type='hidden' value="+obj.review_id+"></td>";
		str+="<td>"+obj.regdate+"</td>";
		str+="<td><button onClick='bookSearchDelete("+obj.review_id+")'>삭제</button></td>";
		str+="</tr>";
		console.log(obj);
		console.log(obj.img);
		con.append(str);
	} 
}
</script>
</head>
<!-- head end -->
<body>
    <!-- header start -->
	<%@include file="/include/header.jsp"%>
	<!-- header end -->
	<!-- page visual -->
    <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">리뷰 내역</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
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
                       <th>리뷰에 추가한 이미지 넣기이미지</th>
                       <th>리뷰 제목</th>
                       <th></th>
                       <th>날짜</th>
                       <th>비고</th>
	               </tr>
	           </thead>
	           <tbody id="container">
					           
 					
	           </tbody>
	       </table>
	   </div>
	
	</div>
	
	
	
	<!-- footer start -->
	<%@include file="/include/footer.jsp" %>

	<!-- footer end -->

</body>
</html>       