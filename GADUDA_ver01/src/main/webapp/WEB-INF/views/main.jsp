<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif
}

.w3-bar, h1, button {
	font-family: "Montserrat", sans-serif
}

.fa-anchor, .fa-coffee {
	font-size: 200px
}
</style>
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

	<!-- First Grid(인기 가구 리스트) -->
	<div class="w3-container">
		<div class="w3-container" style="float: center">
			<h1>인기 가구 리스트</h1>
			<div>
				<c:forEach var="fur_list" items="${fur_list }">
					<div class="w3-quarter">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-basiccolor w3-xlarge w3-padding-32"><a
								href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fur_list.fur_no }"><b>${fur_list.fur_name }</b></a></li>
							<li class="w3-padding-16"><img alt="가구사진"
								src="${fur_list.fur_pic_loc }" width="100px" height="100px"></li>
							<li class="w3-padding-16"><b>${fur_list.fur_price }</b>원</li>
							<li class="w3-padding-16"><b>${fur_list.fur_brand_name }</b></li>
							<li class="w3-padding-16"><i class="material-icons">favorite</i><b>${fur_list.fur_good_num }</b></li>
							<li class="w3-padding-16"><i class="material-icons">attachment</i><b>${fur_list.fur_scrap_num }</b></li>
							<li class="w3-padding-16"><i class="material-icons">cloud</i><b>${fur_list.fur_repl_num }</b></li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- Second Grid(인기 가구 리스트) -->
	<div class="w3-container">
		<div class="w3-container" style="float: center">
			<h1>인기 가구 배치도 리스트</h1>
			<div>
				<c:forEach var="fal" items="${fur_arr_list }">
					<div class="w3-quarter">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-basiccolor w3-xlarge w3-padding-32"><a
								href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${fal.fur_arr_plan_no}"><b>${fal.fur_arr_name }</b></a></li>
							<li class="w3-padding-16"><img alt="가구배치도사진"
								src="${fal.fur_arr_plan_img_loc }" width="100px" height="100px"></li>
							<li class="w3-padding-16"><b>${fal.mem_id }</b>님의 배치도</li>
							<li class="w3-padding-16"><b>${fal.fur_arr_con }</b></li>
							<li class="w3-padding-16"><b>${fal.fur_arr_room_kind }</b></li>
							<li class="w3-padding-16"><i class="material-icons">favorite</i><b>${fal.fur_arr_plan_good_num}</b></li>
							<li class="w3-padding-16"><i class="material-icons">attachment</i><b>${fal.fur_arr_plan_scrap_num }</b></li>
							<li class="w3-padding-16"><i class="material-icons">cloud</i><b>${fal.fur_arr_plan_repl_num }</b></li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	

	<!-- Footer -->
	<footer class="w3-center w3-white w3-padding-16">
	<p>
		made by <a href="https://www.w3schools.com/w3css/default.asp"
			title="W3.CSS" target="_blank" class="w3-hover-text-green">sin
			park han jo</a>
	</p>
	</footer>
</body>
</html>
