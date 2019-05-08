<%@page import="com.books.apitest.PopularBookTest"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<PopularBookTest> popBookList = (List)request.getAttribute("apiSearchResult");
	System.out.println(popBookList.size());
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<title>Popular books searched by api</title>
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
	<!-- popBook list start -->
	<div class="wrap main">        
        <!-- course start-->
        <div class="popular-section">
           <div class="wrap">
                <%PopularBookTest popBook = new PopularBookTest(); %>
                <%for(int i=0;i<popBookList.size();i++){ %>
                <%popBook = popBookList.get(i); %>
                <!-- popBook unit start -->
                <div class="popular-wrapper">
                    <a href="#none" title="자세히 보기" style="background-image:url('<%=popBook.getBookImageURL()%>');">도서 이미지</a>
                    <div class="popular-info-box">
                        <div class="popular-info-wrapper">
                            <span><%=popBook.getRanking() %>위</span>
                            <span class="ellipsis"><%=popBook.getBookname() %></span>
                            <span>대출건수 : <%=popBook.getLoan_count() %></span>
                        </div>
                        <!-- 
                        <div class="course-price-wrapper">
                            <span class="course-discount">￦420,000 원</span>
                        </div>
						 -->
                    </div>
                    <!-- 
                    <span class="like"><i class="far fa-heart" onClick="putWish(1 ,100)"></i></span>
                	 -->
                </div>
                
                <!-- popBook unit start -->
                 <%} %>
                <!--페이징
                <div class="page cl">
                    <a href="#">prev</a>
                    <a href="#" class="cnt">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">···</a>
                    <a href="#">next</a>
                </div>
                -->
            </div>
        </div>
        <!-- course end-->
	</div>
	<!-- popBook list end -->
	<!-- footer start -->
    <%@ include file="/include/footer.jsp" %>
    <!-- footer end -->
</body>
</html>
