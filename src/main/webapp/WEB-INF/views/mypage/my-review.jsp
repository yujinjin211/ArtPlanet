<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
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

    <div style="width: 1440px; margin: auto; height: 1000px; padding-top: 60px;">
        <div class="sidebar" style="float: left; width: 200px;">
            <a class="active accordion">관심 목록</a>
                <div class="panel">
                    <a href="exhibition-list.jsp">관심 전시 목록</a>
                    <a href="exhibition-place-list.jsp">관심 전시 장소 목록</a>
                </div>
            <a href="visit-exhibition.jsp">다녀온 전시 목록</a>
            <a class="active accordion" href="#">나의 리뷰</a>
                <div class="panel">
                    <a href="my-review.html">작성 가능한 리뷰</a>
                    <a href="my-write-review.html">작성한 리뷰</a>
                </div>
            <a class="active accordion">마이 아트샵</a>
                <div class="panel">
                    <a href="#">주문 내역</a>
                    <a href="#">상품 후기</a>
                </div>
            <a href="editProfile-pwCheck.jsp">개인정보 수정</a>
          
        </div>
    
        <div class="content" >
            <a style="font-size: 48px; font-weight: bold;">작성 가능한 리뷰</a>
            <hr style="overflow: hidden; border: solid 5px black;">
        </div>

        <div class="content">
            <div class="content-box" style="display: flex;">
                <ul style="width: 80%;">
                    <li><a>전시이름</a></li>
                    <li><a>작성일시</a></li>
                </ul>
                <div class="vertical-box">
                    <input type="button" class="btn-style" value="수정">
                    <input type="button" class="btn-style" value="삭제">
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