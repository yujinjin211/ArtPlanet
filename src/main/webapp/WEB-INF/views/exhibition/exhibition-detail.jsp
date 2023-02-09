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
				<!--  
                <li>
                <a href="art-shop.jsp">아트샵</a>
                </li>
                -->
            </ul>
        </div>
    </header>

    <div class="div-style">
        <div class="poster-box">
            <div class="thumbnail-area">
            </div>
            <div class="poster-box-bottom">
                <a><i class="fa-regular fa-heart" style="font-size: 28px;"></i></a>${detail.likeCount }
                <a><i class="fa-solid fa-share-nodes" style="font-size: 28px;"></i></a>  
                <a href="#" class="aBtn">작품 해설 보기</a>
            </div>
             
        </div>
        <div class="info-box">
            <ul>
              <li class="info-item">
                <strong class="info-label">전시 이름</strong>
                <div class="info-desc">
                  <a>${detail.title }</a>
                </div>
              </li>
              <li class="info-item">
                <strong class="info-label">지역</strong>
                <div class="info-desc sido_gungu">
                
                </div>
              </li>
              <li class="info-item">
                <strong class="info-label">주소</strong>
                <div class="info-desc">
                  <a>서울특별시 마포구 신촌로 176</a>
                </div>
              </li>
              <li class="info-item">
                <strong class="info-label">장소 이름</strong>
                <div class="info-desc place">
                  
                </div>
              </li>
              <li class="info-item">
                <strong class="info-label">전시 일정</strong>
                <div class="info-desc">
                  <a><fmt:formatDate pattern="YYYY-MM-dd" value="${detail.startDate }"/> ~ <fmt:formatDate pattern="YYYY-MM-dd" value="${detail.endDate }"/> </a>
                </div>
              </li>
              <li class="info-item">
                <strong class="info-label">이용 시간</strong>
                <div class="info-desc operating_hour">
                  
                </div>
              </li>
              <li class="info-item">
                <strong class="info-label">이용 요금</strong>
                <div class="info-desc">
                  <a>${detail.price }</a>
                </div>
              </li>
              <li class="info-item">
               <strong class="info-label">작가 이름</strong>
               <div class="info-desc artist_name">
               </div>
              </li>
              <li class="info-item">
                <strong class="info-label">홈페이지</strong>
                <div class="info-desc url">
                </div>
              </li>
              <li class="info-item">
                <strong class="info-label">예매 안내</strong>
                <div class="info-desc">
                  <a href="#">예매 페이지로 이동</a>
                </div>
              </li>
            </ul>
            
          </div>
    </div>

    <div class="div-style">
        <hr style="border: solid 6px; width: 1440px; margin-bottom: 20px;">
        <a style="font-size: 50px;">"</a>
        <a>${detail.intro}</a>
        <a style="font-size: 50px">"</a>
    </div>

    <div class="div-style" style="position: relative; box-sizing: border-box; padding-top: 50px;" >
        
        <c:forEach var="exhImage" items="${exhImageList}" varStatus="status">
        <div class="mySlides">
          <div class="numbertext">${status.count } / 6</div>
          <img src="/ExhibitionImage?fileName=${exhImage.uuid}-${exhImage.fileName}" style="width: 100%">
        </div>
      	</c:forEach>
        
          
        <a class="prev" onclick="plusSlides(-1)">❮</a>
        <a class="next" onclick="plusSlides(1)">❯</a>
      
        <div class="caption-container">
          <p id="caption"></p>
        </div>
        
      	
        <div class="row">
          <c:forEach var="exhImage" items="${exhImageList }" varStatus="status">
          <div class="column">
            <img class="demo cursor" src="/ExhibitionImage?fileName=${exhImage.uuid}-${exhImage.fileName}" style="width:100%" onclick="currentSlide(${status.count})">
          </div>
          
          </c:forEach>
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
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		
    		//장소 정보 보여주기
    		(function() {
    			var placeNo = '<c:out value="${detail.place_no}" />';
    			
    			$.getJSON("/exhibition/getPlaceInfo", {place_no : placeNo}, function(arr) {
    				
    				var sido_gungu = "";
    				var place_name = "";
    				var operating_hour = "";
    				var url = "";
    					
        				$(arr).each(function() {
        					
        					sido_gungu += "<a>" + this.sido + " " + this.gungu + "</a>";
        					place_name += "<a>" + this.place + "</a>"
        					operating_hour += "<a>" + this.operating_hour + "</a>";
        					url += "<a href='" + this.url + "'>" + this.url + "</a>";
        				});
        				
        				$(".sido_gungu").html(sido_gungu);
        				$(".place").html(place_name);
        				$(".operating_hour").html(operating_hour);
        				$(".url").html(url);
        				
    			}); //end getjson
    		})(); //end function
    		
    		//작가 정보 보여주기
    		(function() {
    			var artistNo = '<c:out value="${detail.artist_no}" />';

    			$.getJSON("/exhibition/getArtistInfo", {artist_no : artistNo}, function(arr) {
    				
    				var artist_name = "";
    					
        				$(arr).each(function() {
        					
        					artist_name += "<a>" + this.artist_name + "</a>";
        				});
        				
        				$(".artist_name").html(artist_name);
        				
    			}); //end getjson
    		})(); //end function
    		
    		//포스터 썸네일 이미지 보여주기
    		(function() {
    			var exhibitionNo = '<c:out value="${exhibition_no}" />';
    			$.getJSON("/exhibition/getThumbnail", {exhibition_no : exhibitionNo}, function(arr) {
    				
    					var str = "";
    					
        				$(arr).each(function() {
        					
        					var fileCallPath = encodeURIComponent(this.filePath + "/" + this.uuid + "-" + this.fileName);
        					console.log("fileCallPath : " + fileCallPath);
        					str += "<img src='/ThumbnailDetailDisplay?fileName=" + fileCallPath + "' style='width: 300px; height: 400px; padding-bottom: 10px;'>";
        				});
        				
        				$(".thumbnail-area").html(str);
        				
    			}); //end getjson
    		})(); //end function
    		
    	});
    </script>

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