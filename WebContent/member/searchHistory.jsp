<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 내역</title>
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
	        <h2 class="red">최근 검색내역</h2> <!-- common.css .red 밑에 .white 추가해서 변경했음 -->
	    </div>
    </div>
     <div class="wrap main cl mypage">
     <%@include file="/include/side.jsp" %>
	   <!--category-section-->
	   
        <div class="list-section payment-section">
	       <h2>결제 내역</h2>
	       <div class="payment-content">
	           <a href="/mypage/payment/1" title="자세히 보기" style="background-image:url('/upload/06426567.jpg');"><div class="payment-list">
                        <span class="ellipsis"><strong>Java 스탠다드 프로그래밍</strong></span>
                        <span class="fl linebar">검색날짜</span>
                        <span class="fl">줄거리</span>
                   </div>
               </a>
	       </div>
	       
	    </div>
	    <!-- payment list end -->
    </div>

<%@include file="/include/footer.jsp" %>

</body>
</html>