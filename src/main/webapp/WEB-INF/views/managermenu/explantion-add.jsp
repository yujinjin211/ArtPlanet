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

    <!--  -->

    <div style="width: 1440px; margin: auto; height: 1000px; padding-top: 60px;">
        <div class="sidebar" style="float: left; width: 200px;">
            <a class="active accordion">전시 관리</a>
                <div class="panel">
                    <a href="exhibition-add.jsp">전시회 등록</a>
                    <a href="add-explantion.jsp">전시 작품 해설 등록</a>
                    <a href="certification.jsp">인증 관리</a>
                    <a href="#">전시 내역 관리</a>
                </div>
            <a href="#">아트샵 관리</a>
            <a href="#">개인정보 수정</a>
          
        </div>
    
        <div class="content" style="float: left; width: 1200px; margin: 0px;">
            <div style="width: max-content; margin: auto;">
                <img src="resource/images/process02.jpg">
            </div>
            <div>
                <h1>작품 해설 등록</h1>
                <hr>
            </div>

            <div>

                <form>
                    <a>운영 중인 전시 선택</a><br>
                    <select>
                        <option>전시1</option>
                    </select>
                </form>
                <hr>

                <div style="width: 100; text-align: right;">
                    <button style="border-style: none; background-color: white;"><p style="font-size: 30px;">+</p></button>
                </div>

                <button class="accordion" style="width: 100%;">주제1</button>
                <div class="panel">
                    <form name="" method="post" action="#">
                        <table>
                            <tr>
                                <td>작품 이름</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>종류</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>크기</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>제작연도</td>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <td>문자 해설</td>
                                <td>
                                    <textarea cols="100" rows="10" placeholder="내용을 입력해주세요."></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>오디오 해설</td>
                                <td><input type="file"></td>
                            </tr>
                        </table>
    
                        <div style="text-align: right;">
                            <input type="submit" value="등록">
                        </div>
                        
                    </form>
                </div>

                
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