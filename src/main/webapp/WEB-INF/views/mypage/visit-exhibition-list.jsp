<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/resource/css/calendar-style.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <header>
        <div>
            <a class="logo-text" href="../index">A.Pla</a>
            <div>
                <div class="topnav">
                    <div class="search-container">
                    <form action="/action_page.php">
                        <input type="text" placeholder="검색" name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                    </div>
                </div>

                <c:if test="${user == null }">
                <div class="top-menu">
                    <a href="../user/login">로그인</a>
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
                        <a href="../exhibition/trend-exhibition">트렌드 전시 찾기</a>
                        <a href="../exhibition/region-exhibition">지역별 전시 찾기</a>
                        <a href="../exhibition/theme-exhibition">주제별 전시 찾기</a>
                        <a href="../exhibition/location-exhibition">현재 위치에서 전시 찾기</a>
                    </div>
                </li>

                <li>
                    <a href="preference-search.jsp">내 취향 전시 찾기</a>
                </li>

                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn">소식·참여</a>
                    <div class="dropdown-content">
                        <a href="../review/news">뉴스레터</a>
                        <a href="../review/review">리뷰</a>
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

    <!-- 사이드바 -->
    
    <div class="main-content" style="height: 1500px;">
        <div class="sidebar" style="float: left; width: 200px;">
            <a class="active accordion">관심 목록</a>
                <div class="panel">
                    <a href="../mypage/like-exhibition-list">관심 전시 목록</a>
                    <a href="exhibition-place-list.jsp">관심 전시 장소 목록</a>
                </div>
            <a href="../mypage/visit-exhibition-list">다녀온 전시 목록</a>
            <a href="#">나의 리뷰</a>
            <!--  
            <a class="active accordion">마이 아트샵</a>
                <div class="panel">
                    <a href="#">주문 내역</a>
                    <a href="#">상품 후기</a>
                </div>
            -->
            <a href="../user/userConfirm">개인정보 수정</a>
        </div>
    
        <!-- 본문 상단 -->
        
        <div class="content">
            <a style="font-size: 48px; font-weight: bold;">다녀온 전시</a>
            <hr style="overflow: hidden; border: solid 5px black;">
        </div>

        <!-- 캘린더 -->
        <div class="content" style="padding-top: 50px; padding-bottom: 50px;">
            <div class="sec_cal">
                <div class="cal_nav">
                  <a href="javascript:;" class="nav-btn go-prev">prev</a>
                  <div class="year-month"></div>
                  <a href="javascript:;" class="nav-btn go-next">next</a>
                </div>
                <div class="cal_wrap">
                  <div class="days">
                    <div class="day">월</div>
                    <div class="day">화</div>
                    <div class="day">수</div>
                    <div class="day">목</div>
                    <div class="day">금</div>
                    <div class="day">토</div>
                    <div class="day">일</div>
                  </div>
                  <div class="dates"></div>
                </div>
            </div>
        </div>
        
        <!-- 캘린더에서 날짜를 클릭하면 나올 내용 -->
        
        <div class="content">
            <div style="padding: 20px; display: flex;">
                <img src="/resource/images/non300-1.jpg">
                <div style="padding-left: 30px;">
                    <a id="wc-a">
                        <i class="fa-regular fa-heart" style="font-size: x-large;"></i>
                    </a>
                    <h3><b>전시이름</b></h3>
                    <p><a>지역</a></p>
                    <p><a>주제</a></p>
                    <p><a>요금</a></p>
                    <p><a>전시장소명</a></p>
                    <p><a>2022/01/01 ~ 2022/12/31</a></p>
                </div>   
            </div>

            <div style="padding: 20px; display: flex;">
                <img src="/resource/images/non300-1.jpg">
                <div style="padding-left: 30px;">
                    <a id="wc-a">
                        <i class="fa-regular fa-heart" style="font-size: x-large;"></i>
                    </a>
                    <h3><b>전시이름</b></h3>
                    <p><a>지역</a></p>
                    <p><a>주제</a></p>
                    <p><a>요금</a></p>
                    <p><a>전시장소명</a></p>
                    <p><a>2022/01/01 ~ 2022/12/31</a></p>
                </div>   
            </div>
        </div>
    </div>
    
    <footer class="footer-area">
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
    </footer>

    <script src="/resource/js/calendar.js"></script>
    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
            panel.style.maxHeight = null;
            } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
            } 
        });
        }
    </script>
</body>
</html>