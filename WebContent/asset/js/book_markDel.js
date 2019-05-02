$(function(){
	getList();
	//alert("내가 먼저야");
});
function getList(){
	$.ajax({
		url:"/member/mypage/{currentPage}",
		type:"get",
		success:function(result){
			renderList(JSON.parse(result));
		},
		error:function(result){
			alert("renderList 실패");
		}
	});
}

function renderList(json){
	var mark_id=null;
	for(var i=0; i<json.length;i++){
		var obj=json[i];
		
		$(".mypageContainer").append("<td><a href='#'><div onClick='fly("+obj.isbn+")' class='my-lecture-img' style='background-image:url('"+obj.image+"')></div></a></td>");
		$(".mypageContainer").append("<td>"+obj.title+"</td>");
		$(".mypageContainer").append("<td><input type='hidden' name='bookmark_id' value='"+obj.bookmark_id+"'/></td>");
		$(".mypageContainer").append("<td>"+obj.bookmark_date+"</td>");
		mark_id=obj.bookmark_id;
	}
	return mark_id;
}

function book_markDel(mark_id){

	if(!confirm("삭제?")){
		return;
	}
	var bookmark_id=mark_id;
	
	$.ajax({
		url:"/member/mypage/{currentPage}"+bookmark_id,
		type:"DELETE",
		success:function(result){
			var json=JSON.parse(result);
			
			if(json.resultCode==1){
				alert("삭제성공");
				getList();
			}else{
				alert("삭제실패");
			}
		}
	});


}































