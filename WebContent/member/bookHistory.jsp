<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/include/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>

<script>
$(function(){
	//var obj=JSON.parse(getCookie(uid));
	
	//alert(obj.member.sns_id);
	//https://graph.facebook.com/1160536440789802/picture?type=small
/* 	
	$(".user-photo").css({
		"background":"url('https://graph.facebook.com/"+obj.member.sns_id+"/picture?type=large')"	
	});

 */	
});
</script>
</head>
<body>
<!-- header start -->
    <header>
    
<script>
$(function(){
	/*----------------------------------------------------------
	로그인창 닫기
	----------------------------------------------------------*/
	$(".close").click(function(){
		$("#loginModal").css({display:"none"});
	});
});
</script>
		<!-- 로그인 모달 창 Begin -->
		<!-- <div id="loginModal" class="login-modal"> 필요없으면 지워되 무관
			<div class="modal-content">
				<div class="login-header">
					<div class="close btn">닫기</div>
					<h3 class="clear">민쌤의서재는 facebook 계정으로 이용 가능합니다.</h3>
				</div>
				<div class="login-content">		
					<a href="#" class="sns-btn facebook" id="facebook-btn" onClick="requestLogin()">
						<i class="fab fa-facebook"></i> 
						Facebook 으로 민쌤의서재 로그인
					</a>
					
					<div class="agree-section">
						<a href="/law/terms">이용 약관</a> 및 <a href="/law/policy">개인정보 보호 정책</a>에 동의하게 됩니다.
					</div>
					
					<form id="recv-form" class="mail_service cl">
						<span class="mail_chk"><input type="checkbox" name="receive" value="" checked/></span>
						<span class="mail_txt">체크하시면 할인 이벤트 및 새로운 정보를 메일로 받아보실 수 있습니다.</span>
					</form>
				</div>
						
				<div class="login_regist">
					계정이 없으신가요? <a onClick="requestLogin()">가입하기</a>
				</div>
			</div>	
		</div> -->
		<!-- 로그인 모달 창 End-->
						
        <div class="title-bar wrap cl">
            <div class="menu-btn">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </div>
        </div>
        <!-- modal wrapper start -->
        <div id="wrapper"></div>
        <!-- modal wrapper end -->

        <!-- Main menu start -->
        <%@ include file="/include/header.jsp" %>
      <!--   <div id="main-menu">   혹시모르니 살려둠 필요없을시 지워도 무관
            <nav class="main-menu">
               <div class="main-top">
                    <div class="regist1">
                        <div class="cl">
                            <span>로그인 해주세요.</span>
                            <a href="#">로그인</a>
                            <a href="#">회원가입</a>
                        </div>
                    </div>
                    <ol class="regist2 cl">
                        <li onclick="location.href='../order/cart.html'"><i class="cart"></i>장바구니</li>
                        <li onclick="location.href='../mypage/wish_list.html'"><i class="heart"></i>위시리스트</li>
                        <li><i class="user"></i>마이페이지</li>
                    </ol>
               </div>
                <div class="menu-item" onclick="location.href='/online/'">온라인 강좌</div>
                <div class="menu-item" onclick="location.href='/offline/'">오프라인 강좌</div>
                <div class="menu-item" onclick="location.href='/blog/'">IT블로그</div>
                <div class="menu-item" onclick="location.href='/campus/'">캠퍼스 Story</div>
                <div class="menu-item" onclick="location.href='/cs/notice/'">고객센터</div>
            </nav>
        </div> -->
        <!-- Main menu end -->
	
    </header>
    <!-- hedaer end -->
    
     <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">마이 페이지</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
	    </div>
    </div>
     <div class="wrap main cl mypage">
     <%@include file="/include/side.jsp" %>
	   <!--category-section-->
	   
        <div class="list-section payment-section">
	       <h2>결제 내역</h2>
	       <form action="" class="payment-date-check">
               <div class="cl">
                   <div class="from-date"><input type="text" value="2018-12-01" maxlength="10"><button class="btn-calendar"><i class="far fa-calendar-alt"></i></button> 부터 </div>
                   <div class="to-date"><input type="text" value="2019-03-01" maxlength="10"><button class="btn-calendar"><i class="far fa-calendar-alt"></i></button> 까지</div>
                   <input type="submit" class="date-inquiry" value="조회">
	           </div>
	       </form>
	       <div class="payment-content">
	           <h3 class="pament-date">2018.12</h3>
	           <a href="/mypage/payment/1" title="자세히 보기" style="background-image:url('/upload/1547218972925.jpg');"><div class="payment-list">
                        <span class="ellipsis"><strong>Java 스탠다드 프로그래밍</strong></span>
                        <span class="fl linebar">190,000원</span>
                        <span class="fl">결제일 : 2018-12-01</span>
                        <span class="br red">결제완료</span>
                   </div>
               </a>
	           <a href="/mypage/payment/1" title="자세히 보기" style="background-image:url('/upload/1547218972925.jpg');"><div class="payment-list">
                        <span class="ellipsis"><strong>Java 스탠다드 프로그래밍</strong></span>
                        <span class="fl linebar">190,000원</span>
                        <span class="fl">결제일 : 2018-12-01</span>
                        <span class="br red">결제완료</span>
                   </div>
               </a>
	       </div>
	       <div class="payment-content">
	           <h3 class="pament-date">2019.2</h3>
	           <a href="/mypage/payment/1" title="자세히 보기" style="background-image:url('/upload/1547218972925.jpg');"><div class="payment-list">
                        <span class="ellipsis"><strong>Java 스탠다드 프로그래밍</strong></span>
                        <span class="fl linebar">190,000원</span>
                        <span class="fl">결제일 : 2018-12-01</span>
                        <span class="br red">결제완료</span>
                   </div>
               </a>
	           <a href="/mypage/payment/1" title="자세히 보기" style="background-image:url('/upload/1547218972925.jpg');"><div class="payment-list">
                        <span class="ellipsis"><strong>Java 스탠다드 프로그래밍</strong></span>
                        <span class="fl linebar">190,000원</span>
                        <span class="fl">결제일 : 2018-12-01</span>
                        <span class="br red">결제완료</span>
                   </div>
               </a>
	       </div>
	    </div>
	    <!-- payment list end -->
    </div>
     
    




<%@include file="/include/footer.jsp" %>

</body>
</html>