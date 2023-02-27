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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/resource/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css" />
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
    
    
    <div class="vertical-content">
        <div class="vertical-area">
                <div class="dropBox uploadDiv" for="file" onclick="onclick=document.all.uploadFile.click();">
                    <img src="/resource/images/upload-area3.jpg" class="image-box">
                    <input type="file" name="uploadFile" id="uploadFile" accept=".png, .jpeg, .jpg"  style="display: none;" multiple>
                </div>
        </div>
    </div>
	
	<form role="form" action="../review/review-write" method="post">
    <div class="main-content">
        <div class="board-area">
            <input type="hidden" name="id" value="${user.id }">
            <input type="hidden" name="writer_nickName" value="${user.nickName }">
                <table class="table-style" style="text-align: left;">
                    <tr>
                        <td colspan="2"><input type="text" name="review_title" value="${review.review_title }"></td>
                    </tr>
                    <tr>
                    	<td style="width: 8%; text-align: center;">전시 선택</td>
                    	<td>
                    		<select name="exhibition_no" id="exhibition_no" class="p-exhibition">
                    			<c:forEach var="exhibition" items="${exhibitionList}" varStatus="status">
                    				<option value="${exhibition.EXHIBITION_NO}">${exhibition.TITLE }</option>
                    			</c:forEach>
                    		</select>
                    	</td>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea name="review_content" placeholder="내용을 입력해주세요.">${review.review_content }</textarea></td>
                    </tr>
                    <tr>
                    	<td>
                    		<div class="uploadResult">
                    			<ul>
                    			
                    			</ul>
                    		</div>
                    	</td>
                    </tr>
                </table>
                <hr>
                <button type="submit">작성완료</button>
            
        </div>
    </div>
	</form>
	
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
    <script src="/resource/js/dragdrop.js"></script>
    <script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
    
    ﻿<script>
    	$(document).ready(function(e) {
    		
    		//submit 버튼의 동작 막기
			var formObj = $("form[role='form']");
    		
    		$("button[type='submit']").on("click", function(e) {
    			e.preventDefault();
    			console.log("submit clicked");
    			
    			var str = "";
    			
    			$(".uploadResult ul li").each(function(i, obj) {
    				
    				var jobj = $(obj);
    				
    				console.log("jobj.filename : " + jobj.data("filename"));
    				console.log("jobj.path : " + jobj.data("path"));
    				console.log("jobj.uuid : " + jobj.data("uuid"));
    				console.log("jobj.type : " + jobj.data("type"));
    				
    				console.dir(jobj);
    				
    				str += "<input type='hidden' name='imageList[" + i + "].image_fileName' value='" + jobj.data("filename") + "'>";
    				str += "<input type='hidden' name='imageList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
    				str += "<input type='hidden' name='imageList[" + i + "].image_directory' value='" + jobj.data("path") + "'>";
    				str += "<input type='hidden' name='imageList[" + i + "].image' value='" + jobj.data("type") + "'>";
    			
    			});
    			formObj.append(str).submit();
    		});
    		
    		//파일 업로드 제한
    		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    		var maxSize = 5242880; //5MB

    		function checkExtension(fileName, fileSize) {
    			if(fileSize >= maxSize) {
    				alert("파일 사이즈 초과");
    				return false;
    			}
    			
    			if(regex.test(fileName)) {
    				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
    				return false;
    			}
    			return true;
    		}
    		
    		$("input[type='file']").change(function(e) {
    			var formData = new FormData();
    			var inputFile = $("input[name='uploadFile']");
    			var files = inputFile[0].files; //<input type="file">에 추가된 파일들
    			
    			console.log(files);
    			
    			//FormData 객체에 파일 데이터를 추가
    			for(var i = 0; i < files.length; i++) {
    				
    				//checkExtenstion() 함수를 사용하여 파일의 업로드 제한
    				if(!checkExtension(files[i].name, files[i].size)) {
    					return false; //반복문을 탈출 : 파일 업로드 x
    				}
    				formData.append("uploadFile", files[i]);
    			}
    			
    			function showUploadResult(uploadResultArr) {
    				if(!uploadResultArr || uploadResultArr.length == 0) { return; }
    				
    				var uploadUL = $(".uploadResult ul");
    				var str = "";
    				
    				$(uploadResultArr).each(function(i, obj) {
    					//image type
    					if(obj.image) {
    						var fileCallPath = encodeURIComponent(obj.image_directory + "/s_" + obj.uuid + "-" + obj.image_fileName);
    						str += "<li data-path='" + obj.image_directory + "'";
    						str += " data-uuid='" + obj.uuid +"' data-filename='" + obj.image_fileName + "' data-type='" + obj.image + "'";
    						str += "><div>";
    						str += "<span> " + obj.image_fileName + "</span>";
    						str += "<button type='button' data-file=\'" + fileCallPath + "\'data-type='image'><i class='fa fa-times'></i></button><br>";
    						str += "<img src='/display?fileName=" + fileCallPath + "'>";
    						str += "</div>";
    						str + "</li>";
    					} else {
    						var fileCallPath = encodeURIComponent(obj.image_directory + "/" + obj.uuid + "-" + obj.image_fileName);
    						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
    						
    						str += "<li "
    						str += "data-path='" + obj.image_directory + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.image_fileName + "' data-type='" + obj.image + "' ><div>";
    						str += "<span> " + obj.image_fileName + "</span>";
    						str += "button type='button' data-file=\'" + fileCallPath + "\' data-type='file'><i class='fa fa-times'></i></button><br>";
    						str += "<img src='/resource/images/item-240x240.jpg'></a>";
    						str += "</div>";
    						str += "</li>";
    					}
    				});
    				uploadUL.append(str);
    			}
    			
    			$(".uploadResult").on("click", "button", function(e) {
    				console.log("delete file");
    				
    				var targetFile = $(this).data("file");
    				var type = $(this).data("type");
    				
    				var targetLi = $(this).closest("li");
    				
    				//Ajax로 전송
    				$.ajax({
    					url : '/deleteFile',
    					data : {fileName : targetFile, type : type},
    					dataType : 'text',
    					type : 'POST',
    					success : function(result) {
    						alert(result);
    						targetLi.remove();
    					}
    				}); //$.ajax
    			});
    			
    			//Ajax로 전송
    			$.ajax({
				url : '/uploadReviewImage',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
						console.log("result : " + result);
						showUploadResult(result); //업로드 결과 처리 함수
					}
				}); //end ajax
    			
    		});
    		
    		
    	});
	</script>
    
</body>
</html>