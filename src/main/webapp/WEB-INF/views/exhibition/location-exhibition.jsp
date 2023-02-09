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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cc88b357d87beb360f1bd06b4b42bc5"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cc88b357d87beb360f1bd06b4b42bc5&libraries=services,clusterer,drawing"></script>
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

    <div class="main-container">
        <div class="div-style">
            <a style="font-size: 48px; font-weight: bold;">현재 위치에서 전시 찾기</a>
            <hr style="border: solid 6px; width: 1440px; margin-bottom: 20px;">
        </div>

        <div style="width: 1440px; margin: auto; margin-bottom: 50px;">
            <div class="search-container">
                <form action="/action_page.php">
                    <label style="font-size: 20px; font-weight: bold;">지역</label>
                    <input type="text" placeholder="검색" name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>

        <div style="position: relative; width: 1440px; height: 1000px; margin: 0 auto;">
            <div id="map" class="area" style="display: block; width: 820px; height: 930px; float: left;">
            </div>

            <div style="display: block; width: 560px; float: right;">
                <div class="card-row">
                    <img src="/resource/images/non300-1.jpg">
                    <div class="wrapper-container">
                        <a id="wc-a">
                            <i class="fa-regular fa-heart" style="font-size: x-large;"></i>
                        </a>
                        <a href="exhibition-detail.jsp"><h3><b>전시이름</b></h3></a>
                        <p><a>지역</a></p>
                        <p><a>주제</a></p>
                        <p><a>요금</a></p>
                        <p><a>전시장소명</a></p>
                        <p><a>2022/01/01 ~ 2022/12/31</a></p>
                        <button class="chBtn">다녀왔어요.</button>
                      </div>
                </div>

                <div class="card-row">
                    <img src="/resource/images/non300-2.jpg">
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
                
                <!-- 페이지 -->
		        <div class="pagination">
		                        
		        <c:if test="${pageMaker.prev }">
		        	<a href="${pageMaker.startPage -1}">&laquo;</a>
		        </c:if>
		                        
		        <c:forEach var="num" 
		        		begin="${pageMaker.startPage }" 
		        		end="${pageMaker.endPage }">
					﻿	<li class=paginate_button "${pageMaker.cri.pageNum == num ? "active":"" }" >
		            	<a href="${num }">${num}</a>
		        </c:forEach>
		                        
		        <c:if test="${pageMaker.next}">
		        	<a href="${pageMaker.endPage +1}">&raquo;</a>
		        </c:if>
		        </div>
		        ﻿<form id="actionForm" action="../exhibition/location-exhibition" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">	
					
				</form>
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
    
    <script type="text/javascript">
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '카카오', 
	        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
	    },
	    {
	        title: '생태연못', 
	        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	    },
	    {
	        title: '텃밭', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        title: '근린공원',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    }
	];
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}  
    </script>
    
    <script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	var actionForm = $("#actionForm");
			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				console.log("click");
				actionForm.find("input[name='pageNum']")
							.val($(this).attr("href"));
				actionForm.submit();
			});
	    	
	    });
    </script>

    <script>
        filterSelection("all")
        function filterSelection(c) {
          var x, i;
          x = document.getElementsByClassName("filterDiv");
          if (c == "all") c = "";
          for (i = 0; i < x.length; i++) {
            w3RemoveClass(x[i], "show");
            if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
          }
        }
        
        function w3AddClass(element, name) {
          var i, arr1, arr2;
          arr1 = element.className.split(" ");
          arr2 = name.split(" ");
          for (i = 0; i < arr2.length; i++) {
            if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
          }
        }
        
        function w3RemoveClass(element, name) {
          var i, arr1, arr2;
          arr1 = element.className.split(" ");
          arr2 = name.split(" ");
          for (i = 0; i < arr2.length; i++) {
            while (arr1.indexOf(arr2[i]) > -1) {
              arr1.splice(arr1.indexOf(arr2[i]), 1);     
            }
          }
          element.className = arr1.join(" ");
        }
        
        // Add active class to the current button (highlight it)
        var btnContainer = document.getElementById("myBtnContainer");
        var btns = btnContainer.getElementsByClassName("btn");
        for (var i = 0; i < btns.length; i++) {
          btns[i].addEventListener("click", function(){
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
          });
        }
    </script>

</body>
</html>