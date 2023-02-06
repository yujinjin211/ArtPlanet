<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</head>
<body>
    <header>
        <div>
            <a class="logo-text" href="index.jsp">A.Pla</a>
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
                    <a href="normar-mypage.jsp">마이페이지</a>
                </div>
                -->
                <div class="top-menu">
                    <a href="#">
                        <i class="fa fa-cart-shopping" alt="장바구니"></i>
                    </a>
                </div>
                <div class="top-menu">
                    <a href="login">로그인</a>
                </div>
            </div>

            <ul>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn">전시</a>
                    <div class="dropdown-content">
                        <a href="trend-exhibition.jsp">트렌드 전시 찾기</a>
                        <a href="region-exhibition.jsp">지역별 전시 찾기</a>
                        <a href="theme-exhibition.jsp">주제별 전시 찾기</a>
                        <a href="location-exhibition.jsp">현재 위치에서 전시 찾기</a>
                    </div>
                </li>

                <li>
                    <a href="preference-search.jsp">내 취향 전시 찾기</a>
                </li>

                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn">소식·참여</a>
                    <div class="dropdown-content">
                        <a href="news.jsp">뉴스레터</a>
                        <a href="review.jsp">리뷰</a>
                    </div>
                </li>

                <li>
                <a href="art-shop.jsp">아트샵</a>
                </li>
            </ul>
        </div>
    </header>

    <div class="main-container">
        <div class="round-div" style="width: 40%; margin: auto; padding: 50px; text-align: center;">
            <a class="logo-text" style="float: none; font-size: 128px;">A.Pla</a>
            <h1 style="text-align: center; padding-bottom: 20px;">아트플래닛 회원가입이 완료되었습니다.</h1>
            <a><p>ID : ${user.name}님</p></a>
            <a href="user/login">
                <button style="width: 200px; border-radius: 8px; border-style: none; padding: 10px; background-color: #444; color: white;">
                    로그인
                </button>
            </a>
            <a href="/index">
                <button style="width: 200px; border-radius: 8px; border-style: none; padding: 10px; background-color: #444; color: white;">
                    메인 홈
                </button>
            </a>
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

    
</body>
</html>