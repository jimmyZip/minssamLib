<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<title>Book Detail Info</title>
</head>
<body>
    <!-- header start -->
	<%@include file="/include/header.jsp" %>
	<!-- header end -->
	<div class="bg bg_popular">
	    <div class="wrap">
	        <span class="red">Introducing Popular and Steady Books</span>
	        <h2>인기도서목록</h2>
	    </div>
	</div>
	<!-- notice section start -->
	<div class="notice-section">
		<div class="wrap cl">
			<div class="notice-wrapper cl">
				<div class="notice-type">
					<i class="fas fa-exclamation-triangle"></i> <span>인기도서</span>
				</div>
				<div class="notice-title">설정된 조건으로 검색된 인기도서를 소개합니다.</div>
			</div>
			<div class="notice-wrapper cl">
				<div class="notice-type">
					<i class="fab fa-blogger-b"></i> <span>기본조건</span>
				</div>
				<div class="notice-title">서울지역 인기대출도서 top 30</div>
			</div>
		</div>
	</div>
	<!-- notice section end -->
	<!-- online list start -->
	<div class="wrap main">        
        <!-- course start-->
        <div class="courses-section">
           <div class="wrap">
                
                
                <div class="course-wrapper">
                    <a href="/online/1" title="자세히 보기" style="background-image:url('/upload/1547218972925.jpg');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">Java 스탠다드 프로그래밍</span>
                            <span>46강 600시간</span>
                            <span>초, 중급자</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦420,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(1 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/2" title="자세히 보기" style="background-image:url('/upload/1547219128527.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">Ajax 비동기 프로그래밍</span>
                            <span>24강 300시간</span>
                            <span>초, 중급자</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦170,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(2 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/3" title="자세히 보기" style="background-image:url('/upload/1547219246579.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">안드로이드</span>
                            <span>67강 800시간</span>
                            <span>중, 고급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦490,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(3 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/4" title="자세히 보기" style="background-image:url('/upload/1547219368678.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">Angular JS</span>
                            <span>37강 600시간</span>
                            <span>총, 중급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦380,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(4 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/5" title="자세히 보기" style="background-image:url('/upload/1547219507752.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">블록체인 프로그래밍</span>
                            <span>60강 590시간</span>
                            <span>중, 고급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦790,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(5 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/6" title="자세히 보기" style="background-image:url('/upload/1547219596235.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">C /C++ 프로그래밍</span>
                            <span>70강 680시간</span>
                            <span>초, 중급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦320,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(6 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/7" title="자세히 보기" style="background-image:url('/upload/1547219697613.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">C# 프로그래밍</span>
                            <span>80강 760시간</span>
                            <span>초, 중급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦420,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(7 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/8" title="자세히 보기" style="background-image:url('/upload/1547219817040.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">HTML5 Canvas 프로그래밍</span>
                            <span>40강 350시간</span>
                            <span>초, 중급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦240,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(8 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/9" title="자세히 보기" style="background-image:url('/upload/1547219968779.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">HTML5  기반 퍼블리싱</span>
                            <span>50강 450시간</span>
                            <span>초,중급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦180,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(9 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/10" title="자세히 보기" style="background-image:url('/upload/1547220081989.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">IOT 프로그래밍</span>
                            <span>56강 500시간</span>
                            <span>종, 고급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦500,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(10 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/11" title="자세히 보기" style="background-image:url('/upload/1547220185828.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">자바스크립트 기본</span>
                            <span>58강 500시간</span>
                            <span>초, 중급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦370,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(11 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/12" title="자세히 보기" style="background-image:url('/upload/1547220307962.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">JQuery</span>
                            <span>40강 320시간</span>
                            <span>조, 중급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦240,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(12 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/13" title="자세히 보기" style="background-image:url('/upload/1547220404177.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">JSP/Servlet</span>
                            <span>48강 450시간</span>
                            <span>중,고급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦360,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(13 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/14" title="자세히 보기" style="background-image:url('/upload/1547220504874.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">리눅스 서버 실전 배우기</span>
                            <span>67강 580시간</span>
                            <span>초, 중급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦350,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(14 ,100)"></i></span>
                </div>
                
                
                <div class="course-wrapper">
                    <a href="/online/15" title="자세히 보기" style="background-image:url('/upload/1547220661671.png');">코스 이미지</a>
                    <div class="course-info-box">
                        <div class="course-info-wrapper">
                            <span class="ellipsis">파이선 프로그래밍</span>
                            <span>58강 520시간</span>
                            <span>초 , 중급</span>
                        </div>
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦340,000 원</span>
                        </div>

                    </div>
                    <span class="like"><i class="far fa-heart" onClick="putWish(15 ,100)"></i></span>
                </div>
                
                <!--페이징-->
                <div class="page cl">
                    <a href="#">prev</a>
                    <a href="#" class="cnt">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">···</a>
                    <a href="#">next</a>
                </div>
            </div>
        </div>
        <!-- course end-->
	</div>
	<!-- online list end -->

	<!-- footer start -->
	
    <div class="footer-wrapper">
        <dl class="wrap cl">
            <dt>회사명</dt>
            <dd>솔루비전</dd>
            <dt>대표자</dt>
            <dd>민진호</dd>
            <dt>TEL</dt>
            <dd>070-1588-9055</dd>            
            <dt>EMAIL</dt>            
            <dd class="bd0">itedu@minssam.com</dd>
            <dt>사업장 소재지</dt>
            <dd class="bd0">경기도 고양시 덕양구 화신로 260번길 37 203(화정동, 진솔 그린프라자)</dd>
            <dt>사업자등록번호</dt>
            <dd class="bd0">128-30-77240</dd>
<!--
            <dt>통신판매업</dt>
            <dd>2011-서울마포-01955</dd>
-->
            <dt class="sound_only">저작권</dt>
            <dd class="bd0">COPYRIGHT &copy; SOLUVISION. ALL RIGHTS RESERVED</dd>  
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
