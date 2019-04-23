<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp" %>
<title>minSsam's Library main</title>
</head>
<!-- head end -->
<body>
    <!-- header start -->
	<%@include file="/include/header.jsp" %>
    <!-- hedaer end -->
    <div class="visual_wrap">
    <!-- sliding window start -->
        <div class="slideWrap">
            <ul class="slideScreen">
                <li class="slideFilm"><img src="/asset/images/mainVisual/visual01.jpg" alt="sliding image0" class="film0"/></li>
                <li class="slideFilm"><img src="/asset/images/mainVisual/visual02.jpg" alt="sliding image1" class="film1"/></li>
                <li class="slideFilm"><img src="/asset/images/mainVisual/visual03.jpg" alt="sliding image2" class="film2"/></li>
                <li class="slideFilm"><img src="/asset/images/mainVisual/visual04.jpg" alt="sliding image3" class="film3"/></li>
            </ul>
            <div class="titleWrap">
                <div class="wrap">
                    <div class="visualTitle">
                        <span>책에서 발견한 한 대목.</span><br>
                              여러분의 인생 구절은 무엇인가요?<br>
                       	 민쌤의 서재에서 공유해보세요.
                    </div>
                </div>
            </div>
            <!-- Arrows start -->
            <div id="btn1">
				<p class="prevBtn"><img src="/asset/images/prevBtn.png" alt="이전버튼" class="prev"/></p>
				<p class="nextBtn"><img src="/asset/images/nextBtn.png" alt="다음버튼" class="next"/></p>
			</div>
            <!-- Arrows end -->
            <!-- dot btn start -->
			<div id="btn2">
				<ul>
					<li><a href="#btn0" title="btn0"><span>0</span></a></li>
					<li><a href="#btn1" title="btn1"><span>1</span></a></li>
					<li><a href="#btn2" title="btn2"><span>2</span></a></li>
					<li><a href="#btn3" title="btn3"><span>3</span></a></li>
				</ul>
			</div>
            <!-- dot btn end -->
        </div>
        <!-- sliding window end -->
    </div>
    <!--visual_wrap-->
    <!-- notice section start -->
    <div class="notice-section">
        <div class="wrap cl">
            <div class="notice-wrapper cl">
                <div class="notice-type"><i class="fas fa-exclamation-triangle"></i> <span>공지사항</span></div>
                <div class="notice-title">자바 기반 웹 개발자 6개월 과정 5월 13일 종료</div>
            </div>
            <div class="notice-wrapper cl">
                <div class="notice-type"><i class="fab fa-blogger-b"></i> <span>IT블로그</span></div>
                <div class="notice-title">블럭체인기술이 과연 세상을 바꿀까?</div> 
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
    <%@ include file="/include/footer.jsp" %>
    <!-- footer end -->
</body>
</html>