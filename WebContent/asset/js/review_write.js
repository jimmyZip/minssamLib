/**
 * 
 */
$(document).ready(function(){
	init();	
});
function init(){
	CKEDITOR.replace('content');
	$("input[type='button']").click(function(){
		send();
	});
}

function send(){
	var form=$("form");
	form.attr({
		"method":"post",
		"action":"/reviews"
	});
	form.submit();
}