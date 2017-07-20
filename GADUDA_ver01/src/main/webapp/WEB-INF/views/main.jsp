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
	
	<!-- Main사진 -->
	<div class="w3-display-container w3-content w3-wide w3-center" style="max-width:1500px;" id="home">
  		<img class="w3-image" src="/resources/Images/image.jpg" alt="가구 배치도" width="90%">
  		<div class="w3-display-middle w3-margin-top w3-center">
   		 	<h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>내방에 딱 맞을까?!</b></span></h1>
  		</div>
	</div>
	<br><br>

	<!-- First Grid(인기 가구 리스트) -->
	<div class="w3-container">
			<h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>인기가구 리스트</b></span></h1>
			<div>
				<c:forEach var="fur_list" items="${fur_list }">
					<div class="w3-quarter">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-subcolor w3-large w3-padding-32">
								<a href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fur_list.fur_no }"><h3><b>${fur_list.fur_name }</b></h3></a></li>
							<li class="w3-padding">
  									<img class="w3-image" src="${fur_list.fur_pic_loc }" alt="${fur_list.fur_name }" width="70%">
							</li>
							<li class="w3-padding"><h6><b>${fur_list.fur_price }</b>원</h6></li>
							<li class="w3-padding"><h6><b>${fur_list.fur_brand_name }</b></h6></li>
							<li class="w3-padding">
								<p><i class="material-icons">favorite</i>${fur_list.fur_good_num }
   		 							<i class="material-icons">attachment</i>${fur_list.fur_scrap_num }
   		 							<i class="material-icons">cloud</i>${fur_list.fur_repl_num }</p>
							</li>
						</ul>
					</div>
				</c:forEach>
			</div>
	</div>

	<!-- Second Grid(인기 가구 배치도 리스트) -->
	<div class="w3-container">
			<h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>인기 가구 배치도 리스트</b></span></h1>
			<div>
				<c:forEach var="fal" items="${fur_arr_list }">
					<div class="w3-quarter">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-subcolor w3-large w3-padding-32">
								<a href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${fal.fur_arr_plan_no}"><h3><b>${fal.fur_arr_name }</b></h3></a></li>
							<li class="w3-padding">
  									<img class="w3-image" src="${fal.fur_arr_plan_img_loc }" alt="${fal.fur_arr_name }" width="70%">
							</li>
							<li class="w3-padding"><h6><b>${fal.fur_arr_con }</b></h6></li>
							<li class="w3-padding"><h6><b>${fal.mem_id }</b>님의 배치도</h6></li>
							<li class="w3-padding"><h6><b>${fal.fur_arr_room_kind }</b></h6></li>
							<li class="w3-padding">
								<p><i class="material-icons">favorite</i>${fal.fur_arr_plan_good_num}
   		 							<i class="material-icons">attachment</i>${fal.fur_arr_plan_scrap_num }
   		 							<i class="material-icons">cloud</i>${fal.fur_arr_plan_repl_num }</p>
							</li>
						</ul>
					</div>
				</c:forEach>
			</div>
	</div>
	

	<!-- Footer -->
	<footer class="w3-center w3-white w3-padding-16">
	<p>
		made by sin park han jo</a>
	</p>
	</footer>
</body>
</html>
