
/*modal popup related with login*/
$(function(){
   $("#full,#view").hide();
   $("#login-bt").click(function(){
      loginModalShow();
   });
   
   //$(".search_id_pw a#findId").click(function(){
	   //findId();
	   //alert("찾기 클릭");
   //});
   
   
});


function loginModalShow(){
   $("#view").load("/member/login/loginform.jsp");
   $("#view,#full").show();
   $("#full").click(function(){      
      $("#full,#view").hide();
   });
}

function findId(){
	$("#view").empty();
	$("#view").load("/member/edit/findidform.jsp");
	//alert("찾기 클릭");
}

function resetPass(){
	$("#view").empty();
	$("#view").load("/member/edit/emailconfirm.jsp");
}


function goResetPass(){

		$("#view").empty();
		$("#view").load("/member/edit/resetpass.jsp");

}










