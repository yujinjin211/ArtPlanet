<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아트플래닛</title>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resource/images/favicon.ico'/>" />
    <link rel="icon" type="image/x-icon"  href="/resource/images/favicon.ico"/>
    <link rel="stylesheet" href="/resource/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <header>
        <div>
            <a class="logo-text" href="/index">A.Pla</a>
            <div>
                <div class="topnav">
                    <div class="search-container">
                    <form action="/action_page.php">
                        <input type="text" placeholder="검색" name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                    </div>
                </div>
                <!--  
                <div class="top-menu">
                    <a href="#">
                        <i class="fa fa-cart-shopping" alt="장바구니"></i>
                    </a>
                </div>
                -->
                <c:if test="${user == null }">
                <div class="top-menu">
                    <a href="user/login">로그인</a>
                </div>
                </c:if>
                
                <c:if test="${user != null }">
                <c:if test="${user.userType eq 'normar'}">
                <div class="top-menu">
                    <a href="../user/normar-mypage">마이페이지</a>
                </div>
                </c:if>
                <c:if test="${user.userType eq 'manager'}">
                <div class="top-menu">
                    <a href="../user/manager-mypage">마이페이지</a>
                </div>
                </c:if>
                <div class="top-menu">
                	<a href="../user/logout">로그아웃</a>
                </div>
                <div class="top-menu">
                    <a><b></b>${user.nickName}님</a>
                </div>
                </c:if>
            </div>

            <ul>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn">전시</a>
                    <div class="dropdown-content">
                        <a href="exhibition/trend-exhibition.jsp">트렌드 전시 찾기</a>
                        <a href="exhibition/region-exhibition">지역별 전시 찾기</a>
                        <a href="exhibition/theme-exhibition">주제별 전시 찾기</a>
                        <a href="exhibition/location-exhibition.jsp">현재 위치에서 전시 찾기</a>
                    </div>
                </li>

                <li>
                    <a href="preference-search.jsp">내 취향 전시 찾기</a>
                </li>

                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn">소식·참여</a>
                    <div class="dropdown-content">
                        <a href="review/news">뉴스레터</a>
                        <a href="review/review">리뷰</a>
                    </div>
                </li>
                <!--  
                <li>
                <a href="art-shop.jsp">아트샵</a>
                </li>
                -->
            </ul>
        </div>
    </header>

    <div class="container">
        <div class="main-container">
            <div class="slideshow-container">

				<c:forEach var="main" items="${mainList }">
	                <div class="mySlides fade">
	                <a href="exhibition/exhibition-detail?exhibition_no=${main.exhibition_no }">
	                <img src="/MainImage?fileName=${main.uuid }-${main.fileName }" style="width:100%">
	                </a>
	                </div>
                </c:forEach>
                
                <a class="prev" onclick="plusSlides(-1)">❮</a>
                <a class="next" onclick="plusSlides(1)">❯</a>
                
            </div>
                <br>
                <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span> 
                <span class="dot" onclick="currentSlide(2)"></span> 
                <span class="dot" onclick="currentSlide(3)"></span> 
                </div>

            <div style="width: 1440px; margin: auto;">
                <a style="font-size: 48px; font-weight: bold;">최신 전시</a>
                <hr style="border: solid 6px; width: 1440px; margin-bottom: 20px;">
            </div>

            <div class="wrapper" style="padding-top: 25px;">
            
                <c:forEach var="exhibition" items="${exhibitionList}">
                <div class="card">
                    <a href="exhibition/exhibition-detail?exhibition_no=${exhibition.exhibition.exhibition_no }">
                        <img src="/ThumbnailDisplay?fileName=${exhibition.thumbnail.uuid}-${exhibition.thumbnail.fileName}">
                    
                        <div class="wrapper-container">
                            <p><a href="exhibition/exhibition-detail?exhibition_no=${exhibition.exhibition.exhibition_no }" style="font-size: large; text-decoration-line: none; color: #444;"><b>${exhibition.exhibition.title }</b></a></p>
                            <a>${exhibition.place.sido }</a> /
                            <a>${exhibition.exhibition.realm }</a> /
                            <a>${exhibition.exhibition.price }</a>
                            <p><a>${exhibition.place.place }</a></p>
                            <p><a><fmt:formatDate pattern="YYYY-MM-dd" value="${exhibition.exhibition.startDate }"/> ~ <fmt:formatDate pattern="YYYY-MM-dd" value="${exhibition.exhibition.endDate }"/></a></p>
                        </div>
                    </a>
                </div>
                </c:forEach>
                
            </div>
        </div>
    </div>
    
    <footer>
        <div class="footer-area">
            <div>
                <ul>
                    <li>
                        <a href="#">개인정보 처리방침</a>
                    </li>
                    <li>
                        <a href="#">이용 약관</a>
                    </li>
                    <li>
                        <a href="#">고객센터</a>
                    </li>
                </ul>
            </div>
            <hr style="border-color: gray;">
            <div style="text-align: center; color: gray;"> ©2022 Yujin. All rights
                reserved.</div>
        </div>
    </footer>

    <script>
        /* slide */
        let slideIndex = 1;
        showSlides(slideIndex);
        
        function plusSlides(n) {
          showSlides(slideIndex += n);
        }
        
        function currentSlide(n) {
          showSlides(slideIndex = n);
        }
        
        function showSlides(n) {
          let i;
          let slides = document.getElementsByClassName("mySlides");
          let dots = document.getElementsByClassName("dot");
          if (n > slides.length) {slideIndex = 1}    
          if (n < 1) {slideIndex = slides.length}
          for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
          }
          for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex-1].style.display = "block";  
          dots[slideIndex-1].className += " active";
        }   
    </script>
</body>
</html>