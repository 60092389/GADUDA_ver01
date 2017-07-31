<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#btn_makeRoom").click(function(){
		$("#btn_makeRoom_div").html('');
		$.ajax({
			url:"${URLs.URI_ROOMMAKE_INCLUDE_FULL}",
			success:function(data){
				$("#myPage_content5").html(data);
			}
		});
	});
});
</script>
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

<div class="w3-container" style="float: right">
	<c:set var="member" value="${ member }" />
	<input type="hidden" id="user_id" value="${ member.mem_id }">
	<input type="hidden" id="user_nickname" value="${ member.mem_nickname }">
</div>

<div class="w3-container ">
	<!--사이드 메뉴-->
	<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_mypage_sidebar.jsp" flush="false" />
	
	<!-- Page Container -->
	<div class="w3-main w3-content" style="max-width: 1200px; margin-top: 200px; margin-left: 300px">
		<div class="w3-container" id="myPage_content5">
			<br>
						<c:forEach var="myRoomList" items="${myRoomList }">
			<div class="w3-padding-32 w3-main w3-content w3-margin-top w3-border-top">
				<table class="w3-container w3-table w3-center">
					<tr>
	   					<th>No.<h1>${ myRoomList.room_no }</h1></th>
						<th colspan="3">
							<h1>${ myRoomList.room_name }</h1>
						</th>
						<th>${ myRoomList.room_create_date }</th>
	  				</tr>
					<tr>
						<td colspan="3" rowspan="4">
							<img src="${ myRoomList.room_shape_img_loc }" alt="${ myRoomList.room_name }" style="width:200px">
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>
							<div class="w3-center">
								<i class="material-icons" >favorite</i>
							</div>
						</td>
						<td colspan="2">
							내 방
						</td>
					</tr>
					<tr>
						<td colspan="4"> </td>
						<td>
							<button class="w3-button w3-green w3-hover-white">수정하기</button> 
							<button class="w3-button w3-red w3-hover-white">삭제하기</button> 
						</td>
					</tr>
				</table>	
	    	</div>
		</c:forEach>
		</div>
		<div id="btn_makeRoom_div"><button class="w3-button w3-blue w3-hover-white" id="btn_makeRoom">새로운 방 생성 하기</button></div> 
	</div>
</div>
	
</body>
</html>