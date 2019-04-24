/*---------------------------------------------------------------
해상도 관련 공통 처리 
---------------------------------------------------------------*/
$(document).ready(function(){
	//해상도
	var screenW = $(window).outerWidth();
	//console.log(screenW);
	if(screenW > 768) {
		$('body').removeClass();
		$('body').addClass('pc');
	} else {
		$('body').removeClass();
		$('body').addClass('mobile');
	}
	$(window).resize(function() {	 
		screenW = $(window).outerWidth();
		if(screenW > 768) {
			$('body').removeClass();
			$('body').addClass('pc');
		} else {
			$('body').removeClass();
			$('body').addClass('mobile');
		}
	});

    $(".menu-btn, #wrapper").click(function(){
        $(".main-menu").toggle();
        $("#wrapper").toggle();
    });

    $(".dropdown").click(function(){
        $(".user-content").toggle();
    });    
});


/*---------------------------------------------------------------
쿠기에 데이터 넣기:  cname : 키값 , cvalue : 데이터 , exdays : 유효기간
---------------------------------------------------------------*/
function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays*24*60*60*1000));
	var expires = "expires="+ d.toUTCString();
	document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}


/*---------------------------------------------------------------
쿠기에서 데이터 가져오기
---------------------------------------------------------------*/
function getCookie(cname) {
	var name = cname + "=";
	var decodedCookie = decodeURIComponent(document.cookie);

	var ca = decodedCookie.split(';');
	for(var i = 0; i <ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}

/*---------------------------------------------------------------
쿠키 삭제하기
---------------------------------------------------------------*/
function deleteCookie(cname){
	document.cookie = cname+"=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}


/*---------------------------------------------------------------
wish 처리하기
---------------------------------------------------------------*/
function checkWish(obj,lecture_id){

	if($(obj).attr("class")=="far fa-heart"){ //비어있는 하트 이면 찜추가
		addWish(obj,lecture_id);
	}else if($(obj).attr("class")=="fas fa-heart"){//채워져 있는 하트 이면 찜제거
		removeWish(obj,lecture_id)
	}		
}


/*---------------------------------------------------------------
wish 리스트 넣기
---------------------------------------------------------------*/
function addWish(obj,lecture_id){

	/*------------------------------------------
	 로그인 체크
	------------------------------------------*/
	if(getCookie(uid).length <=0){
		alert("로그인이 필요한 서비스입니다");
		return;
	}
	
	$(obj).attr("class","fas fa-heart");
 
	var json=JSON.parse(getCookie(uid));
	
	console.log("addWish : 강좌 추가전 wish 에 담겨진 강좌 수", json.wish.length);
	
	//강의 정보를 JSON으로 구성한다
	var lecture={
		lecture_id:lecture_id
	};
	
	//쿠키에 추가한다
	json.wish.push(lecture); //배열에 추가 한다
	
	console.log("addWish : 강좌 추가후 wish 에 담겨진 강좌 수", json.wish.length);
	setCookie(uid, JSON.stringify(json) ,365);
	
	//찜목록 뱃지 처리
	getWishList();	
}



/*---------------------------------------------------------------
찜목록 제거하기
---------------------------------------------------------------*/
function removeWish(obj,lecture_id){	
	
	$(obj).attr("class","far fa-heart");
	
	/*------------------------------------------
	 쿠기에 들어있는 wish 중 강좌 1개를 삭제
	 ------------------------------------------*/
	var json=JSON.parse(getCookie(uid));
	
	if(json.wish.length > 0){ //쿠키에 들어있다면
		for(var i=0;i<json.wish.length;i++){
			var lec=json.wish[i];
			if(lec.lecture_id == lecture_id){
				json.wish.splice(i, 1);
				console.log("removeWish : ", lecture_id+" 강좌를 삭제합니다");
			}			
		}
	}
	setCookie(uid,JSON.stringify(json),365); //쿠키에 String 으로 다시 담는다
	console.log("removeWish : 삭제 후 남은 wish 강좌 수는 ", json.wish.length );
	
	getWishList(); //뱃지 갱신
}

/*---------------------------------------------------------------
찜목록 가져오기
1)쿠키가 있는 여부 판단
2)찜목록의 갯수에 따라 뱃지 처리 
3)찜목록 정보와 현재 강좌간 일치 여부 찾아서  찜목록 강좌들의 감좌담기,찜한강좌  처리
---------------------------------------------------------------*/
function getWishList(){
	//로그인 했다면
	if(getCookie(uid)!=undefined){
		var json=JSON.parse(getCookie(uid));
		console.log("getWishList: 찜목록의 갯수는 : ",json.wish.length);
		$("#wish_number").text(json.wish.length);
		
		//찜목록이 0일 때는 않보이게 처리
		if(json.wish.length <1){
			$("#wish_number").css("opacity","0");
		}else{
			$("#wish_number").css("opacity","1");
		}
		
		//찜한 강좌 하트 처리 
		for(var i=0;i<json.wish.length;i++){
			$("#"+json.wish[i].lecture_id).find("i").attr("class","fas fa-heart"); 
		}
		
	}
}



