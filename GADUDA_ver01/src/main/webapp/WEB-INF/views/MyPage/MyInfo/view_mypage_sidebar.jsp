<%@page import="kr.co.gaduda.common.URLs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class=" w3-sidebar " style="margin-top:200px; margin-left: 50px">
	<div class="w3-col m2">
		<nav class="w3-sidebar w3-bar-block w3-white w3-collapse" style="z-index:3;width:200px" id="mySidebar">
			<div class="w3-container w3-display-container w3-padding-16">
				<i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
				<h3 class="w3-wide w3-text-block"><b>MY PAGE</b></h3>
			</div>
			<div class="w3-padding-64 w3-large w3-text-black">
				<a href=<%=URLs.URI_MYPAGE_MEMBER_FULL%> class="w3-bar-item w3-button">내 정보</a>
				
				<!-- 수정하기 -->
				<a href="${URLs.URI_MYPAGE_MYROOM_FULL}" class="w3-button w3-block w3-white w3-left-align w3-text-block" id="myBtn">내 방 보기</a>
				<a href="${URLs.URI_MYPAGE_MYFURARR_FULL}" class="w3-button w3-block w3-white w3-left-align w3-text-block" id="myBtn">내 배치도 보기</a>
				
				<a href="${URLs.URI_FURNITURE_SCRAP_FULL }?mem_id=${member.mem_id}" class="w3-bar-item w3-button">가구 스크랩</a>
				<a href="${URLs.URI_FURNITURE_ARR_SCRAP_FULL }?mem_id=${member.mem_id}" class="w3-bar-item w3-button">배치도 스크랩</a>
			</div>
		</nav>
	</div>
</div>
</body>
</html>
