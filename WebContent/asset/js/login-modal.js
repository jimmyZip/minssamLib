/*modal popup related with login*/
$(function(){
	$("#full,#view").hide();
	$("#login-bt").click(function(){
		loginModalShow();
	});
});
function loginModalShow(){
	$("#view").load("/member/login/loginform.jsp");
	$("#view,#full").show();
	$("#full").click(function(){		
		$("#full,#view").hide();
	});
}