/*-----------------------------------------------
MyPage 용 js
-----------------------------------------------*/


/*-----------------------------------------------
찜한 강좌 배열을 전송한다
-------------------------------------------------*/
/*function getMyWish(){
	var json=JSON.parse(getCookie(uid));
	
	var form = $("<form></form>");
	
	for(var i=0;i<json.wish.length;i++){
		var lecture=json.wish[i];
		$(form).append("<input type='hidden' name='lecture_id' value='"+lecture.lecture_id+"'/>");	
	}
	$(document.body).append($(form));
	$(form).attr({
		action:"/mypage/wish",
		method:"post"
	});
	$(form).submit();
}
$(function(){
	$(".mypage .cl ol li").click(function(){
		
	});
});
*/