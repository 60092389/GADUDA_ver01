<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
body, h1, h2, h3, h4, h5, h6 {font-family: "Lato", sans-serif}
.w3-bar, h1, button { font-family: "Montserrat", sans-serif}
.fa-anchor, .fa-coffee { font-size: 200px }
</style>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<!-- Main MenuBar -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	
	
	<div class="w3-container" style="float: right">
		<c:set var="member" value="${ member }" />
		<input type="hidden" id="user_id" value="${ member.mem_id }">
		<input type="hidden" id="user_nickname"
			value="${ member.mem_nickname }">
	</div>
	
<div class="w3-container ">

	<!--사이드 메뉴-->
	<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_mypage_sidebar.jsp" flush="false" />
	
	<!-- Page Container -->
	<div class="w3-main w3-content" style="max-width: 1200px; margin-top: 200px; margin-left: 300px">
	
		<div class="w3-row">
			<div class="w3-col m3">
				<!-- Profile -->
				<div class="w3-container w3-card-2 w3-round w3-white w3-border">
					<c:set var="member" value="${ member }" />
					<div class="w3-container">
						<h4 class="w3-center">My Profile </h4>
						<p class="w3-center"><img src=${ member.mem_profile_pic } class="w3-circle" style="height: 106px; width: 106px" alt="profile ficture"></p>
						<p class="w3-center"><i class="w3-margin-right w3-text-theme"></i><a onclick="document.getElementById('proficMod').style.display='block'">프로필 사진 변경</a></p>
						
						<hr>
						<p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>${ member.mem_nickname }</p>
						<p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>${ member.mem_birth }</p>
						<p><i class="fa fa-male fa-fw w3-margin-right w3-text-theme"></i> <a href=${URLs.URI_MYPAGE_MEMBER_FOLLOWER_FULL }>팔로워 ${follower}</a></p>
						<p><i class="fa fa-male fa-fw w3-margin-right w3-text-theme"></i> <a href=${URLs.URI_MYPAGE_MEMBER_FOLLOWING_FULL }>팔로잉 ${following }</a></p>
						<a type="button" onclick="document.getElementById('profMod').style.display='block'" class="w3-button w3-theme-d2 w3-margin-bottom w3-center">프로필 수정하기</a>
					</div>
				</div>
				<br>
			</div>

			<!-- Middle Column -->
			<div class="w3-col m7">

				<h1 class="w3-center">여기에다 뭐 넣을지 생각해 보기</h1>
				
			</div>
			
		</div>

		<!-- End Page Container -->
	</div>
</div>

	<br>
	<br>
	
	<!--프로필 사진 수정 창 띄우기-->
	<div id="proficMod" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">회원사진 수정</h1> 

			<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_update_member_first.jsp" flush="false" />

		</div>
	</div>
	
	<!--프로필 수정 창 띄우기-->
	<div id="profMod" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">회원정보 수정</h1> 

			<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_update_member.jsp" flush="false" />

		</div>
	</div>
	
	<!--비밀번호 수정 창 띄우기-->
	<div id="pwMod" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">비밀번호 변경</h1> 

			<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_update_member_pw.jsp" flush="false" />

		</div>
	</div>
	
</body>
</html>