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
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body style="height: 1500px">
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
                        <a href="news">뉴스레터</a>
                        <a href="review">리뷰</a>
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

    <div class="wide-content">
        <!-- 가로 1920 image -->
        <div class="wide-img1920">
            <img src="/resource/images/wide-content-1920x500.jpg">
        </div>
        <div class="text-box">
            <a style="display: block; color: white; font-size: 72px; font-weight: bold;">REVIEW</a>
            <a style="color: white">리뷰 page</a>
        </div>
    </div>

    <div class="page-container">
        <div class="page-header">
            
        </div>
        <div class="page-content">
            <h1>리뷰</h1>
            <div class="search-bar">
                <form>
                    <input type="text" placeholder="제목, 내용"><button type="submit"><i class="fa fa-search"></i></button>
                </form>
            </div>
            
            <div>
                <table class="board-table">
	                <colgroup>
	                    <col style="width: 8%;">
	                    <col style="width: 60%;">
	                    <col style="width: 12%;">
	                    <col style="width: 12%;">
	                    <col style="width: 8%;">
	                </colgroup>
	                
	                <!-- 게시판 헤더 -->
	                <thead>
	                    <tr>
	                        <th>번호</th>
	                        <th>제목</th>
	                        <th>작성자</th>
	                        <th>작성일</th>
	                        <th>조회수</th>
	                    </tr>
                	</thead>
                
                <c:if test="${reviewList == null}">
                <!-- 게시판 바디 -->
                <div class="board-list-body">
                    <ul>
                        <li style="width: 100%;">게시글이 없습니다.</li>
                    </ul>
                </div>
                </c:if>
                <c:forEach var="review" items="${reviewList }">
                <tbody>
                    <tr>
                        <td>${review.review_no }</td>
                        <td style="text-align: left;">
                        	<a href="./review-read?review_no=${review.review_no }">
                        		<c:out value="${review.review_title }" />
                        	</a>
                        </td>
                        <td style="width: 10%;">${review.writer_nickName }</td>
                        <td style="width: 10%;"><fmt:formatDate pattern="YYYY-MM-dd" value="${review.writeDate }"/></td>
                        <td style="width: 8%;">${review.readCount }</td>
                    </tr>
                </tbody>
                </c:forEach>
                
                </table>
                
                <c:if test="${user != null }">
                <div style="margin-top: 20px; text-align: right;">
            		<a href="../review/insertReview" style="margin: 5px; padding: 10px; background-color: #444; color: white; border-radius: 5px;">글쓰기</a>
        		</div>
        		</c:if>
                
                <!-- 게시판 풋터 -->
                <div class="board-list-body">
                    <!-- 페이지 -->
                    <div class="pagination">
                        
                        <c:if test="${pageMaker.prev }">
                            <a href="${pageMaker.startPage -1}">&laquo;</a>
                        </c:if>
                        
                        <c:forEach var="num"
                        			begin="${pageMaker.startPage }"
                        			end="${pageMaker.endPage }">
                        			﻿<li class=paginate_button "${pageMaker.cri.pageNum == num ? "active":"" }" >
                        			<a href="${num }">${num}</a>
                        </c:forEach>
                        
                        <c:if test="${pageMaker.next}">
                        <a href="${pageMaker.endPage +1}">&raquo;</a>
                        </c:if>
                    </div>
                    ﻿<form id="actionForm" action="../review/review" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">	
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					</form>
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
    
    ﻿﻿<script type="text/javascript">
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
</body>
</html>