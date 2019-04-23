<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	if (session.getAttribute("member") != null) {
		System.out.print("세션있음");
	} else {
		System.out.print("세션없음");
	}

%>
<!DOCTYPE html>
<html>
<!-- head start -->
<head>
<%@include file="/include/head.jsp"%>
<title>minSsam's Library main</title>
</head>
<!-- head end -->
<body>
	<!-- header start -->
	<%@include file="/include/header.jsp"%>
	<!-- hedaer end -->
	<div class="visual_wrap">
		<!-- sliding window start -->
		<div class="screen">
			<ul class="film">
				<li class="scene"><img
					src="/asset/images/mainVisual/visual01.jpg" alt="sliding image0"
					class="film0" /></li>
				<li class="scene"><img
					src="/asset/images/mainVisual/visual02.jpg" alt="sliding image1"
					class="film1" /></li>
				<li class="scene"><img
					src="/asset/images/mainVisual/visual03.jpg" alt="sliding image2"
					class="film2" /></li>
				<li class="scene"><img
					src="/asset/images/mainVisual/visual04.jpg" alt="sliding image3"
					class="film3" /></li>
			</ul>
			<div class="titleWrap">
				<div class="wrap">
					<div class="visualTitle">
						<span>책에서 발견한 한 대목.</span><br> 여러분의 인생 구절은 무엇인가요?<br>
						민쌤의 서재에서 공유해보세요.
					</div>
				</div>
			</div>
			<!-- Arrows start -->
			<div id="btn1">
				<p class="prevBtn">
					<img src="/asset/images/prevBtn.png" alt="이전버튼" class="prev" />
				</p>
				<p class="nextBtn">
					<img src="/asset/images/nextBtn.png" alt="다음버튼" class="next" />
				</p>
			</div>
			<!-- Arrows end -->
			<!-- dot btn start -->
			<div id="btn2">
				<ul>
					<li class="addBtn"><a href="#btn0" title="btn0"><span>0</span></a></li>
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
				<div class="notice-type">
					<i class="fas fa-exclamation-triangle"></i> <span>공지사항</span>
				</div>
				<div class="notice-title">자바 기반 웹 개발자 6개월 과정 5월 13일 종료</div>
			</div>
			<div class="notice-wrapper cl">
				<div class="notice-type">
					<i class="fab fa-blogger-b"></i> <span>IT블로그</span>
				</div>
				<div class="notice-title">블럭체인기술이 과연 세상을 바꿀까?</div>
			</div>
		</div>
	</div>
	<!-- notice section end -->

	<!-- course start-->
	<div class="courses-section">
		<div class="wrap">
			<div class="section-title">
				<h2>이 달의 도서</h2>
			</div>
			<!-- 이 달의 도서 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="도서 자세히 보기"> 이 달의 도서 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">월급보다 내사업</span> <span>저자</span> <span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">여긴뭘적지</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 이 달의 도서 한 단위 -->
			<!-- 이 달의 도서 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="도서 자세히 보기"> 이 달의 도서 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">월급보다 내사업</span> <span>저자</span> <span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">여긴뭘적지</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 이 달의 도서 한 단위 -->
			<!-- 이 달의 도서 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="도서 자세히 보기"> 이 달의 도서 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">월급보다 내사업</span> <span>저자</span> <span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">여긴뭘적지</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 이 달의 도서 한 단위 -->
			<!-- 이 달의 도서 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="도서 자세히 보기"> 이 달의 도서 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">월급보다 내사업</span> <span>저자</span> <span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">여긴뭘적지</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 이 달의 도서 한 단위 -->
			<!-- 이 달의 도서 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="도서 자세히 보기"> 이 달의 도서 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">월급보다 내사업</span> <span>저자</span> <span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">여긴뭘적지</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 이 달의 도서 한 단위 -->
		</div>
	</div>
	<!-- course end-->
	<!-- course start-->
	<div class="courses-section">
		<div class="wrap">
			<div class="section-title">
				<h2>베스트 리뷰</h2>
			</div>
			<!-- 베스트 리뷰 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="리뷰 자세히 보기"> 베스트 리뷰 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">사업준비 하는데 큰 도움이 되었어요</span> <span>리뷰어</span>
						<span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">추천수</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 베스트 리뷰 한 단위 -->
			<!-- 베스트 리뷰 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="리뷰 자세히 보기"> 베스트 리뷰 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">사업준비 하는데 큰 도움이 되었어요</span> <span>리뷰어</span>
						<span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">추천수</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 베스트 리뷰 한 단위 -->
			<!-- 베스트 리뷰 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="리뷰 자세히 보기"> 베스트 리뷰 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">사업준비 하는데 큰 도움이 되었어요</span> <span>리뷰어</span>
						<span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">추천수</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 베스트 리뷰 한 단위 -->
			<!-- 베스트 리뷰 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="리뷰 자세히 보기"> 베스트 리뷰 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">사업준비 하는데 큰 도움이 되었어요</span> <span>리뷰어</span>
						<span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">추천수</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 베스트 리뷰 한 단위 -->
			<!-- 베스트 리뷰 한 단위 -->
			<div class="course-wrapper">
				<a href="#none" title="리뷰 자세히 보기"> 베스트 리뷰 이미지 </a>
				<div class="course-info-box">
					<div class="course-info-wrapper">
						<span class="ellipsis">사업준비 하는데 큰 도움이 되었어요</span> <span>리뷰어</span>
						<span>도서분야</span>
					</div>
					<div class="course-price-wraper">
						<span class="course-discount">추천수</span>
					</div>
				</div>
				<span class="like" id="2"> <i class="far fa-heart"
					onclick="checkWish(this,2)"></i>
				</span>
			</div>
			<!-- 베스트 리뷰 한 단위 -->
		</div>
	</div>
	<!-- course end-->
	<!-- announce start-->
	<div class="announce-area-wrap">
		<div class="announce-area">
			<div class="announce-wrap">
				<section class="best-reviewer-wrapper">
					<h3>이 달의 리뷰왕</h3>
					<!-- monthly champ reviewer -->
					<ul class="best-reviewer-inner">
						<li class="best-reviewer champ-reviewer">
							<p class="reviewer-img">
								<img src="/asset/images/crowns.png"/>
								<!-- <img class="default-profile-img" src="/asset/images/profile/girl.png" alt="reviewer img" /> -->
							</p>
							<p class="best-reviewer-info">
								<span class="reviewer-nick">리뷰어 닉네임</span> 
								<span class="reviewer-id">(리뷰어 아이디)</span>
							</p>
						</li>
					</ul>
					<!-- monthly champ reviewer -->
					<!-- ranke reviewer table -->
					<div class="best-reviewer-inner ranker-reviewer">
						<table>
							<tr class="table-head">
								<th class="col col1">순위</th>
								<th class="col col2">닉네임</th>
								<th class="col col3">아이디</th>
							</tr>
							<tr>
								<td class="col col1">2</td>
								<td class="col col2">도티브잡승</td>
								<td class="col col3">dos</td>
							</tr>
							<tr>
								<td class="col col1">3</td>
								<td class="col col2">팬파인애플</td>
								<td class="col col3">applepen</td>
							</tr>
						</table>
					</div>
					<!-- ranke reviewer table -->
				</section>
			</div>
			<div class="announce-wrap">
				<section class="recent-review-wrapper">
					<h3>최근 리뷰 내역</h3>
					<ul class="recent-review-inner">
						<li class="recent-review title-row">
							<p class="review-no">
								<span>No.</span>
							</p>
							<p class="review-title">
								<span class="ellipsis">리뷰제목</span>
							</p>
							<p class="reviewer-info">
								<span class="reviewer-id">(리뷰어 아이디)</span>
							</p>
						</li>
						<li class="recent-review">
							<p class="review-no">
								<span>No.</span>
							</p>
							<p class="review-title">
								<span class="ellipsis">세상에서 공부가 제일 쉬웠어요</span>
							</p>
							<p class="reviewer-info">
								<span class="reviewer-id">dos</span>
							</p>
						</li>
						<li class="recent-review">
							<p class="review-no">
								<span>No.</span>
							</p>
							<p class="review-title">
								<span class="ellipsis">리뷰제목</span>
							</p>
							<p class="reviewer-info">
								<span class="reviewer-id">(리뷰어 아이디)</span>
							</p>
						</li>
						<li class="recent-review">
							<p class="review-no">
								<span>No.</span>
							</p>
							<p class="review-title">
								<span class="ellipsis">리뷰제목</span>
							</p>
							<p class="reviewer-info">
								<span class="reviewer-id">(리뷰어 아이디)</span>
							</p>
						</li>
					</ul>
					<p class="more-btn">
						<a href="#none">리뷰 더 보기</a>
					</p>
				</section>
			</div>
		</div>
	</div>
	<!-- announce end-->
	<!-- footer start -->
	<%@ include file="/include/footer.jsp"%>
	<!-- footer end -->
</body>
</html>