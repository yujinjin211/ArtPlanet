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
    <link rel="stylesheet" href="/resource/css/calendar-style.css">
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

    <!-- 사이드바 -->
    
    <div class="visit-content">
        <div class="sidebar" style="float: left; width: 200px; height: auto;">
            <a class="active accordion">관심 목록</a>
                <div class="panel">
                    <a href="../mypage/like-exhibition-list">관심 전시 목록</a>
                    <a href="exhibition-place-list.jsp">관심 전시 장소 목록</a>
                </div>
            <a href="../mypage/visit-exhibition-list">다녀온 전시 목록</a>
            <a href="../mypage/my-review-list">나의 리뷰</a>
            <!--  
            <a class="active accordion">마이 아트샵</a>
                <div class="panel">
                    <a href="#">주문 내역</a>
                    <a href="#">상품 후기</a>
                </div>
            -->
            <a href="../user/userConfirm">개인정보 수정</a>
        </div>

        <!-- 캘린더 -->
        <div class="visit-div" style="padding-top: 20px; padding-bottom: 50px;">
	        <a style="font-size: 48px; font-weight: bold;">다녀온 전시</a>
	        <hr style="overflow: hidden; border: solid 5px black;">
            
            <div class="sec_cal" style="padding-bottom: 30px;">
                <div class="cal_nav">
                  <a href="javascript:;" class="nav-btn go-prev">prev</a>
                  <div class="year-month"></div>
                  <a href="javascript:;" class="nav-btn go-next">next</a>
                </div>
                <div class="cal_wrap">
                  <div class="days">
                    <div class="day">월</div>
                    <div class="day">화</div>
                    <div class="day">수</div>
                    <div class="day">목</div>
                    <div class="day">금</div>
                    <div class="day">토</div>
                    <div class="day">일</div>
                  </div>
                  <div class="dates">
                  </div>
                </div>
            </div>
            
            <!-- 캘린더에서 날짜를 클릭하면 나올 내용 -->
            <div class="thisArea">
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

    <script src="/resource/js/calendar.js"></script>
    
    <script type="text/javascript">
    function dateClick(e) {
    	var dateId = e.id;
    	var arr1 = dateId.split("date");
    	var date = arr1[1];
    	
    	var year_month = $(".year-month").text();
    	var arr2 = year_month.split(".");
    	var year = arr2[0];
    	var month = arr2[1];
    	
    	var year_month_date = arr2[0] + "-" + arr2[1] + "-" + arr1[1];
    	console.log(year_month_date);
    	
    	var id = '<c:out value="${user.id}" />';
    	
    	function selectVisit(arr) {
    		if(!arr || arr.length == 0) { return; }
			
			<c:forEach var="exhibition" items="${exhList}" varStatus="status">
			var str = "";
			
			for(var i = 0; i < arr.length; i++) {
				$(arr[i]).each(function() {
					var startDate = new Date(arr[i].exhibition.startDate);
					var endDate = new Date(arr[i].exhibition.endDate);
					var startFormat = startDate.getFullYear() + "-" + startDate.getMonth() + "-" + startDate.getDate();
					var endFormat = endDate.getFullYear() + "-" + endDate.getMonth() + "-" + endDate.getDate();
					
					str += "<div style='padding: 20px; display: flex;'>";
					str += "<div class='card-row' style='width: 60%'>";
					str += "<img src='/ThumbnailDisplay?fileName=" + arr[i].thumbnail.uuid + "-" + arr[i].thumbnail.fileName + "'>";
					str += "<div class='wrapper-container'>";
                        <c:choose>
                		<c:when test="${not empty user.id }"> <!-- 로그인 상태일때 --> 
                			<c:choose>
                				<c:when test="${exhibition.userLikeExh.id eq 'N'}">
                					str += "<a id='wc-a' class='regular" + ${status.count } + "'><i class='fa-regular fa-heart' id='heart" + ${status.count } + "' style='font-size: x-large; cursor: pointer;'></i></a>";
                				</c:when>
                				<c:otherwise>
                					str += "<a id='wc-a' class='solid" + ${status.count } + "'><i class='fa-solid fa-heart' id='sheart${status.count }' style='font-size: x-large; color: red; cursor: pointer;'></i></a>";
	                			</c:otherwise>
                			</c:choose>
                		</c:when>
	                    <c:otherwise> <!-- 로그인 상태가 아닐때 -->
	                    	str += "<a id='wc-a' class='likeArea'><i class='fa-regular fa-heart' id='no" + ${status.count } + "' style='font-size: x-large; cursor: pointer;'></i>a</a>";
	                    </c:otherwise>
	                	</c:choose>
	                	str += "<p><a href='exhibition-detail?exhibition_no=" + arr[i].exhibition.exhibition_no + "' style='font-size: large; text-decoration-line: none; color: #444;'><b>" + arr[i].exhibition.title + "</b></a></p>";
	                	str += "<input type='hidden' id='exhNo" + ${status.count } + "' value='" + arr[i].exhibition.exhibition_no + "'>";
	                	str += "<a>" + arr[i].place.sido + "</a> /";
	                	str += "<a>" + arr[i].exhibition.realm + "</a> /";
	                	str += "<a>" + arr[i].exhibition.price + "</a>";
	                	str += "<p><a>" + arr[i].artist.artist_name + "</a></p>";
	                	str += "<p><a>" + arr[i].place.place + "</a></p>";
	                	str += "<p><a>" + startFormat + " ~ " + endFormat + "</a></p>";
	                	
	                	str += "<c:if test='" + ${user != null } + "'>";
	                  	str += "<div class='wrapper-container' style='text-align: center; margin-bottom: 20px;'>";
		                str += "<button class='chBtn'>다녀왔어요.</button>";
		                str += "</div>";
		                str += "</c:if>";
	                  	str += "</div>";
	                  	str += "</div>";
	                  	str += "</div>";
		            
		            $(".thisArea").html(str);
				});
			}
			</c:forEach>
    	}
    	
    	//Ajax로 전송
		$.ajax({
		url : '../exhibition/selectVisit',
		data : {visitDate : year_month_date, id : id},
		type : 'POST',
		dataType : 'json',
		success : function(result) {
				selectVisit(result);
			}
		}); //end ajax
    }
    </script>
    
    <script type="text/javascript">
	//빈 하트 클릭했을 때(insert)
	<c:forEach var="exhibition" items="${exhList}" varStatus="status">
		$(document).on("click", "#heart${status.count}", function() {
			var exhibition_no = $("#exhNo${status.count}").val();
			var id = '<c:out value="${user.id}" />';
			
			console.log("exhibition_no : " + exhibition_no + ", id : " + id);
			
			function insertHeart(arr) {
				if(!arr || arr.length == 0) { return; }
				
				<c:forEach var="exhibition" items="${exhList}" varStatus="status">
					var str = "<i class='fa-solid fa-heart' id='sheart" + ${status.count } + "' style='font-size: x-large; color: red; cursor: pointer;'></i>";
					$(".regular${status.count}").html(str);
					location.reload();
				</c:forEach>
			}
			
			//Ajax로 전송
			$.ajax({
			url : '../exhibition/insertHeart',
			data : {exhibition_no : exhibition_no, id : id},
			type : 'POST',
			dataType : 'json',
			success : function(result) {
					console.log("result : " + result);
					insertHeart(result);
				}
			}); //end ajax
		});
	</c:forEach>
	</script>
	
	<script type="text/javascript">
	//꽉찬 하트 클릭했을 때(delete)
	<c:forEach var="exhibition" items="${exhList}" varStatus="status">
		$(document).on("click", "#sheart${status.count}", function() {
			var exhibition_no = $("#exhNo${status.count}").val();
			var id = '<c:out value="${user.id}" />';
			
			console.log("exhibition_no : " + exhibition_no + ", id : " + id);
			
			function deleteHeart(arr){
				if(!arr || arr.length == 0) { return; }
				
				<c:forEach var="exhibition" items="${exhList}" varStatus="status">
					var str = "<i class='fa-regular fa-heart' id='heart" + ${status.count } + "' style='font-size: x-large; cursor: pointer;'></i>";
					$(".solid${status.count}").html(str);
					location.reload();
				</c:forEach>
			}
			
			//Ajax로 전송
			$.ajax({
			url : '../exhibition/deleteHeart',
			data : {exhibition_no : exhibition_no, id : id},
			type : 'POST',
			dataType : 'json',
			success : function(result) {
					console.log("result : " + result);
					deleteHeart(result);
				}
			}); //end ajax
		});
	</c:forEach>
	</script>
    
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