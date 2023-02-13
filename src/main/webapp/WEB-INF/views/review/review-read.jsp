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
    
    <!-- 게시글 작성 단계에서 첨부한 커버 이미지 영역 -->
    <div class="wide-content">
        <div class="vertical-area" style="height: auto;">
            <div class="coverImage" style="width: auto; height: auto;">
            </div>
        </div>
    </div>

    <div class="main-content">
        <!-- 게시글 본문 -->
        <div class="board-area">
            <form name="board_content" method="post" action="#">
                <table class="table-style">
                    <tr>
                        <td><p class="title"><c:out value="${review.review_title }" /></p></td>
                    </tr>
                    <tr>
                        <td><p class="content">${review.review_content }</p></td>
                    </tr>
                </table>
            </form>
        </div>
        
        <!--작성된 댓글 목록-->
        <div class="comment-area commentDiv" id="readComment" style="margin-bottom: 10px;">
        
        </div>
        
        <!-- 댓글 작성 공간 -->
        <!-- 로그인 되어있는 경우만 댓글 작성이 가능해야 한다. -->
        <c:if test="${user != null}">
        <div class="comment-area">
            <form name="writeCommentForm" id="writeCommentForm" method="post">
                <input type="hidden" id="review_no" name="review_no" value="${review.review_no }">
                <input type="hidden" id="comment_id" name="comment_id" value="${user.id }">
                <input type="hidden" id="comment_nickName" name="comment_nickName" value="${user.nickName }" >
                <table style="width: 100%;">
                    <tr>
                        <td style="width: 15%; text-align: center;">
                        	<a class="comment-name">${user.nickName }</a>
                        </td>
                        <td style="width: 70%;">
                        	<textarea id="comment_content" name="comment_content" class="comment-write" placeholder="이곳에 댓글을 작성해주세요."></textarea>
                        </td>
                        <td style="width: 15%;" class="comment-btn-area">
                        	<input type="button" class="btn-style" value="등록" onclick="insertComment();">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        </c:if>
        
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
    
    <script type="text/javascript" src="/resource/js/comment.js"></script>
    
    <script type="text/javascript">
    	function insertComment() {
    		const id = document.getElementById("comment_id").value;
        	const nickName = document.getElementById("comment_nickName").value;
        	const reviewNo = document.getElementById("review_no").value;
        	const content = document.getElementById("comment_content").value;
        	
        	commentService.add(
        		{comment_content : content, comment_id : id, comment_nickName : nickName, review_no : reviewNo},
        		function(result) {
        			alert("댓글이 등록되었습니다.");
        			location.reload();
        		}
        	)
    	}
    </script>
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		var rnoValue = '<c:out value="${review.review_no}" />';
    		var commentDiv = $(".commentDiv");
    		var user_id = '<c:out value="${user.id}" />';
    		//처음 게시글 페이지가 로드 되었을 때 1페이지 댓글이 보이도록
    		showList(1);
    		
    		function showList(page) {
    			commentService.getList(
    					{review_no : rnoValue, page : page || 1}, 
    					function(list) {
    						var str = "";
    						
    						//등록된 댓글이 없으면 표시 x
	    					if(list == null || list.length == 0) {
	    						commentDiv.html("");
	    						return;
	    					}
	    					
		    				for(var i = 0, len = list.length || 0 ; i < len; i++) {
		    					str +="<div><p><a class='comment-name'>" + list[i].comment_nickName + "</a></p>";
		    	                str +="<div class='comment-content'><a>" + list[i].comment_content + "</a></div>";
		    	                str +="<div class='del-area'>";
		    	                str +="<input type='hidden' name='comment_id' id='comment_id' value='" + list[i].comment_id + "'>";
		                    	str +="<input type='hidden' name='comment_no' id='comment_no' value='" + list[i].comment_no + "'>";
		                        str +="<a class='a-style' onclick='deleteComment();'>삭제</a></div>";
		                        console.log("id : " + user_id + ", comment_id : " + list[i].comment_id + ", comment_no : " +list[i].comment_no);
		    				}
		    				commentDiv.html(str);
    			}); //end function
    		} //end showList
    		
    		//커버 이미지 보여주기
    		(function() {
    			var review_no = '<c:out value="${review.review_no}"/>';
    			
    			$.getJSON("/review/getImageList", {review_no : review_no}, function(arr) {
    				console.log(arr);
    				
    				var str = "";
    				
    				$(arr).each(function(i, reviewImage) {
    					
    					var fileCallPath = encodeURIComponent(reviewImage.image_directory + "/" + reviewImage.uuid + "-" + reviewImage.image_fileName);
    					console.log(fileCallPath);
    					str += "<img src='/display?fileName=" + fileCallPath + "' class='image-box'>";
    				});
    				$(".coverImage").html(str);
    				
    			}); //end getjson
    		})(); //end function
    	});
    </script>
    
    <script type="text/javascript">
    	function deleteComment() {
			const commentNo = document.getElementById("comment_no").value;
			console.log("comment_no : " + commentNo);
			
			commentService.remove(commentNo, function(result) {
					alert(result);
					location.reload();
				})
    	}
    </script>
    
    
</body>
</html>