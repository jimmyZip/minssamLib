/*modal popup related with login*/
$(function(){
	$("#full,#view").hide();
	$("#login-bt").click(function(){
		alert(1);
		loginModalShow();
	});
});
function loginModalShow(){
	alert(2);
	$("#view").html("<div id='login-form'></div>");
	$("#login-form").load("/member/loginform.jsp");
	$("#view,#full").show();
	$("#full").click(function(){		
		$("#full,#view").hide();
	});
}