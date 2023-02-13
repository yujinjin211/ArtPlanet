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

    <div style="width: 1440px; margin: auto; height: 1000px; padding-top: 60px;">
        <div class="sidebar" style="float: left; width: 200px;">
            <a class="active accordion">관심 목록</a>
                <div class="panel">
                    <a href="../mypage/like-exhibition-list">관심 전시 목록</a>
                    <a href="exhibition-place-list.jsp">관심 전시 장소 목록</a>
                </div>
            <a href="../mypage/visit-exhibition-list">다녀온 전시 목록</a>
            <a href="#">나의 리뷰</a>
            <!--  
            <a class="active accordion">마이 아트샵</a>
                <div class="panel">
                    <a href="#">주문 내역</a>
                    <a href="#">상품 후기</a>
                </div>
            -->
            <a href="./userConfirm">개인정보 수정</a>
        </div>
    
        <!-- 마이페이지 기본화면 상단-프로필 영역 -->
        <div class="content" >
            <div style="height: 250px;">
            	<c:if test="${profileImage == null }">
	                <img src="resource/images/default-profile.jpg" class="profile-image">
                </c:if>
                <c:forEach var="profile" items="${profileImage }">
	            	<img src="/ProfileImage?fileName=${profile.uuid}-${profile.fileName}" class="profile-image">
	            </c:forEach>
                <form style="overflow: hidden; padding-left: 20px;">
                    <a style="font-size: 24px;">${user.nickName}님</a>
                    <a href="./userConfirm" style="font-size: 18px;"><i class="fa-solid fa-pen"></i></a>
                </form>
            </div>
        </div>
        <div class="content">
            <hr style="overflow: hidden; border: solid 5px black;">
            <a style="font-size: 30px; font-weight: bold;">최근 찾아본 전시</a>
        </div>
        
        <div class="content">
            <div class="wrapper" style="padding-top: 25px;">
            
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
    
    <script type="text/javascript">
    $(document).ready(function() {
    	
    	var exhibition_no_arr = JSON.parse(window.localStorage.getItem("exhibition_no_arr"));
    	
    	function showResult(arr) {
			if(!arr || arr.length == 0) { return; }
			
			<c:forEach var="exhibition" items="${exhList}" varStatus="status">
			
			var str = "";
			
			for(var i = 0; i < arr.length; i++) {
				$(arr[i]).each(function() {
					var startDate = new Date(arr[i].exhibition.startDate);
					var endDate = new Date(arr[i].exhibition.endDate);
					var startFormat = startDate.getFullYear() + "-" + startDate.getMonth() + "-" + startDate.getDate();
					var endFormat = endDate.getFullYear() + "-" + endDate.getMonth() + "-" + endDate.getDate();
				
					str += "<div class='card'>";
					str += "<img src='/ThumbnailDisplay?fileName=" + arr[i].thumbnail.uuid + "-" + arr[i].thumbnail.fileName + "'>";
					str += "<div class='wrapper-container'>";
		            
		            <c:choose>
        		        <c:when test="${not empty user.id }">
		        		    <c:choose>
				        		<c:when test="${exhibition.userLikeExh.id != user.id}">
				        			str += "<a id='wc-a' class='regular" + ${status.count } + "'><i class='fa-regular fa-heart' id='heart" + ${status.count } + "' style='font-size: x-large; cursor: pointer;'></i></a>";
				        		</c:when>
				        		<c:otherwise>
				        			str += "<a id='wc-a' class='solid" + ${status.count } + "'><i class='fa-solid fa-heart' id='sheart" + ${status.count } + "' style='font-size: x-large; color: red; cursor: pointer;'></i></a>";
				        		</c:otherwise>
		        		    </c:choose>
        		        </c:when>
        		        <c:otherwise>
        		        	str += "<a id='wc-a' class='likeArea'><i class='fa-regular fa-heart' id='no" + ${status.count} + "' style='font-size: x-large; cursor: pointer;'></i></a>";
        		        </c:otherwise>
		            </c:choose>
		            
		            str += "<p><a href='exhibition-detail?exhibition_no=" + arr[i].exhibition.exhibition_no + "' style='font-size: large; text-decoration-line: none; color: #444;'><b>" + arr[i].exhibition.title + "</b></a></p>";
		            str += "<input type='hidden' id='exhNo" + ${status.count } + "' value='" + ${exhibition.exhibition.exhibition_no } + "'>";
		            str += "<a>" + arr[i].place.sido + "</a> / ";
		            str += "<a>" + arr[i].exhibition.realm + "</a> / ";
		            str += "<a>" + arr[i].exhibition.price + "</a>";
		            str += "<p><a>" + arr[i].artist.artist_name + "</a></p>";
		            str += "<p><a>" + arr[i].place.place + "</a></p>";
		            str += "<p><a>" + startFormat + " ~ " + endFormat + "</a></p>";
		            str += "</div>";
		                  
		            str += "<c:if test='" + ${user != null } + "'>";
		            str += "<div class='wrapper-container' style='text-align: center; margin-bottom: 20px; cursor: pointer;'>";
		            
		            <c:choose>
	                  <c:when test="${exhibition.userVisitExh.id eq 'N'}">
	                  	  str += "<input type='hidden' id='VexhNo" + ${status.count } + "' value='" + ${exhibition.exhibition.exhibition_no } + "'>";
					      str += "<a class='visit${status.count }'><button id='visitBtn${status.count }' class='chBtn' style='cursor: pointer;'>다녀왔어요.</button></a>";
		              </c:when>
		              <c:otherwise>
		              	  str += "<input type='hidden' id='VexhNo" + ${status.count } + "' value='" + ${exhibition.exhibition.exhibition_no } + "'>";
						  str += "<a class='dvisit${status.count }'><button id='dvisitBtn${status.count }' class='chBtn' style='cursor: pointer; background-color: black; color: white;'>다녀왔어요.</button></a>";
		              </c:otherwise>
	              	</c:choose>
	              	
		            str += "</div>";
		            str += "</c:if>";
		            str += "</div>";
				
		        	$(".wrapper").html(str);
		        	location.reload();
				});
			}
			</c:forEach>
    	}
    	
    	//Ajax로 전송
		$.ajax({
		url : './exhibitionNoArr',
		data : {exhibition_no_arr : exhibition_no_arr},
		type : 'POST',
		dataType: "json",
		traditional: true,
		success : function(result) {
			console.log(result);
			showResult(result);
			}
		}); //end ajax
    });
    </script>
</body>
</html>