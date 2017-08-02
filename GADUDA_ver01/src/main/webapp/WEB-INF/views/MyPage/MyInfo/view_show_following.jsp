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

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<div class="w3-container w3-center">
				<!-- Following List -->
				<h3>Following List</h3>
				<c:forEach var="following_list" items="${following_list }">
					<div class="w3-col w3-round w3-white w3-border-top w3-padding">
						<div class="w3-col m2 w3-center"><img src="${following_list.mem_profile_pic}" class="w3-circle" style="height: 50px; width: 50px" alt="follower ficture"></div>
						<div class="w3-col m3 w3-center"><button class="w3-button w3-white">${following_list.fol_mem_id }</button></div>
						<div class="w3-col m4 w3-center"><button onclick="follow('${following_list.fol_mem_id}');" class="w3-button w3-white">${following_list.status_fol_kind }</button></div>
						<div class="w3-col m3 w3-center"><a href="${URLs.URI_FOLLOW_FURARR_FULL }?fol_mem_id=${following_list.fol_mem_id}" value="${following_list.fol_mem_id}" class="w3-button w3-blue">가구 배치도</a></div>
					</div>
				</c:forEach>
			</div>
		</div>
		
	</div>
</div>
<script type="text/javascript">
	function follow(fol_mem_id){
		var data = {"fol_mem_id" : fol_mem_id};
			
			$.ajax({
				url : "${URLs.URI_MYPAGE_FOLLOW_CHK_FULL}",
				type : 'GET',
				data : data,
				
				success : function(){
					location.reload();
				}
			
			});
			
		}
</script>
</body>
</html>