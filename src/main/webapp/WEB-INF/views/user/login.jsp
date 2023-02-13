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
                <!-- 
                <div class="top-menu">
                    <a href="normar-mypage.jsp">마이페이지</a>
                </div>
                 
                <div class="top-menu">
                    <a href="#">
                        <i class="fa fa-cart-shopping" alt="장바구니"></i>
                    </a>
                </div>
                -->
                <div class="top-menu">
                    <a href="../user/login">로그인</a>
                </div>
                
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

    <div>
        <form name="loginForm" class="login-form" action="../user/loginCheck" method="post">
            <h1 style="text-align: center; padding-bottom: 20px;">로그인</h1>
          <div class="login-container">
          	<c:choose>
	          	<c:when test="${cookie.id.value != null}">
	          		<label for="id"><b>ID</b></label>
		            <input type="text" placeholder="아이디 입력" name="id" id="id" required value="${cookie.id.value }">
	          	</c:when>
	          	<c:otherwise>
	          		<label for="id"><b>ID</b></label>
		        	<input type="text" placeholder="아이디 입력" name="id" id="id" required>
	          	</c:otherwise>
	        </c:choose>
            <label for="password"><b>비밀번호</b></label>
            <input type="password" placeholder="비밀번호 입력" name="password" required>
              
            <input type="submit" value="로그인">
            <label style="float: right; font-size: medium;">
              <input type="checkbox" ${empty cookie.id.value ? "":"checked" } id="remember">ID 기억하기
            </label>
          </div>
      
          <!-- <div class="login-container">
            <input type="reset" value="취소">
          </div> -->
          <div class="login-container" style="padding: 20px; text-align: center;">
            <a class="#" href="register">회원가입</a> /
            <a class="uname" href="#">ID찾기</a> /
            <a class="psw" href="#">비밀번호찾기</a>
          </div>
          
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
    $(document).on("change", "#remember", function() {
    	var checked = $("#remember").is(":checked");

    	if(checked == true) { //체크 상태일때
    		var rememberId = $("#id").val();
    		console.log("checked id : " + rememberId);
    		//Ajax로 전송
    		$.ajax({
    		url : './rememberId',
    		data : {id : rememberId},
    		type : 'POST',
    		dataType : 'json',
    		success : function(result) {
    				console.log("result : " + result);
    			}
    		}); //end ajax
    	} else { //체크 해제했을 때
    		console.log("unchecked")
    		//Ajax로 전송
    		$.ajax({
    		url : './delete-rememberId',
    		data : {id : rememberId},
    		type : 'POST',
    		dataType : 'json',
    		success : function(result) {
    				console.log("result : " + result);
    			}
    		}); //end ajax
    	}
    	
    	
    	
    })
    </script>
</body>
</html>