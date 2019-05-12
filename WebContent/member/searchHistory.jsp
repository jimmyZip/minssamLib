<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/include/head.jsp" %>
<title>검색 내역</title>
<script>
 $(function(){
	getList();
});

function getList(){
	$.ajax({
		url:"/member/mypage/searchHistory",
		type:"get",
		success:function(result){
			viewList(result);
			console.log(result);
		}
	});
}

function bookSearchDelete(searchbook_id){
	$.ajax({
		url:"/member/mypage/searchHistory/"+searchbook_id,
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
		str+="<td>"+obj.book.title+"</td>";
		str+="<td><input type='hidden' value="+obj.searchbook_id+"></td>";
		str+="<td>"+obj.searchdate+"</td>";
		str+="<td><button onClick='bookSearchDelete("+obj.searchbook_id+")'>삭제</button></td>";
		str+="</tr>";
		console.log(obj.book.image);
		con.append(str);
	} 
}
</script>
</head>
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
	           
	         <tbody id="container" class="mypageContainer">
	         
				
	         </tbody>
	       </table>
	   </div>
	
	</div>
	
	
	
	<!-- footer start -->
	<%@include file="/include/footer.jsp" %>

	<!-- footer end -->

</body>
</html>