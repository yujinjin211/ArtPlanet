<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아트플래닛</title>
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

                <div class="top-menu">
                    <a href="login.jsp">로그인</a>
                </div>
                <div class="top-menu">
                    <a href="normar-mypage.jsp">마이페이지</a>
                </div>
                <div class="top-menu">
                    <a href="manager-mypage.jsp">마이페이지</a>
                </div>
                <div class="top-menu">
                	<a href="logout.jsp">로그아웃</a>
                </div>
                <div class="top-menu">
                    <a><b></b>님</a>
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

    <div class="wide-content">
        <!-- 가로 1920 image -->
        <div class="wide-img1920">
            <img src="resource/images/wide-content-1920x500.jpg">
        </div>
        <div class="text-box">
            <a style="display: block; color: white; font-size: 72px; font-weight: bold;">NEWS</a>
            <a style="color: white">전문가의 글을 읽어보세요.</a><br>
            <a style="color: white">전시회 소식을 확인하세요.</a>
        </div>
    </div>

    <div class="div-style" style="padding-top: 30px; padding-bottom: 30px;">
        <div class="wrapper">
            <div class="news-div">
                <a style="float: left; padding-top: 5px; font-size: 28px; font-weight: bold;">큐레이터 Pick</a>
                <p class="#p-style" style="text-align: right;"><a href="#">더보기</a></p>
                <hr>
                <div class="news-div">
                    <ul>
                        <li>
                            <a href="#">큐레이터 Pick 1</a>                        
                        </li>
                        <li>
                            <a href="#">큐레이터 Pick 2</a>                        
                        </li>
                        <li>
                            <a href="#">큐레이터 Pick 3</a>                        
                        </li>
                        <li>
                            <a href="#">큐레이터 Pick 4</a>                        
                        </li>
                        <li>
                            <a href="#">큐레이터 Pick 5</a>                        
                        </li>
                        <li>
                            <a href="#">큐레이터 Pick 6</a>                        
                        </li>
                        <li>
                            <a href="#">큐레이터 Pick 7</a>                        
                        </li>
                    </ul>
                </div>
            </div>
            <div class="news-div">
                <a style="float: left; padding-top: 5px; font-size: 28px; font-weight: bold;">소식</a>
                <p style="text-align: right;"><a href="#">더보기</a></p>
                <hr>
                <div class="news-div">
                    <ul>
                        <li>
                            <a href="#">소식 1</a>                        
                        </li>
                        <li>
                            <a href="#">소식 2</a>                        
                        </li>
                        <li>
                            <a href="#">소식 3</a>                        
                        </li>
                        <li>
                            <a href="#">소식 4</a>                        
                        </li>
                        <li>
                            <a href="#">소식 5</a>                        
                        </li>
                    </ul>
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
</body>
</html>