<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">

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

	
	<!-- Page Container -->
	<div class="w3-main mainSection w3-container" >
		<div class="w3-col m2 ">
			<div class="w3-padding-32 w3-main w3-content w3-margin-top">
				<a href="${URLs.URI_MYPAGE_MYFURARR_FULL}" class="w3-button w3-blue">내 배치도 보러가기</a>
			</div>
		</div>
		<div class="w3-col m10">
			<div class=" ">
			<c:set var="fol_mem_id" value="${fol_mem_id }"/>
			<h1>${fol_mem_id }의 배치도</h1>
			<div class="w3-border-top">
				<c:forEach var="arrList" items="${arrList }">
					<div class="w3-col m5 w3-border w3-margin w3-round">
						<div class=" w3-padding ">
							<img class="w3-cell-middle w3-center" src="${ arrList.fur_arr_plan_img_loc }" alt="${ arrList.fur_arr_name }" style="height: 300px;">
						
						<div class="w3-container" >
							<table class="w3-col m12 w3-center w3-table">
								<tr>
									<td colspan="2" class="w3-center"><a href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${ arrList.fur_arr_plan_no }" class="w3-button"><h4>${ arrList.fur_arr_name }</h4></a></td>
								</tr> 
								<tr>
									<td colspan="2" class="w3-right-align"><b style="font-size: 12px">${ arrList.fur_arr_create_date }</b></td>
								</tr>
								<tr>
									<td style="width: 40%">방 종류</td>
									<td><b>${ arrList.fur_arr_plan_room_kind }</b></td>
								</tr>
								<tr>
									<td>컨셉</td>
									<td><b>${ arrList.fur_arr_plan_concept }</b></td>
								</tr>
								<tr>
									<td>해시태그</td>
									<td><b>${ arrList.fur_arr_plan_hash_tag }</b></td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="w3-center">
											<i class="material-icons" >favorite</i>${ arrList.fur_arr_plan_good_num }
											<i class="material-icons">attachment</i>${ arrList.fur_arr_plan_scrap_num }
											<i class="material-icons">cloud</i>${ arrList.fur_arr_plan_repl_num }
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">${ arrList.fur_arr_contents }</td>
								</tr>
							</table>
						</div>
						</div>
					</div>

				</c:forEach>
			</div>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>
