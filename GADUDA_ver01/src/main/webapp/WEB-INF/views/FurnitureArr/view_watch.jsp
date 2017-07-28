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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
.styled-select select {
   background: transparent;
   border: none;
   border-radius: 4px;
   font-size: 14px;
   height: 29px;
   padding: 5px; /* If you add too much padding here, the options won't show in IE */
   width: 268px;
   box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}
</style>
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

<div class="w3-container" style="float: right">
	<c:set var="member" value="${ member }" />
	<input type="hidden" id="user_id" value="${ member.mem_id }">
	<input type="hidden" id="user_nickname" value="${ member.mem_nickname }">
</div>


<!-- select box -->
<div class="w3-container" >
	<div class="w3-main w3-content w3-center" style="max-width: 1200px; margin-top: 200px; margin-left: 300px">
		<form method="get" action=${URLs.URI_FURNITURE_WATCH_FULL }>
			<div class="w3-container w3-center" id="furarrselectbox">
				<table>
					<tr>
						<td style="width: 150px"><h3>방 종류</h3></td>
						<td>
							<div class="styled-select select" id="roomkindselect">
								<select name="room_kind_def_name">
									<option selected value="0" >전체</option>
									<c:forEach var="roomkind" items="${roomKind}">
										<option value="${roomkind}">${roomkind}</option>
									</c:forEach>
								</select>
							</div>
						</td>
						<td>　　</td>
						<td>　　</td>
					</tr>
					<tr>
						<td style="width: 150px" ><h3>컨셉</h3></td>
						<td>
							<div class="styled-select select" id="roomkindselect">
								<select name="concept_name">
									<option selected value="0">전체</option>
									<c:forEach var="conceptKind" items="${conceptKind}">
				      					<option value="${conceptKind}">${conceptKind}</option>
				      				</c:forEach>
								</select>
							</div>
						</td>
						<td>　　</td>
						<td>
							<button class="w3-button w3-subcolor w3-padding"  type="submit">검색하기</button>
						</td>
					</tr>
				</table>
				
			</div>
		</form>
	</div>

	<!-- First Grid(인기 가구 배치도 리스트) -->
	<div class="w3-container">
		<br>
		<c:forEach var="fal" items="${fur_arr_list }">
			<div class="w3-padding w3-margin-2">
				<div class=" w3-center">
      				<a href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${fal.fur_arr_plan_no}">
      					<div class="w3-col w3-border-top w3-padding">
      						<div class="w3-col m2 w3-padding-32">
      							No.<h1>${fal.fur_arr_plan_no}</h1>
      						</div>
      						<div class="w3-col m2 w3-display-container w3-center">
      							<img src="${fal.fur_arr_plan_img_loc }" alt="${fal.fur_arr_name }" style="width:90%">
      							<div class="w3-display-bottomright w3-margin-top w3-center">
      								<span class="w3-padding w3-subcolor w3-opacity"><b>${fal.fur_arr_room_kind }</b></span>
      							</div>
      						</div> 								
        					<div class="w3-col m3 w3-padding-64 w3-center">
        						<h5><b>${fal.fur_arr_name }</b></h5>
        					</div>
        					<div class="w3-col m1 w3-padding-64 w3-center">
        						<p>${fal.mem_id }</p>
        					</div>
        					<div class="w3-col m2 w3-padding-64 w3-center">
        						<p>${fal.fur_arr_con }</p>
        					</div>
        					<div class="w3-col m2 w3-padding-64 w3-center">
								<i class="material-icons" >favorite</i>${fal.fur_arr_plan_good_num}
								<i class="material-icons">attachment</i>${fal.fur_arr_plan_scrap_num }
								<i class="material-icons">cloud</i>${fal.fur_arr_plan_repl_num }
							</div>
						</div>
        			</a>
        		</div>
    		</div>
		</c:forEach>
	</div>
	
		
</div>
	<br><br>
</body>
</html>