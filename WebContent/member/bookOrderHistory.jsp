<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역</title>
<%@include file="/include/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
</head>
<body>
    
<script>

</script>

        <div class="title-bar wrap cl">
            <div class="menu-btn">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </div>
        </div>
        <div id="wrapper"></div>

        <%@ include file="/include/header.jsp" %>

    
     <div class="bg_basic lecture-cart-header">
	    <div class="wrap">
	        <h2 class="red">결제 내역</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
	    </div>
    </div>
     <div class="wrap main cl mypage">
     <%@include file="/include/side.jsp"%>
	   <!--category-section-->
	   
        <div class="list-section payment-section">
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