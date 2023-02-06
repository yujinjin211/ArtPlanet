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

    <div class="div-style" style="padding-top: 50px; padding-bottom: 20px;">
        <div style="float: left; width: 300px; display: grid; padding: 20px;">
            <img src="resource/images/non300-2.jpg" style="padding-bottom: 10px;">
            <div>
                <a><i class="fa-regular fa-bookmark" style="font-size: x-large;"></i></a>
                <a><i class="fa-solid fa-share-nodes" style="font-size: x-large;"></i></a>
            </div>
        </div>
        <div style="float: left; width: 300px; padding-left: 20px;">
            <table style="width: max-content;
            ">
                <tr aria-rowspan="2">
                    <td>
                        <p><a style="font-size: 36px; text-decoration-line: none; color: #444;"><b>중앙정보처리학원</b></a></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p><a>지역</a></p>
                    </td>
                    <td>
                        서울
                    </td>
                </tr>
                <tr>
                    <td>
                        <p><a>주소</a></p>
                    </td>
                    <td>
                        <p>서울특별시 마포구 신촌로 176</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p><a>전화번호</a></p>
                    </td>
                    <td>
                        <p>02-313-1711</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p><a>고객센터 운영시간</a></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p><a>오시는 길</a></p>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="div-style">
        <hr style="border: solid 6px; width: 1440px; margin-bottom: 20px;">
        <a style="font-size: 50px;">"</a>
        <a>중앙정보기술인재개발원, 중앙정보처리학원은 1969년에 설립되어 약 200만여명의 교육생을 배출하였으며 1만 5000여개의 기업 교육을위탁운영하며 대한민국을 IT강국으로 이끌어온 국내 최초, 최고의 IT 교육기관입니다.
            현재 한국상용SW협회와 협력하여 약 6개월의 취업 훈련을 마친 수료생들을 200여개의 국내 SW개발사에 직접 취업까지 연결해드리고 있습니다.</a>
        <a style="font-size: 50px">"</a>
    </div>

    <div class="div-style" style="position: relative; box-sizing: border-box; padding-top: 50px;" >
        <div class="mySlides">
          <div class="numbertext">1 / 6</div>
          <img src="resource/images/non1.jpg" style="width:100%">
        </div>
      
        <div class="mySlides">
          <div class="numbertext">2 / 6</div>
          <img src="resource/images/non2.jpg" style="width:100%">
        </div>
      
        <div class="mySlides">
          <div class="numbertext">3 / 6</div>
          <img src="resource/images/non3.jpg" style="width:100%">
        </div>
          
        <div class="mySlides">
          <div class="numbertext">4 / 6</div>
          <img src="resource/images/non1.jpg" style="width:100%">
        </div>
      
        <div class="mySlides">
          <div class="numbertext">5 / 6</div>
          <img src="resource/images/non2.jpg" style="width:100%">
        </div>
          
        <div class="mySlides">
          <div class="numbertext">6 / 6</div>
          <img src="resource/images/non3.jpg" style="width:100%">
        </div>
          
        <a class="prev" onclick="plusSlides(-1)">❮</a>
        <a class="next" onclick="plusSlides(1)">❯</a>
      
        <div class="caption-container">
          <p id="caption"></p>
        </div>
      
        <div class="row">
          <div class="column">
            <img class="demo cursor" src="resource/images/non1.jpg" style="width:100%" onclick="currentSlide(1)" alt="exhibition-1">
          </div>
          <div class="column">
            <img class="demo cursor" src="resource/images/non2.jpg" style="width:100%" onclick="currentSlide(2)" alt="exhibition-2">
          </div>
          <div class="column">
            <img class="demo cursor" src="resource/images/non3.jpg" style="width:100%" onclick="currentSlide(3)" alt="exhibition-3">
          </div>
          <div class="column">
            <img class="demo cursor" src="resource/images/non1.jpg" style="width:100%" onclick="currentSlide(4)" alt="exhibition-1">
          </div>
          <div class="column">
            <img class="demo cursor" src="resource/images/non2.jpg" style="width:100%" onclick="currentSlide(5)" alt="exhibition-2">
          </div>    
          <div class="column">
            <img class="demo cursor" src="resource/images/non3.jpg" style="width:100%" onclick="currentSlide(6)" alt="exhibition-3">
          </div>
        </div>
      </div>

    <div class="div-style" style="padding-top: 50px;">
        <div class="detail-block">
            <div class="style">
                <a class="a-title">현재 진행중인 전시회</a>
                <hr>
                <div class="round-div">
                    <p>전시 대표 이미지, 전시 이름 등 간략한 정보 표시</p>
                </div>
            </div>
            <div class="style">
                <a class="a-title">종료된 전시회</a>
                <hr>
                <div class="round-div">
                    <p>전시 대표 이미지, 전시 이름 등 간략한 정보 표시</p>
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
          let dots = document.getElementsByClassName("demo");
          let captionText = document.getElementById("caption");
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
          captionText.innerHTML = dots[slideIndex-1].alt;
        }
        </script>

</body>
</html>