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
</head>
<body>
    <header>
        <div>
            <a class="logo-text" href="/index">A.Pla</a>
            <div>
                <div class="topnav">
                    <div class="search-container">
                    <form action="/action_page.php">
                        <input type="text" placeholder="검색" name="search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                    </div>
                </div>
                <div class="top-menu">
                    <a href="#">
                        <i class="fa fa-cart-shopping" alt="장바구니"></i>
                    </a>
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

    <div style="width: 1440px; margin: auto; height: 1500px; padding-top: 60px;">
        <div class="sidebar" style="float: left; width: 200px;">
            <a class="active accordion">관심 목록</a>
                <div class="panel">
                    <a href="exhibition-list.jsp">관심 전시 목록</a>
                    <a href="exhibition-place-list.jsp">관심 전시 장소 목록</a>
                </div>
            <a href="visit-exhibition.jsp">다녀온 전시 목록</a>
            <a href="#">나의 리뷰</a>
            <a class="active accordion">마이 아트샵</a>
                <div class="panel">
                    <a href="#">주문 내역</a>
                    <a href="#">상품 후기</a>
                </div>
            <a href="../user/userCheck">개인정보 수정</a>
          
        </div>
        
        <div>
            <a style="font-size: 48px; font-weight: bold;">개인정보수정</a>
            <hr style="border: solid 6px; margin-bottom: 20px;">
            <div style="text-align: right; width: 100%;">
                <p><span style="color: red;">*</span>표시는 필수 입력항목 입니다.</p>
            </div>
            
            <div class="register-form">
                <form name="updateProfile" method="post" action="./updateUser">
                    <input type="hidden" name="type" value="normar">
                    <table>
                        <tr>
                            <td colspan="2">
                                <h3>기본정보 입력</h3>
                                <hr>
                            </td>
                        </tr>
                        <tr>
                            <td><span style="color: red;">*</span>ID</td>
                            <td><input type="text" name="id" value="${user.id }" readonly></td>
                        </tr>
                        <tr>
                            <td><span style="color: red;">*</span>비밀번호</td>
                            <td>
                                <input type="password" name="password" placeholder="8~16자리 사이">
                                <p style="font-size: small; color: rgb(255, 0, 0, 0.8); margin: 0;">비밀번호는 알파벳 대문자, 소문자, 숫자, 특수문자 중 3개 이상 입력해야 합니다.</p>
                            </td>
                        </tr>
                        <tr>
                            <td><span style="color: red;">*</span>비밀번호 확인</td>
                            <td><input type="password" name="passwordChk"></td>
                        </tr>
                        <tr>
                            <td><span style="color: red;">*</span>이메일</td>
                            <td>
                                <input type="text" name="email1" placeholder="이메일" value="${email1 }"> @
                                <input type="text" name="email2" value="${email2 }" readonly>
                                <select name="selectEmail" id="selectEmail" onchange="checkEmail();">
                                    <option value="" selected>선택해주세요.</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="hanmail.com">hanmail.net</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="kakao.com">kakao.com</option>
                                    <option value="icloud.com">icloud.com</option>
                                    <option value="1">직접입력</option>
                                </select>
                                
                                <input type="button" class="register-btn" value="중복확인">
                                
                                <div id="dpc-check-div">

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <h3>개인정보 입력</h3>
                                <hr>
                            </td>
                        </tr>
                        <tr>
                            <td><span style="color: red;">*</span>이름</td>
                            <td><input type="text" name="name" value="${user.name }"></td>
                        </tr>
                        <tr>
                            <td><span style="color: red;">*</span>닉네임</td>
                            <td><input type="text" name="nickName" value="${user.nickName }"></td>
                        </tr>
                        <tr>
                            <td><span style="color: red;">*</span>휴대폰번호</td>
                            <td>
                                <input type="text" name="phoneNumber" value="${user.phoneNumber }">
                                <a href="#" class="register-btn">인증번호 받기</a>
                            </td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td>
                                <input type="radio" name="gender" value="female">여성
                                <input type="radio" name="gender" value="male">남성
                            </td>
                        </tr>
                        <tr>
                            <td>생년월일</td>
                            <td>
                                <input type="date" name="birth" value="${user.birth }">
                            </td>
                        </tr>
                    </table>

                    <div style="text-align: center;">
                        <input type="submit" value="확인" onclick="return update()">
                        <input type="reset" value="다시입력">
                        <input type="button" value="회원탈퇴" onclick="return confirmDelete()">
                    </div>
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

	<script src="/resource/js/member.js"></script>
	
	<script>
	function confirmDelete() {
		result = confirm("정말로 탈퇴 하시겠습니까?");
		if(result) {
			updateProfile.action = "./withDrawUser";
			updateProfile.submit();
		} else {
			return;
		}
	}
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