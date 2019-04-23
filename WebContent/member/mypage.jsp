<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/asset/images/favicon.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.min.css">
<!-- main.css는 swiper.min.css 밑에서 include 되어야함-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900|Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" >
<link rel="stylesheet" type="text/css" href="/asset/css1/fonts.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/common.css">
<link rel="stylesheet" type="text/css" href="/asset/css/common/login_modal.css">
<link rel="stylesheet" type="text/css" href="/asset/css/common/movie_modal.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/online.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/online_res.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/offline.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/cart.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/blog.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/cs.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/campus.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/mypage.css">
<link rel="stylesheet" type="text/css" href="/asset/css1/viewport.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://player.vimeo.com/api/player.js"></script>
<script src="/asset/js/common.js"></script>
<script src="/asset/js/facebook_login.js"></script>
<script src="/asset/js/Lecture.js"></script>
<script src="/asset/js/OnlineLecture.js"></script>
<!-- <script src="/asset/js/redirect.js"></script> -->
<script src="/asset/js/mypage.js"></script>
<!-- 로그인 모달 창 -->


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
		<!-- <div id="loginModal" class="login-modal">
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
            <!-- LOGO start -->
            <h1 class="logo"><a href="/">min<span>ssam's</span><span>Library</span></a></h1>
            <!-- LOGO end -->
            
            <div class="title-icon-wrapper">
                <i class="fa cart dropdown" onClick="location.href='/payment/cart/'"></i>
                <span class="icon-cnt cart-cnt" id="cart_number">5</span>
                <i class="fa heart dropdown" onClick="location.href='/payment/wish/'"></i>
                <span class="icon-cnt heart-cnt" id="wish_number">2</span>
                <!-- login btn start -->
                <!-- <i class="far fa-user dropdown"></i>
                <div class="user-content">
                    <ul>
                        <li><a href="/mypage/online/" class="user-btn">마이페이지</a></li>
                        <li><a href="/payment/cart/" class="user-btn">장바구니</a></li>
                        <li><a href="/mypage/wish/" class="user-btn">찜목록</a></li>
                        <li><a href="#" class="user-btn" id="login-bt" onClick="checkLogin(this)">로그인</a></li>
                    </ul>   
                </div> --><!-- login btn end -->
            </div>
        
            
            
            
        </div>
        <!-- modal wrapper start -->
        <div id="wrapper"></div>
        <!-- modal wrapper end -->

        <!-- Main menu start -->
        <div id="main-menu">  
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
        </div>
        <!-- Main menu end -->
	
    </header>
    <!-- hedaer end -->

    <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">마이 페이지</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
	    </div>
    </div>
	<!-- blog list start -->
	
	<div class="wrap main cl mypage">
	    <div class="category-section cl">

<h2 class="category_h2">MY PAGE<i class="fas fa-angle-down"></i></h2>
<div class="user-photo" title="내 사진"></div>
<div class="user-name">스티븐 잡스</div>
<ol>
	<li class="active"><a href="#" onClick="location.href='/minssamMypage/myPage.jsp'">나의 강좌 북마크</a></li>
	<li ><a href="javascript:getMyWish()">찜한 강좌 최근 검색 내역</a></li>
	<li ><a href="#" onClick="location.href='/mypage/payment'">결제 내역 구매한 책</a></li>
	<li ><a href="#" onClick="location.href='/mypage/point'">포인트/쿠폰 리뷰 내역</a></li>
	<li ><a href="#" onClick="location.href='/mypage/point'">포인트/쿠폰 코멘트 내역</a></li>
	<li ><a href="#" onClick="location.href='/mypage/point'">포인트/쿠폰 관리자 페이지</a></li>
	<li ><a href="#" onClick="location.href='/mypage/point'">포인트/쿠폰 개인정보 수정</a></li>
</ol>	    
</div>
	   <!--category-section-->
	   
	   <div class="list-section">
	       <h2>내 강좌</h2>
	       <table class="table_basic my_lecture_list">
	           <thead>
	               <tr>
                       <th>No</th>
                       <th>이미지</th>
                       <th>책 제목</th>
                       <th>날짜</th>
                       <th>비고</th>
	               </tr>
	           </thead>
	           <tbody id="container">
					           
	               <tr>
                       <td>
                           <a href="#"><div class="my-lecture-img" style="background-image:url('/upload/1547218972925.jpg');"></div>Java 스탠다드 프로그래밍</a>
                       </td>
                       <td>46강</td>    
                       <td>60일</td>
                       <td>30일 남음</td>
                       <td>2019-02-24</td>
                   </tr>
 					
	           </tbody>
	       </table>
	   </div>


	
	</div>
	
	<!-- blog list end -->

	<div class="footer-wrapper">
      <dl class="wrap cl">
         <dt>회사명</dt>
         <dd>민쌤의 서재</dd>
         <dt>대표자</dt>
         <dd>민쌔앰</dd>
         <dt>TEL</dt>
         <dd>070-1234-5678</dd>
         <dt>EMAIL</dt>
         <dd class="bd0">library@minssamlib.com</dd>
         <dt>사업장 소재지</dt>
         <dd class="bd0">서울특별시 종로구 익선동</dd>
         <dt>사업자등록번호</dt>
         <dd class="bd0">123-45-67890</dd>
         <!--
            <dt>통신판매업</dt>
            <dd>2011-서울마포-01955</dd>
-->
         <dt class="sound_only">저작권</dt>
         <dd class="bd0">COPYRIGHT &copy; SOLUVISION. ALL RIGHTS RESERVED</dd>
         <dd class="bd0">powered by 민쌤닷컴</dd>
      </dl>
      <!--
        <p>민쌤닷컴 | 사업자등록번호 : 128-30-77240</p>
        <p>대표 : 민진호 | 사업장 소재지 : 서울시 마포구 서교동 354-9 </p>
        <p>대표전화 : 070-2888-1588 | FAX : 0504-185-9055 </p>
        <p>E-Mail : webmaster@minssam.com</p>
-->
   </div>
   <!-- footer end -->

</body>
</html>       