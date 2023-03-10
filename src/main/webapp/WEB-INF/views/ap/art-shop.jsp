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
                    <a href="normar-mypage.jsp">마이페이지</a>
                </div>
                <div class="top-menu">
                    <a href="login.jsp">로그인</a>
                </div>
                <div class="top-menu">
                    <a href="#">
                        <i class="fa fa-cart-shopping" alt="장바구니"></i>
                    </a>
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
    
    <!-- 여기서부터 body -->
        <div class="main-content" style="height: 2000px;">
            <div class="sidebar">
                <a class="active accordion">카테고리</a>
                    <div style="text-align: left;">
                        <a href="#">카테고리1</a>
                        <a href="#">카테고리2</a>
                    </div>
            </div>
        
            <!-- 마이페이지 기본화면 상단-프로필 영역 -->
            
            <div class="content">
                <div style="text-align: center;">
                    <a style="font-size: 48px; font-weight: bold;">Best</a>
                    <a><p>Top3</p></a>
                </div>
                
                <div class="pdt-wrap">
                    <ul>
                        <li>
                            <a href="#"><img src="resource/images/item-300x300.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-300x300.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-300x300.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                    </ul>
                </div>
                <hr style="overflow: hidden; border: solid 5px black;">
            </div>
    
            <div class="content" >
                <div class="pdt-wrap">
                    <ul>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                        <li>
                            <a href="#"><img src="resource/images/item-240x240.jpg">
                            <p style="font-size: small;">상품명</p></a>
                            <p style="font-size: small;">가격</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    <!-- 여기까지 body -->

    

    
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