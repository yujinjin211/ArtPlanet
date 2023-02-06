<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <div class="main-container">
        <div class="div-style">
            <a style="font-size: 48px; font-weight: bold;">트렌드 전시 찾기</a>
            <hr style="border: solid 6px; width: 1440px; margin-bottom: 20px;">
        </div>

        <div style="position: relative; width: 1440px; height: 1000px; margin: 0 auto;">
            
            <div class="area" style="display: block; width: 820px; float: left;">워드 클라우드</div>

            <div style="display: block; width: 560px; float: right;">
                <div class="card-row">
                    <img src="resource/images/non300-1.jpg">
                    <div class="wrapper-container">
                        <a id="wc-a">
                            <i class="fa-regular fa-heart" style="font-size: x-large;"></i>
                        </a>
                        <h3><b>전시이름</b></h3>
                        <p><a>지역</a></p>
                        <p><a>주제</a></p>
                        <p><a>요금</a></p>
                        <p><a>전시장소명</a></p>
                        <p><a>2022/01/01 ~ 2022/12/31</a></p>
                        <button class="chBtn">다녀왔어요.</button>
                      </div>
                </div>

                <div class="card-row">
                    <img src="resource/images/non300-2.jpg">
                    <div class="wrapper-container">
                        <a id="wc-a">
                            <i class="fa-regular fa-heart" style="font-size: x-large;"></i>
                        </a>
                        <h3><b>전시이름</b></h3>
                        <a>지역</a> /
                        <a>주제</a> /
                        <a>요금</a>
                        <p><a>전시장소명</a></p>
                        <p><a>2022/01/01 ~ 2022/12/31</a></p>
                        <button class="chBtn">다녀왔어요.</button>
                      </div>
                </div>
            </div>
        </div>
    </div>

        <!-- 페이지 -->
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a class="active" href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">&raquo;</a>
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