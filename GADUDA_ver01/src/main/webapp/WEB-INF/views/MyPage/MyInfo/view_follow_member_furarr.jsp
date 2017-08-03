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
			<c:forEach var="arrList" items="${arrList }">
			<div class="w3-padding-32 w3-main w3-content w3-margin-top w3-border-top">
				<table class="w3-container w3-table w3-center">
					<tr>
	   					<th>No.<h1>${ arrList.fur_arr_plan_no }</h1></th>
						<th colspan="3">
							<a href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${ arrList.fur_arr_plan_no }"><h1>${ arrList.fur_arr_name }</h1></a>
						</th>
						<th>${ arrList.fur_arr_create_date }</th>
	  				</tr>
					<tr>
						<td colspan="3" rowspan="4">
							<img src="${ arrList.fur_arr_plan_img_loc }" alt="${ arrList.fur_arr_name }" style="width:200px">
						</td>
						<td class="w3-center">종류</td>
						<td>${ arrList.fur_arr_plan_room_kind }</td>
					</tr>
					<tr>
						<td class="w3-center">컨셉</td>
						<td>${ arrList.fur_arr_plan_concept }</td>
					</tr>
					<tr>
						<td class="w3-center">HashTag</td>
						<td>${ arrList.fur_arr_plan_hash_tag }</td>
					</tr>
					<tr>
						<td>
							<div class="w3-center">
								<i class="material-icons" >favorite</i>${ arrList.fur_arr_plan_good_num }
								<i class="material-icons">attachment</i>${ arrList.fur_arr_plan_scrap_num }
								<i class="material-icons">cloud</i>${ arrList.fur_arr_plan_repl_num }
							</div>
						</td>
						<td colspan="2">
							${ arrList.fur_arr_contents }
						</td>
					</tr>
				</table>	
	    	</div>
		</c:forEach>
		</div>
	</div>
</div>
	
</body>
</html>