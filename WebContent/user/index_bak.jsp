<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Book Search Result</title>
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
<script src="/asset/js/Lecture.js"></script>
<script src="/asset/js/OnlineLecture.js"></script>
<script src="/asset/js/mypage.js"></script>
</head>
<!-- head end -->
<body>
    <!-- header start -->
    <header>					
        <div class="title-bar wrap cl">
            <div class="menu-btn">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </div>
            <!-- LOGO start -->
            <h1 class="logo">
            	<a href="/">min<span>ssam's</span><span>Library</span></a>
            </h1>
            <!-- LOGO end -->
            <!-- search box -->
			<div class="searchArea">
				<form name="search-form">
					<fieldset>
						<p class="search-input">
							<input type="text" name="bookSearch" id="bookSearch" placeholder="찾는 도서명 입력"/>
						</p>
						<p class="search-btn">
							<button>
								<img src="/asset/images/search.png" alt="검색버튼 이미지"/>
							</button>
						</p>
					</fieldset>
				</form>
			</div>
			<!-- search box ends -->
			<!-- title-bar-con-menu -->
            <div class="title-icon-wrapper">
                <i class="fa cart dropdown" onClick="location.href='/payment/cart/'"></i>
                <span class="icon-cnt cart-cnt" id="cart_number">5</span>
                <i class="fa heart dropdown" onClick="location.href='/payment/wish/'"></i>
                <span class="icon-cnt heart-cnt" id="wish_number">2</span>
                <!-- login btn start -->
                <i class="far fa-user dropdown"></i>
                <div class="user-content">
                    <ul>
                        <li><a href="/mypage/online/" class="user-btn">마이페이지</a></li>
                        <li><a href="/payment/cart/" class="user-btn">장바구니</a></li>
                        <li><a href="/mypage/wish/" class="user-btn">찜목록</a></li>
                        <li><a href="#" class="user-btn" id="login-bt" onClick="checkLogin(this)">로그인</a></li>
                    </ul>   
                </div>
                <!-- login btn end -->
            </div>
            <!-- title-bar-con-menu-end -->
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
                <div class="menu-item" onclick="location.href='#'">도서 검색</div>
				<div class="menu-item" onclick="location.href='#'">평가/리뷰 게시판</div>
				<div class="menu-item" onclick="location.href='#'">인기도서 목록</div>
				<div class="menu-item" onclick="location.href='#'">MyPage</div>
				<div class="menu-item" onclick="location.href='#'">고객센터</div>
            </nav>
        </div>
        <!-- Main menu end -->
    </header>
    <!-- hedaer end -->
    <div class="visual_wrap">
    <!-- Carousel start -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <!-- carousel에 image를 추가하시려면 아래 url('')에 추가하면됩니다. 문구는 지우시고 사용하시고 문구 필요하시면 말해주세용~-->
                <div class="swiper-slide carousel-slide" style="background-image:url('./asset/images/mainVisual/mainvisual04.jpg');"></div>
                <div class="swiper-slide carousel-slide" style="background-image:url('./asset/images/mainVisual/mainvisual05.jpg');"></div>
                <div class="swiper-slide carousel-slide" style="background-image:url('./asset/images/mainVisual/mainvisual06.jpg');"></div>
                <div class="swiper-slide carousel-slide" style="background-image:url('./asset/images/mainVisual/mainvisual07.jpg');"></div>
            </div>
            <div class="title_wrap">
                <div class="wrap">
                    <div class="visual_title">
                        <span>책에서 발견한 한 대목.</span><br>
                              여러분의 인생 구절은 무엇인가요?<br>
                       	민쌤의 서재에서 공유해보세요.
                    </div>
                </div>
            </div>
            <!-- Arrows start -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <!-- Arrows end -->
        </div>
        <!-- Carousel end -->
    </div><!--visual_wrap-->
    <!-- notice section start -->
    <div class="notice-section">
        <div class="wrap cl">
            <div class="notice-wrapper cl">
                <div class="notice-type"><i class="fas fa-exclamation-triangle"></i> <span>공지사항</span></div>
                <div class="notice-title">드론 개발자 2개월 과정 5월 23일 오픈</div>
            </div>
            <div class="notice-wrapper cl">
                <div class="notice-type"><i class="fab fa-blogger-b"></i> <span>IT블로그</span></div>
                <div class="notice-title">블럭체인기술이 과연 세상을 바꿀까? 블럭체인기술이 과연 세상을 바꿀까?</div> 
            </div>
        </div>
    </div>
    <!-- notice section end -->

    <!-- course start-->
    <div class="courses-section">
       <div class="wrap">
            <!-- 강좌 상품 begin -->
            <!-- 강좌상품 end -->            
        </div>
    </div>
    <!-- course end-->

    <!-- footer start -->
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