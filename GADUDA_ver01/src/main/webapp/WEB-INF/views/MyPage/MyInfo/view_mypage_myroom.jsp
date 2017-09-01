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
	
	$(".del_myroom").click(function(){
		var retVal = confirm("삭제하시겠습까?");
		var del_num=$(this).attr("value");
		   if( retVal == true ){
			   var del_room_no={"del_room_no":del_num};
				$.ajax({
					url:"${URLs.URI_ROOMMAKE_DEL_FULL}",
					type : "GET",
					data:del_room_no,
					success:function(data){
						if(data.MSG=1){
							alert("삭제 성고");
							location.href=data.URL;
						}else{
							alert("삭제 실패");
						}
								
					}
				});
		   }
		
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
			<div class="w3-margin" id="btn_makeRoom_div"><button class="w3-button w3-blue w3-hover-white" id="btn_makeRoom">새로운 방 생성 하기</button></div>
			<br>
			<c:forEach var="myRoomList" items="${myRoomList }">
			<div class="w3-padding w3-main w3-content w3-margin-top w3-border-top w3-center">
				<table class="w3-container w3-table w3-center">
					<tr>
						<th><p>No.${ myRoomList.room_no }</p></th>
						<th class="w3-center" colspan="2"><h4>${ myRoomList.room_name }</h4></th>
					</tr>
					<tr>
						<td class="w3-right-align" colspan="4"><p style="font-size: 12px">${ myRoomList.room_create_date }</p></td>
					</tr>
					<tr>
						<td style="width: 300px">${ myRoomList.room_name }</td>
	   					<td colspan="2" style="width: 200px"><img src="${myRoomList.room_img_src }" alt=${myRoomList.room_img_src } style="height:200px"></td>
	  				</tr>
					<tr>
						<td class="w3-right-align" colspan="3"><button class="w3-button w3-red w3-hover-white del_myroom" value=${ myRoomList.room_no }>삭제하기</button> </td>
					</tr>
				</table>	
	    	</div>
		</c:forEach>
		</div> 
	</div>
</div>
	
</body>
</html>
