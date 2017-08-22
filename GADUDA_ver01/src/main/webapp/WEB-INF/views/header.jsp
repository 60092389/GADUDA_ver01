<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>

	<!-- 메인 로고, 로그인, 회원가입 -->
	<div class="w3-top">
		<div class="w3-bar w3-basiccolor w3-right-align">
			<a href=<%=URLs.URI_MAIN_HOME%>
				class="w3-bar-item w3-button w3-margin-top w3-hover-white">
				<img class="w3-margin" src="/resources/Images/basic/logo.jpg" style="height:50px"></a>
			<div>
				<div style="float: right">
					<div style="float: left; margin-top: 30px; margin-right:10px">
						<form action="${URLs.URI_FURNITURE_HASHTAG_FULL } ">
							<div style="float: left; white-space : inherit; display: inline;">
								<input class="w3-input w3-margin" style="height: 30px; width: 150px; display: inline;" name="hashtag_search" value='' placeholder="해시태그 검색" type="text" />
								<button class="w3-padding w3-button w3-white w3-border w3-round w3-hover-white" type="submit" style="display: inline;">검색</button>
							</div>
						</form>
					</div>
					<c:set var="member" value="${ member }" />
					<c:choose>
						<c:when test="${ empty member }">
							<a onclick="document.getElementById('loginUser').style.display='block'"
								class=" w3-button w3-padding w3-hover-white"><h6>LOGIN</h6></a>
							<a onclick="document.getElementById('joinUser').style.display='block'"
								class=" w3-button w3-padding w3-hover-white"><h6>JOIN</h6></a>
						</c:when>
						<c:otherwise>
							<a href=<%=URLs.URI_MYPAGE_MEMBER_FULL%>
								class="w3-bar-item w3-button w3-padding w3-hover-white"><h6>${ member.mem_nickname }님</h6></a>
							<a href=<%=URLs.URI_LOGOUT_FULL%>
								class="w3-bar-item w3-button w3-padding w3-hover-white"><h6>logout</h6></a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- 기본 목록 -->
		<div class="w3-bar w3-subcolor w3-left-align w3-large">
			<div style="float: right">
				<a href=<%=URLs.URI_FURNITURE_LIST_LOOKAROUND_GET_FULL%>
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">가구</a>
				<a href=<%=URLs.URI_FURNITURE_WATCH_FULL%>
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">가구 배치도</a>
				<!-- <a href=<%=URLs.URI_MAIN_TO_RECOM%>
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">추천</a> -->
				<c:choose>
				<c:when test="${ empty member }">
				</c:when>
				<c:otherwise>
					<a href=<%=URLs.URI_MYPAGE_MEMBER_FULL%>
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">마이페이지</a>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>

<!-- 로그인 창 띄우기 -->
	<div id="loginUser" class="w3-modal">
	
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;"><img class="w3-image" src="/resources/Images/basic/login.jpg"></h1> 
			
			<jsp:include page="/WEB-INF/views/Member/view_login.jsp" flush="false" />

		</div>
	</div>
<!-- 회원가입 창 띄우기 -->
	<div id="joinUser" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;"><img class="w3-image" src="/resources/Images/basic/join.jpg"></h1> 

			<jsp:include page="/WEB-INF/views/Member/view_join.jsp" flush="false" />

		</div>
	</div>
</body>
</html>
