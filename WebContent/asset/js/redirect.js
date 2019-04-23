var url=window.location.href;
var tokenIndex=url.indexOf(":");
if(url.substring(0, tokenIndex) == "http"){
	window.location.replace("https://minssam.com");	
}