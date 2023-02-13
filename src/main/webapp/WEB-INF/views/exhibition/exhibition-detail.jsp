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
                        <a href="../notice/news">뉴스레터</a>
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

	<c:forEach var="exhibition" items="${exhList }" varStatus="status">
    <div class="div-style">
        <div class="poster-box">
            <div class="thumbnail-area">
            	<img src="/ThumbnailDetailDisplay?fileName=${exhibition.thumbnail.filePath}/${exhibition.thumbnail.uuid }-${exhibition.thumbnail.fileName}" style="width: 300px; height: 400px; padding-bottom: 10px;">
            </div>
            <div class="poster-box-bottom">
                <c:choose>
                		<c:when test="${not empty user.id }"> <!-- 로그인 상태일때 -->
                			<c:choose>
                				<c:when test="${exhibition.userLikeExh.id eq 'N'}">
                					<a id="wc-a" class="regular${status.count }"><i class="fa-regular fa-heart" id="heart${status.count }" style="font-size: x-large; cursor: pointer;"></i></a>
                				</c:when>
                				<c:otherwise>
                					<a id="wc-a" class="solid${status.count }"><i class="fa-solid fa-heart" id="sheart${status.count }" style="font-size: x-large; color: red; cursor: pointer;"></i></a>
	                			</c:otherwise>
                			</c:choose>
                		</c:when>
	                    <c:otherwise> <!-- 로그인 상태가 아닐때 -->
                    		<a id="wc-a" class="likeArea"><i class="fa-regular fa-heart" id="no${status.count }" style="font-size: x-large; cursor: pointer;"></i></a>
	                    </c:otherwise>
                	</c:choose>
                
                <a id="wc-a">${exhibition.exhibition.likeCount }</a>
                <a id="wc-a"><i class="fa-solid fa-share-nodes" style="font-size: 28px;"></i></a>  
                <a id ="wc-a" style="float: right;" href="#" class="aBtn">작품 해설 보기</a>
            </div>
             
        </div>
        <div class="info-box">
            <ul>
              <li class="info-item">
                <strong class="info-label">전시 이름</strong>
                <div class="info-desc">
                  <a>${exhibition.exhibition.title}</a>
                </div>
              </li>
              <li class="info-item">
                <strong class="info-label">지역</strong>
                <a>${exhibition.place.sido }</a>
              </li>
              <li class="info-item">
                <strong class="info-label">주소</strong>
                <a>${exhibition.place.sido } ${exhibition.place.gungu } ${exhibition.place.address }</a>
              </li>
              <li class="info-item">
                <strong class="info-label">장소 이름</strong>
                <a>${exhibition.place.place}</a>
              </li>
              <li class="info-item">
                <strong class="info-label">전시 일정</strong>
                <div class="info-desc">
                  <a><fmt:formatDate pattern="YYYY-MM-dd" value="${exhibition.exhibition.startDate }"/> ~ <fmt:formatDate pattern="YYYY-MM-dd" value="${exhibition.exhibition.endDate }"/> </a>
                </div>
              </li>
              <li class="info-item">
                <strong class="info-label">이용 시간</strong>
                <a>${exhibition.place.operating_hour }</a>
              </li>
              <li class="info-item">
                <strong class="info-label">이용 요금</strong>
                <div class="info-desc">
                  <a>${exhibition.exhibition.price }</a>
                </div>
              </li>
              <li class="info-item">
               <strong class="info-label">작가 이름</strong>
               <a>${exhibition.artist.artist_name }</a>
              </li>
              <li class="info-item">
                <strong class="info-label">홈페이지</strong>
                <a href="${exhibition.place.url }">${exhibition.place.url }</a>
              </li>
              <!--  
              <li class="info-item">
                <strong class="info-label">예매 안내</strong>
                <div class="info-desc">
                  <a href="#">예매 페이지로 이동</a>
                </div>
              </li>
              -->
            </ul>
            
          </div>
    </div>

    <div class="div-style">
        <hr style="border: solid 6px; width: 1440px; margin-bottom: 20px;">
        <a style="font-size: 50px;">"</a>
        <a>${exhibition.exhibition.intro }</a>
        <a style="font-size: 50px">"</a>
    </div>

	<c:if test="${exhImageList != null }">
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
      </c:if>
	</c:forEach>
    
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
    
    <!--  
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
	-->

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
        
        <script type="text/javascript">
		
			$(document).ready(function(){
				<c:forEach var="exhibition" items="${exhList}" varStatus="status">
				var fileCallPath = '<c:out value="${exhibition.thumbnail.filePath}" />' + "/" + '<c:out value="${exhibition.thumbnail.uuid}" />' + "-" + '<c:out value="${exhibition.thumbnail.fileName}" />';
				var exhibition_no = '<c:out value="${exhibition.exhibition.exhibition_no}" />';
				var title = '<c:out value="${exhibition.exhibition.title}" />';
				var sido = '<c:out value="${exhibition.place.sido}" />';
				var realm = '<c:out value="${exhibition.exhibition.realm}" />';
				var startDate = '<c:out value="${exhibition.exhibition.startDate}" />';
				var endDate = '<c:out value="${exhibition.exhibition.endDate}" />';
				var place = '<c:out value="${exhibition.place.place}" />';
				var artist_name = '<c:out value="${exhibition.artist.artist_name}" />';
				var id = '<c:out value="${user.id}" />';
				
// 				window.localStorage.setItem("fileCallPath", fileCallPath);
// 				window.localStorage.setItem("exhibition_no", exhibition_no);
// 				window.localStorage.setItem("title", title);
// 				window.localStorage.setItem("sido", sido);
// 				window.localStorage.setItem("realm", realm);
// 				window.localStorage.setItem("startDate", startDate);
// 				window.localStorage.setItem("endDate", endDate);
// 				window.localStorage.setItem("place", place);
// 				window.localStorage.setItem("artist_name", artist_name);
// 				window.localStorage.setItem("id", id);
				
// 				console.log(window.localStorage.getItem("fileCallPath"));
// 				console.log(window.localStorage.getItem("exhibition_no"));
// 				console.log(window.localStorage.getItem("title"));
// 				console.log(window.localStorage.getItem("sido"));
// 				console.log(window.localStorage.getItem("realm"));
// 				console.log(window.localStorage.getItem("startDate"));
// 				console.log(window.localStorage.getItem("endDate"));
// 				console.log(window.localStorage.getItem("place"));
// 				console.log(window.localStorage.getItem("artist_name"));
// 				console.log(window.localStorage.getItem("id"));
				
// 				var list = { 
// 						fileCallPath : window.localStorage.getItem("fileCallPath"), 
// 						exhibition_no : window.localStorage.getItem("exhibition_no"),
// 						title : window.localStorage.getItem("title"), 
// 						sido : window.localStorage.getItem("sido"), 
// 						realm : window.localStorage.getItem("realm"), 
// 						startDate : window.localStorage.getItem("startDate"), 
// 						endDate : window.localStorage.getItem("endDate"), 
// 						place : window.localStorage.getItem("place"), 
// 						artist_name : window.localStorage.getItem("artist_name"), 
// 						id : window.localStorage.getItem("id")
// 						};
				
// 				localStorage.setItem('obj', JSON.stringify(list));
				
				
				var arr = localStorage.getItem("exhibition_no_arr");
				if( arr == null ) {
					arr = [];
				} else {
					arr = JSON.parse(arr);
				}
				
				arr.unshift(exhibition_no);
				window.localStorage.setItem("exhibition_no_arr", JSON.stringify(arr));
				
				</c:forEach>
				
				
				
			});
		
		</script>

</body>
</html>