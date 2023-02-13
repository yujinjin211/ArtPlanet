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
    <script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js"></script>
	<!--  <script src="https://cdn.anychart.com/releases/v8/js/anychart-tag-cloud.min.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    
    <script src="https://golangkorea.github.io/js/jqcloud/jqcloud.min.js"></script>
    <link rel="stylesheet" href="https://golangkorea.github.io/js/jqcloud/jqcloud.min.css">
    
</head>
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
            <a style="font-size: 48px; font-weight: bold;">좋아요 순위 TOP 4</a>
            <hr style="border: solid 6px; width: 1440px; margin-bottom: 100px;">
        </div>
        
        <div class="wrapper thisArea">
        	<c:if test="${likeList == null}">
        	게시글이 없습니다.
        	</c:if>
        	
        	<c:forEach var="exhibition" items="${likeList}" varStatus="status">
            <div id="exhibition-area" class="card" style="position: relative;">
            <p style="position: absolute; top: -25%; left: -23%; font-size: 160px; font-style: italic; font-weight: bolder; z-index: +2">${status.count }</p>
                <div class="thumbnail-area" >
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
        
        <div class="div-style">
            <a style="font-size: 48px; font-weight: bold;">인기 키워드</a>
            <hr style="border: solid 6px; width: 1440px; margin-bottom: 20px;">
            
        </div>

        <div style="position: relative; width: 1440px; height: 1000px; margin: 0 auto;">
            
            <div id="tags-cloud" style="display: block; width: 820px; height: 930px; float: left;"></div>
			
			<c:if test="${exhList == null}">
        	게시글이 없습니다.
        	</c:if>
        	
        	
            <div id="word-area" style="display: block; width: 560px; float: right;" >
            <c:forEach var="exhibition" items="${exhList}" varStatus="status">
                <div class="card-row">
                    <img src="/ThumbnailDisplay?fileName=${exhibition.thumbnail.uuid}-${exhibition.thumbnail.fileName}">
                    <div class="wrapper-container">
                        <c:choose>
                		<c:when test="${not empty user.id }"> <!-- 로그인 상태일때 -->
                			<c:choose>
                				<c:when test="${exhibition.userLikeExh.id eq 'N'}">
                					<a id="wc-a" class="eregular${status.count }"><i class="fa-regular fa-heart" id="eheart${status.count }" style="font-size: x-large; cursor: pointer;"></i></a>
                				</c:when>
                				<c:otherwise>
                					<a id="wc-a" class="esolid${status.count }"><i class="fa-solid fa-heart" id="esheart${status.count }" style="font-size: x-large; color: red; cursor: pointer;"></i></a>
	                			</c:otherwise>
                			</c:choose>
                		</c:when>
	                    <c:otherwise> <!-- 로그인 상태가 아닐때 -->
                    		<a id="wc-a" class="likeArea"><i class="fa-regular fa-heart" id="eno${status.count }" style="font-size: x-large; cursor: pointer;"></i></a>
	                    </c:otherwise>
	                	</c:choose>
	                    <p><a href="exhibition-detail?exhibition_no=${exhibition.exhibition.exhibition_no }" style="font-size: large; text-decoration-line: none; color: #444;"><b>${exhibition.exhibition.title }</b></a></p>
	                    <input type="hidden" id="eexhNo${status.count }" value="${exhibition.exhibition.exhibition_no }">
	                    <a>${exhibition.place.sido }</a> /
	                    <a>${exhibition.exhibition.realm }</a> /
	                    <a>${exhibition.exhibition.price }</a>
	                    <p><a>${exhibition.artist.artist_name }</a></p>
	                    <p><a>${exhibition.place.place }</a></p>
	                    <p><a><fmt:formatDate pattern="YYYY-MM-dd" value="${exhibition.exhibition.startDate }"/> ~ <fmt:formatDate pattern="YYYY-MM-dd" value="${exhibition.exhibition.endDate }"/></a></p>
	                  
	                  	<c:if test="${user != null }">
		                  <div class="wrapper-container" style="text-align: center; margin-bottom: 20px;">
		                  	<button class="chBtn">다녀왔어요.</button>
		                  </div>
	                  	</c:if>
	                  </div>
                    </div>
                </c:forEach>
                
                <!-- 페이지 -->
		        <div class="pagination">
		                        
		        <c:if test="${pageMaker.prev }">
		        	<a href="${pageMaker.startPage -1}">&laquo;</a>
		        </c:if>
		                        
		        <c:forEach var="num" 
		        		begin="${pageMaker.startPage }" 
		        		end="${pageMaker.endPage }">
					﻿	<li class=paginate_button "${pageMaker.cri4.pageNum == num ? "active":"" }" >
		            	<a href="${num }">${num}</a>
		        </c:forEach>
		                        
		        <c:if test="${pageMaker.next}">
		        	<a href="${pageMaker.endPage +1}">&raquo;</a>
		        </c:if>
		        </div>
		        ﻿<form id="actionForm" action="../exhibition/trend-exhibition" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri4.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri4.amount }">
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
	    $(document).ready(function() {
	    	var actionForm = $("#actionForm");
			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				console.log("click");
				actionForm.find("input[name='pageNum']")
							.val($(this).attr("href"));
				actionForm.submit();
			});
			
			<c:forEach var="exhibition" items="${likeList}" varStatus="status">
			$("#no${status.count}").on("click", function(e) {
				alert("로그인한 후 이용 가능합니다.")
			});
			</c:forEach>
			
			<c:forEach var="exhibition" items="${exhList}" varStatus="status">
			$("#eno${status.count}").on("click", function(e) {
				alert("로그인한 후 이용 가능합니다.")
			});
			</c:forEach>
	    })
    </script>
    
    <script type="text/javascript">
	//빈 하트 클릭했을 때(insert)
	<c:forEach var="exhibition" items="${likeList}" varStatus="status">
		$(document).on("click", "#heart${status.count}", function() {
			var exhibition_no = $("#exhNo${status.count}").val();
			var id = '<c:out value="${user.id}" />';
			
			console.log("exhibition_no : " + exhibition_no + ", id : " + id);
			
			function insertHeart(arr) {
				if(!arr || arr.length == 0) { return; }
				
				<c:forEach var="exhibition" items="${likeList}" varStatus="status">
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
	<c:forEach var="exhibition" items="${likeList}" varStatus="status">
		$(document).on("click", "#sheart${status.count}", function() {
			var exhibition_no = $("#exhNo${status.count}").val();
			var id = '<c:out value="${user.id}" />';
			
			console.log("exhibition_no : " + exhibition_no + ", id : " + id);
			
			function deleteHeart(arr){
				if(!arr || arr.length == 0) { return; }
				
				<c:forEach var="exhibition" items="${likeList}" varStatus="status">
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
	
	<script type="text/javascript">
	//빈 하트 클릭했을 때(insert)
	<c:forEach var="exhibition" items="${exhList}" varStatus="status">
		$(document).on("click", "#eheart${status.count}", function() {
			var exhibition_no = $("#eexhNo${status.count}").val();
			var id = '<c:out value="${user.id}" />';
			
			console.log("exhibition_no : " + exhibition_no + ", id : " + id);
			
			function insertHeart(arr) {
				if(!arr || arr.length == 0) { return; }
				
				<c:forEach var="exhibition" items="${exhList}" varStatus="status">
					var str = "<i class='fa-solid fa-heart' id='esheart" + ${status.count } + "' style='font-size: x-large; color: red; cursor: pointer;'></i>";
					$(".eregular${status.count}").html(str);
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
		$(document).on("click", "#esheart${status.count}", function() {
			var exhibition_no = $("#eexhNo${status.count}").val();
			var id = '<c:out value="${user.id}" />';
			
			console.log("exhibition_no : " + exhibition_no + ", id : " + id);
			
			function deleteHeart(arr){
				if(!arr || arr.length == 0) { return; }
				
				<c:forEach var="exhibition" items="${exhList}" varStatus="status">
					var str = "<i class='fa-regular fa-heart' id='eheart" + ${status.count } + "' style='font-size: x-large; cursor: pointer;'></i>";
					$(".esolid${status.count}").html(str);
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
	
	<script type="text/javascript">
	
	
	</script>
	
	<script type="text/javascript">
	$(document).ready(function () {
		var words = [];
		
		<c:forEach var="json" items="${jsonList}" varStatus="status">
			var theme_name_kor = '<c:out value="${json.theme_name_kor}" />';
			var count = '<c:out value="${json.count}" />';
			var size = '<c:out value="${status.count}" />';
			
			words.push({text : theme_name_kor, weight : count, html : {style : "cursor: pointer;"},
			handlers : {
				click : function(e) {
					theme_name_kor = '<c:out value="${json.theme_name_kor}" />';
					
			        	function showResult(arr) {
			        		
			        		if(!arr || arr.length == 0) { return; }
			        		
			        		<c:forEach var="exhibition" items="${exhList}" varStatus="status">
			        		
		    				var str = "";
			        		
			        		for(var i = 0; i < arr.length; i++) {
			        			$(arr[i]).each(function () {
			        				var startDate = new Date(arr[i].exhibition.startDate);
		    						var endDate = new Date(arr[i].exhibition.endDate);
		    						var startFormat = startDate.getFullYear() + "-" + startDate.getMonth() + "-" + startDate.getDate();
		    						var endFormat = endDate.getFullYear() + "-" + endDate.getMonth() + "-" + endDate.getDate();
		    						
		    						str += "<div class='card-row'>";
		    						str += "<img src='/ThumbnailDisplay?fileName=" + arr[i].thumbnail.uuid + "-" + arr[i].thumbnail.fileName + "'>";
		    						str += "<div class='wrapper-container'>";
		    	                        <c:choose>
		    	                		<c:when test="${not empty user.id }"> <!-- 로그인 상태일때 -->
		    	                			<c:choose>
		    	                				<c:when test="${exhibition.userLikeExh.id eq 'N'}">
		    	                					str += "<a id='wc-a' class='eregular" + ${status.count } + "'><i class='fa-regular fa-heart' id='eheart" + ${status.count } + "' style='font-size: x-large; cursor: pointer;'></i></a>";
		    	                				</c:when>
		    	                				<c:otherwise>
		    	                					str += "<a id='wc-a' class='esolid" + ${status.count } + "'><i class='fa-solid fa-heart' id='esheart${status.count }' style='font-size: x-large; color: red; cursor: pointer;'></i></a>";
		    		                			</c:otherwise>
		    	                			</c:choose>
		    	                		</c:when>
		    		                    <c:otherwise> <!-- 로그인 상태가 아닐때 -->
		    		                    	str += "<a id='wc-a' class='likeArea'><i class='fa-regular fa-heart' id='eno" + ${status.count } + "' style='font-size: x-large; cursor: pointer;'></i></a>";
		    		                    </c:otherwise>
		    		                	</c:choose>
		    		                	str += "<p><a href='exhibition-detail?exhibition_no=" + arr[i].exhibition.exhibition_no + "' style='font-size: large; text-decoration-line: none; color: #444;'><b>" + arr[i].exhibition.title + "</b></a></p>";
		    		                	str += "<input type='hidden' id='eexhNo" + ${status.count } + "' value='" + arr[i].exhibition.exhibition_no + "'>";
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
		    		                  	
		        		            $("#word-area").html(str);
			        			});
			        		}
			        		
			        		</c:forEach>
			        	}
					
					//Ajax로 전송
					$.ajax({
					url : './KeyWordExhibition',
					data : {theme_name_kor: theme_name_kor},
					type : 'POST',
					dataType : 'json',
					success : function(result) {
							showResult(result);
						}
					}); //end ajax
				}
			
			}	
			
			});
			
		</c:forEach>
		
		$('#tags-cloud').jQCloud(words, {autoResize: true, fontSize : {from : 0.2, to : 0.03}});
	});
	</script>
	
	<script type="text/javascript">
	</script>
    
    
</body>
</html>