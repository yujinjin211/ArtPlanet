<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아트플래닛</title>
    <link rel="stylesheet" href="/resource/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
    </style>
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

    <!--  -->

    <div style="width: 1440px; margin: auto; height: 1000px; padding-top: 60px;">
        
        <div class="sidebar" style="float: left; width: 200px;">
            <a class="active accordion">전시 관리</a>
                <div class="panel">
                    <a href="exhibition-add.jsp">전시회 등록</a>
                    <a href="add-explantion.jsp">전시 작품 해설 등록</a>
                    <a href="certification.jsp">인증 관리</a>
                    <a href="#">전시 내역 관리</a>
                </div>
            <a href="#">아트샵 관리</a>
            <a href="#">개인정보 수정</a>
          
        </div>
    
        <div class="content" style="float: left; width: 1200px; margin: 0px;">
            <div style="width: max-content; margin: auto;">
                <img src="resource/images/process01.jpg">
            </div>
            <div>
                
                <h1>전시회 등록</h1>
                
            </div>

            <div>
                <input type="button" onclick="createDiv()" value="+" style="border-radius: 10px; border: dashed 1px #444; width: 100%; font-size: 30px; padding: 15px;"></button>
            </div>

            <hr style="overflow: hidden; border: solid 5px black;">

            <button class="accordion" style="width: 100%; background-color: white;"></button>
                <div class="panel" id="ListPlace">

                </div>
            </div>


            <div id="createList" style="display: none;">
                <form name="" method="post" action="#">
                    <table>
                        <tr>
                            <td>전시 이름</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td>대표 이미지 등록</td>
                            <td><input type="file"></td>
                        </tr>
                        <tr>
                            <td>주제</td>
                            <td>
                                <select>
                                    <option>미디어아트</option>
                                    <option>서양화</option>
                                    <option>동양화</option>
                                    <option>사진전</option>
                                    <option>공예</option>
                                    <option>조각</option>
                                    <option>설치미술</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>지역</td>
                            <td>
                                <select class="select-style" id="path">
                                    <option value="1" selected>서울시</option>
                                      <option value="2">부산시</option>
                                      <option value="3">대구시</option>
                                      <option value="4">인천시</option>
                                      <option value="5">광주시</option>
                                      <option value="6">대전시</option>
                                      <option value="7">울산시</option>
                                      <option value="8">세종시</option>
                                      <option value="9">경기도</option>
                                      <option value="10">강원도</option>
                                      <option value="11">충청북도</option>
                                      <option value="12">충청남도</option>
                                      <option value="13">전라북도</option>
                                      <option value="14">전라남도</option>
                                      <option value="15">경상북도</option>
                                      <option value="16">경상남도</option>
                                      <option value="17">제주도</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td>전시 일정</td>
                            <td>
                                <input type="date"> ~ <input type="date">
                            </td>
                        </tr>
                        <tr>
                            <td>이용 시간</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td>이용 요금</td>
                            <td>
                                <select>
                                    <option>무료</option>
                                    <option>유료</option>
                                </select>
                                <br>
                                    성인<input type="text">원 <br>
                                    청소년<input type="text">원<br>
                                    어린이<input type="text">원
                                
                            </td>
                        </tr>
                        <tr>
                            <td>작가 이름</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td>홈페이지</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td>예매 안내</td>
                            <td><textarea cols="100" rows="10" placeholder="안내 사항을 입력해주세요."></textarea></td>
                        </tr>
                        <tr>
                            <td>전시 소개</td>
                            <td>
                                <textarea cols="100" rows="10" placeholder="전시 소개를 입력해주세요."></textarea>
                            </td>
                        </tr>
                    </table>

                    <div style="text-align: right;">
                        <input type="submit" value="등록">
                    </div>
                    
                </form>
            </div>
        </div>
            
    </div>
    

    
    <footer>
        <div class="footer-area">
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
        </div>
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

        function createDiv() {
            
            var newList = document.createElement('div');
            
            newList.innerHTML = document.getElementById('createList').innerHTML;
            document.getElementById('ListPlace').appendChild(newList);

        } 
    </script>

</body>
</html>