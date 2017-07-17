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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

<div class="w3-container" style="float: right">
	<c:set var="member" value="${ member }" />
	<input type="hidden" id="user_id" value="${ member.mem_id }">
	<input type="hidden" id="user_nickname" value="${ member.mem_nickname }">
</div>

<form method="get" action=${URLs.URI_FURNITURE_WATCH_FULL }>
<table border=1>
<tr><th>방종류</th>
<td><select name="room_kind_def_name">
<option selected value="0" >전체</option>
<option value="침실">침실</option>
<option value="거실">거실</option>
<option value="서재">서재</option>
</select>
</td>
</tr>
<tr><th>컨셉</th>
<td><select name="concept_name">
<option selected value="0">전체</option>
<option value="내추럴">내추럴</option>
<option value="모던">모던</option>
<option value="미니멀">미니멀</option>
<option value="시골풍">시골풍</option>
<option value="앤틱">앤틱</option>
<option value="북유럽">북유럽</option>
<option value="동양적">동양적</option>

</select>
</td>
</tr>
</table>
<input type="submit" value="검색">
</form>

<!-- <h2>정렬기준</h2>
<table border="1">
   <thead>
      <th><a href="/furniture/fur_list_get?array_option=furno">가구번호순</a></th>
      <th><a href="/furniture/fur_list_get?array_option=good">좋아요순</a></th>
      <th><a href="/furniture/fur_list_get?array_option=reply">댓글순</a></th>
   </thead>
</table> -->
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