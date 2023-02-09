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
            <a style="font-size: 48px; font-weight: bold;">지역별 진행중인 전시</a>
            <hr style="border: solid 6px; width: 1440px; margin-bottom: 20px;">
        </div>

        <div class="div-style" style="margin-bottom: 20px;">
            <label style="font-size: large; font-weight: bold;">지역</label>
            <select class="select-style" name="e_area" id="e_area">
                <option value="전체" selected>전체</option>
                <option value="서울">서울시</option>
	  			<option value="부산">부산시</option>
	  			<option value="대구">대구시</option>
	  			<option value="인천">인천시</option>
	  			<option value="광주">광주시</option>
	  			<option value="대전">대전시</option>
	  			<option value="울산">울산시</option>
	  			<option value="세종">세종시</option>
	  			<option value="경기도">경기도</option>
	  			<option value="강원도">강원도</option>
	  			<option value="충청북도">충청북도</option>
	  			<option value="충청남도">충청남도</option>
	  			<option value="전라북도">전라북도</option>
	  			<option value="전라남도">전라남도</option>
	  			<option value="경상북도">경상북도</option>
	  			<option value="경상남도">경상남도</option>
	  			<option value="제주도">제주도</option>
            </select>
            
            <div style="text-align: right;">
                <a href="#">무료</a>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
                <a href="#">유료</a>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
                <a href="#">전체</a> &nbsp;&nbsp;&nbsp;
            </div>
        </div>
        
        <div class="wrapper thisArea">
        	<c:if test="${exhList == null}">
        	게시글이 없습니다.
        	</c:if>
        	
        	<c:forEach var="exhibition" items="${exhList}" varStatus="status">
            <div id="exhibition-area" class="card">
                <div class="thumbnail-area">
                	<img src="/ThumbnailDisplay?fileName=${exhibition.thumbnail.uuid}-${exhibition.thumbnail.fileName}">
                </div>
                <div class="wrapper-container">
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
                    <p><a href="exhibition-detail?exhibition_no=${exhibition.exhibition.exhibition_no }" style="font-size: large; text-decoration-line: none; color: #444;"><b>${exhibition.exhibition.title }</b></a></p>
                    <input type="hidden" id="exhNo${status.count }" value="${exhibition.exhibition.exhibition_no }">
                    <a>${exhibition.place.sido }</a> /
                    <a>${exhibition.exhibition.realm }</a> /
                    <a>${exhibition.exhibition.price }</a>
                    <p><a>${exhibition.artist.artist_name }</a></p>
                    <p><a>${exhibition.place.place }</a></p>
                    <p><a><fmt:formatDate pattern="YYYY-MM-dd" value="${exhibition.exhibition.startDate }"/> ~ <fmt:formatDate pattern="YYYY-MM-dd" value="${exhibition.exhibition.endDate }"/></a></p>
                  </div>
                  
                  <c:if test="${user != null }">
                  <div class="wrapper-container" style="text-align: center; margin-bottom: 20px;">
                  	<button class="chBtn">다녀왔어요.</button>
                  </div>
                  </c:if>
            </div>
            </c:forEach>
        </div>

        <!-- 페이지 -->
        <div class="pagination">
                        
        <c:if test="${pageMaker.prev }">
        	<a href="${pageMaker.startPage -1}">&laquo;</a>
        </c:if>
                        
        <c:forEach var="num" 
        		begin="${pageMaker.startPage }" 
        		end="${pageMaker.endPage }">
			﻿	<li class=paginate_button "${pageMaker.cri3.pageNum == num ? "active":"" }" >
            	<a href="${num }">${num}</a>
        </c:forEach>
                        
        <c:if test="${pageMaker.next}">
        	<a href="${pageMaker.endPage +1}">&raquo;</a>
        </c:if>
        </div>
        ﻿<form id="actionForm" action="../exhibition/region-exhibition" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri3.pageNum }">	
			<input type="hidden" name="amount" value="${pageMaker.cri3.amount }">
		</form>

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
			
			var actionForm = $("#actionForm");
			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				console.log("click");
				actionForm.find("input[name='pageNum']")
							.val($(this).attr("href"));
				actionForm.submit();
			});
			
			<c:forEach var="exhibition" items="${exhList}" varStatus="status">
			$("#no${status.count}").on("click", function(e) {
				alert("로그인한 후 이용 가능합니다.")
			});
			</c:forEach>
			
			$("#e_area").change(function(e) {
				var sido = $("#e_area").val();
				
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
    						
        					str += "<div id='exhibition-area' class='card'>";
        		            str += "<div class='thumbnail-area'>";
        		            str += "<img src='/ThumbnailDisplay?fileName=" + arr[i].thumbnail.uuid + "-" + arr[i].thumbnail.fileName + "'>";
        		            str += "</div>";
        		            
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
        		            str += "<div class='wrapper-container' style='text-align: center; margin-bottom: 20px;'>";
        		            str += "<button class='chBtn'>다녀왔어요.</button>";
        		            str += "</div>";
        		            str += "</c:if>";
        		            str += "</div>";
        		            
        		            $(".thisArea").html(str);
        				});
    				}
    				</c:forEach>
    			}
				
				//Ajax로 전송
    			$.ajax({
				url : './region-exhibition',
				data : {sido : sido},
				type : 'POST',
				dataType : 'json',
				success : function(result) {
						console.log("result : " + result);
						showResult(result);
					}
				}); //end ajax
				
			});
    				
		});
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
			url : './insertHeart',
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
			url : './deleteHeart',
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
    
</body>
</html>