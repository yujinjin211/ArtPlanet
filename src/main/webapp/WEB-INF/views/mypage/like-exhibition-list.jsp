<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
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

    <!-- 여기부터 body -->

    <div class="main-content" style="height: 2300px;">
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
            <a href="../user/userConfirm">개인정보 수정</a>
        </div>
    
        <!-- 마이페이지 기본화면 상단-프로필 영역 -->

        <div class="content">
            <a style="font-size: 48px; font-weight: bold;">관심 전시 목록</a>
            <hr style="overflow: hidden; border: solid 5px black;">
        </div>
        
        <div class="content">
        	<c:if test="${exhList == null}">
        	게시글이 없습니다.
        	</c:if>
        	
            <div class="wrapper">
            	<c:forEach var="exhibition" items="${exhList }" varStatus="status">
            	<c:if test="${exhibition.userLikeExh.id != 'N' }">
	                <div class="card">
	                    <img src="/ThumbnailDisplay?fileName=${exhibition.thumbnail.uuid}-${exhibition.thumbnail.fileName}">
	                    <div class="wrapper-container">
	                        <a id="wc-a" class="solid${status.count }"><i class="fa-solid fa-heart" id="sheart${status.count }" style="font-size: x-large; color: red; cursor: pointer;"></i></a>
		                    <p><a href="../exhibition/exhibition-detail?exhibition_no=${exhibition.exhibition.exhibition_no }" style="font-size: large; text-decoration-line: none; color: #444;"><b>${exhibition.exhibition.title }</b></a></p>
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
	                </c:if>
            	</c:forEach>
            	
            </div>
            
            <div style="display: block; text-align: center;">
	            	<!-- 페이지 -->
			        <div class="pagination">
			                        
			        <c:if test="${pageMaker.prev }">
			        	<a href="${pageMaker.startPage -1}">&laquo;</a>
			        </c:if>
			                        
			        <c:forEach var="num" 
			        		begin="${pageMaker.startPage }" 
			        		end="${pageMaker.endPage }">
						﻿	<li class=paginate_button "${pageMaker.cri5.pageNum == num ? "active":"" }" >
			            	<a href="${num }">${num}</a>
			        </c:forEach>
			                        
			        <c:if test="${pageMaker.next}">
			        	<a href="${pageMaker.endPage +1}">&raquo;</a>
			        </c:if>
			        </div>
			        ﻿<form id="actionForm" action="../mypage/like-exhibition-list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri5.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri5.amount }">
					</form>
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
	    })
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
				
				location.reload();
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