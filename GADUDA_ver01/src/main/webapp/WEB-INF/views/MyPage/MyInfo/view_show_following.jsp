<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="kr.co.gaduda.common.URLs"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
	<div class="w3-main w3-content" style="max-width: 1200px; margin-left: 300px">
		<div class="w3-row">
			<div class="w3-container">
				<!-- Following List -->
				<h3>Following List</h3>
				<c:forEach var="following_list" items="${following_list }">
					<div class="w3-col m3 w3-round w3-white w3-border w3-margin">
						<h4 class="w3-center">Following Profile</h4>
						<p class="w3-center"><img src="${following_list.mem_profile_pic}" class="w3-circle" style="height: 200px; width: 200px" alt="follower ficture"></p>
						<p class="w3-center"><button class="w3-button w3-white">${following_list.fol_mem_id}</button></p>
						<p class="w3-center"><button class="w3-button w3-white">${following_list.status_fol_kind }</button></p>
						<p class="w3-center"><button class="w3-button w3-blue">${following_list.fol_mem_id }님의 가구 배치도</button></p>
					</div>
				</c:forEach>
			</div>
		</div>
		
	</div>
</div>

</body>
</html>