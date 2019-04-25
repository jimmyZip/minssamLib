<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script>
// 검색 페이지로 이동
function search(){
	var data = $("#bookSearch").val();
	//alert(data);
	location.href = '/book/search/'+data;	
}

</script>
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
                  <input type="text" name="bookSearch" id="bookSearch" placeholder="찾는 도서명 입력" />
               </p>
               <p class="search-btn" onclick="search()">
					<button type="button">
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
         <span class="icon-cnt cart-cnt" id="cart_number">5</span> <i
            class="fa heart dropdown" onClick="location.href='/payment/wish/'"></i>
         <span class="icon-cnt heart-cnt" id="wish_number">2</span>
         <!-- login btn start -->
         <i class="far fa-user dropdown"></i>
         <div class="user-content">
            <ul>
               <li><a href="/member/mypage.jsp" class="user-btn">마이페이지</a></li>
               <li><a href="/payment/cart/" class="user-btn">장바구니</a></li>
               <li><a href="/mypage/wish/" class="user-btn">찜목록</a></li>
               <li><a href="#" class="user-btn" id="login-bt">로그인</a></li>
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
                  <span>로그인 해주세요.</span> <a href="#">로그인</a> <a href="#">회원가입</a>
               </div>
            </div>
            <ol class="regist2 cl">
               <li onclick="location.href='../order/cart.html'"><i
                  class="cart"></i>장바구니</li>
               <li onclick="location.href='../mypage/wish_list.html'"><i
                  class="heart"></i>위시리스트</li>
               <li><i class="user"></i>마이페이지</li>
            </ol>
         </div>
         <!-- nav menus -->
         <div class="menu-item"
            onclick="location.href='/books/bookSearchList.jsp'">도서 검색</div>
         <div class="menu-item"
            onclick="location.href='/review/reviewlist.jsp'">평가/리뷰
            게시판</div>
         <div class="menu-item" onclick="location.href='#'">인기도서 목록</div>
         <div class="menu-item" onclick="location.href='/member/mypage.jsp'">MyPage</div>
         <div class="menu-item" onclick="location.href='#'">고객센터</div>
         <!-- nav menus end-->
      </nav>
   </div>
   <!-- Main menu end -->
</header>
<!-- login modal -->
<div id="full"></div>
<div id="view"></div>