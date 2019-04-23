/*----------------------------------------------------------
SDK 초기화
----------------------------------------------------------*/
var uid;

window.fbAsyncInit = function() {
	FB.init({
		appId      : '1918516318270897',
		cookie     : true,  // enable cookies to allow the server to access 
				  // the session
		xfbml      : true,  // parse social plugins on this page
		version    : 'v3.2' // The Graph API version to use for the call
	});

	FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
};


/*----------------------------------------------------------
상태를 확인하는 함수인 FB.getLoginStatus() 에 의해 호출되는 함수 : 웹페이지 로딩시마다 매번 실행된다
	1) connected: 페이스북에 로그인 되어 있고, 우리 사이트의 접근을 수락한 사용자
						connected가 반환될 경우 로그인 상태를 표현한다
						쿠키는 지금 시점에 부여할 필요없고, 로그인 요청시 서버에서 정보를 가져와 쿠키를 부여하면 된다
	2) not_authorized : 우리 사이트의 접근을 수락하지 않은 사용자인 경우, 즉 우리 사이트 가입을 하지 않은 상태의 사용자
	3) unknown : 페이스북에 로그인 하지 않았기 때문에 1,2번의 상태를 알 수 없는 사용자
----------------------------------------------------------*/
function statusChangeCallback(response){
	console.log("statusChangeCallback:현재 유저의 페이스북 status 는 : "+response.status);
	
	if(response.status=="connected"){ 
		$("#login-bt").find("span").text("LOGOUT");
		
		FB.api("/me?fields=id,email,name", function(res){
			//console.log("statusChangeCallback: 페이스북으로 부터 넘겨받은 회원 정보는 ",res.id, res.email, res.name);
			/*------------------------------------
			 사이트 진입시마다 uid에 유저 정보를 보관한다
			--------------------------------------*/
			uid=res.id; 
			console.log("statusChangeCallback FB.api() :현재 유저의 쿠키값은 : ",getCookie(uid));
			
			/*------------------------------------
		 	 뱃지 수 갱신
			--------------------------------------*/
			getWishList();
			
		});
		
		//찜목록 뱃지 처리
	}else{
		console.log("statusChangeCallback:로그인이 필요함");
		console.log("statusChangeCallback: 현재 쿠키값 : ",getCookie(uid));
		$("#login-bt").find("span").text("LOGIN");
	}
}

/*----------------------------------------------------------
Facebook  SDK 로드(비동기 방식으로)
----------------------------------------------------------*/
(function(d, s, id){
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {return;}
	js = d.createElement(s); js.id = id;
	js.src = "https://connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
  

/*----------------------------------------------------------
로그인 버튼 누를때 호출되는 2개의 메서드
1) 서버에 등록 요청을 시도한다. 
	단, 이미 가입된 회원이면 서버에서 중복 가입 처리하지 않는다
	
2) 서버의 회원정보를 가져와 쿠키에 할당한다
	이때, 비어있는 찜목록을 생성해 둬야 모든 페이지에서 length속성을 이용할 수 있다
----------------------------------------------------------*/
function requestLogin(){
	
	FB.login(function(response){ //로그인 요청하기
		console.log("requestLogin: 페이스북에 로그인 요청한 결과 값은 : ", response);
				
		if(response.status =="connected"){
			FB.api("/me?fields=id,email,name", function(res){
				uid=res.id;
				console.log(res);
				
				$("#login-bt").find("span").text("LOGOUT");
				
				console.log("requestLogin: 서버 DB에 회원 등록을 요청합니다");
				registMember(res.id, res.email, res.name);//중복 가입 여부는 서버에서 처리				
			});
		}
		
	}, {scope: 'public_profile,email'});	
}

function registMember(sns_id, email, name){
	//alert(sns_id+","+email+","+name);
	$("#loginModal").css({display:"none"});
	
	var receive;//이메일수신 여부
	if($("#recv-form :input[name='receive']").prop("checked")){
		receive="yes";	
	}else{
		receive="no";
	}
	
	$.ajax({
		url:"/member",
		type:"POST",
		data:{
			"sns_id":sns_id,
			"email":email,
			"name":name,
			"sns":"facebook",
			"receive":receive
		},
		success:function(result){
			console.log("registMember: 회원 등록 요청 후 서버에서 반환된 결과값  :"+result);
			
			result["wish"]=[]; //비어있는 찜목록 생성하기
			
			setCookie(uid, JSON.stringify(result), 365);
			console.log("registMember: 서버에서 가져온 값을 쿠키로 등록 getCookie("+uid+"): ", getCookie(uid));			
		},
		error:function(result){
			console.log("registMember: 서버 측에러:"+result);
		}
	}); 
}

/*----------------------------------------------------------
로그인/로그아웃 버튼 누를때
----------------------------------------------------------*/
function checkLogin(obj){
	var label=$(obj).text();
	
	if(label=="로그인"){//로그인 버튼을 누르면 로그인 창 띄운다
		$("#loginModal").css({display:"block"}); 
	}else if(label=="로그아웃"){//로그아웃 버튼을 누르면 로그아웃 처리한다
		FB.logout(function(response){
			//$("#login-bt").find("span").text("LOGIN");
			deleteCookie(uid);
			location.reload();
		});
	}	
}
