<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>
	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-basiccolor w3-card-2 w3-left-align w3-large">
			<a
				class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-basiccolor"
				href="javascript:void(0);" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a
				href=<%=URLs.URI_MAIN_HOME%>
				class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">GADUDA</a>

			<div style="float: right">
				<a href=<%=URLs.URI_FURNITURE_LIST_LOOKAROUND_GET_FULL%>
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Furniture</a>
				<a href=<%=URLs.URI_FURNITURE_WATCH_FULL%>
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Arrangement</a>
				<a href=<%=URLs.URI_MAIN_TO_RECOM%>
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Recommend</a>
				<a href=<%=URLs.URI_MYPAGE_MEMBER_FULL%>
					class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">My
					Page</a> <br>
			</div>
		</div>
		<div style="float: right">
			<c:set var="member" value="${ member }" />
			<c:choose>
				<c:when test="${ empty member }">
					<a
						onclick="document.getElementById('loginUser').style.display='block'"
						class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">login</a>
					<a
						href=<%=URLs.URI_JOIN_VIEW_FULL  %> method="post"
						class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">join</a>
				</c:when>
				<c:otherwise>
					<a href=<%=URLs.URI_MYPAGE_MEMBER_FULL%>
						class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">${ member.mem_name }님
					</a>
					<a href=<%=URLs.URI_LOGOUT_FULL%>
						class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">logout</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Header -->
	<header class="w3-container w3-basiccolor w3-center"
		style="padding:50px 16px">
	</header>

<!-- 로그인 창 띄우기 -->
	<div id="loginUser" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 600px">


			<form class="w3-container" method="post"
				action=${ URLs.URI_LOGIN_CHK_FULL }>
				<div class="w3-section">
					<label><b>E-mail</b></label> <input
						class="w3-input w3-border w3-margin-bottom" type="text"
						placeholder="Enter user E-mail" name="mem_id" id="mem_id" required>
					<label><b>Password</b></label> <input class="w3-input w3-border"
						type="password" placeholder="Enter Password" name="mem_pw"
						id="mem_pw" required>
					<button class="w3-button w3-block w3-orange w3-section w3-padding"
						type="submit">Login</button>
					<button class="w3-button w3-block w3-gray w3-section w3-padding"
						type="submit">join</button>
					<input class="w3-check w3-margin-top" type="checkbox"
						checked="checked"> Remember me
				</div>
			</form>

			<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button
					onclick="document.getElementById('loginUser').style.display='none'"
					type="button" class="w3-button w3-red">Cancel</button>
				<span class="w3-right w3-padding w3-hide-small"> <a href="#">비밀번호
						찾기</a></span>
			</div>

		</div>
	</div>
</body>
</html>
