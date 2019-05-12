$(document).ready(function(){
	var tempTitle = localStorage.getItem('tempTitle');
	var tempContent = localStorage.getItem('tempContent');
	var tempMyImg = localStorage.getItem('tempMyImg');
	renderPreview(tempTitle,tempContent,tempMyImg);
});
function renderPreview(tempTitle,tempContent,tempMyImg){
	$("input[name='title']").val(tempTitle);
	$("#content").val(tempContent);
	$(".imgListUnit").find("img").attr("src","/upload/"+tempMyImg);
}
