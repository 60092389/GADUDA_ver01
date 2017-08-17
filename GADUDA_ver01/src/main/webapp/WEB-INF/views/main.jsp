<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>가두다</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">


<body>
<div>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	
  	<!-- 메인 사진 -->
	<div class="mainSection">
		<div class="w3-center w3-container">
			<img class="w3-image" src="/resources/Images/basic/main.jpg" style="height: 300px">
		</div>
	</div>
	
	<!-- 오늘의 가구 배치도 -->
	<div class="w3-container w3-center w3-margin-top">
		<div class="w3-container">
			<img class="w3-margin" src="/resources/Images/basic/furarr.jpg" style="height:50px">
		</div>
		<div class="w3-container w3-right-align">
			<a href=<%=URLs.URI_FURNITURE_WATCH_FULL%> >
				<img class="w3-margin" src="/resources/Images/basic/more.jpg" style="height:15px">
			</a>
		</div>
		<div class="w3-container">
			<div class="w3-col m1 ">
			<button style="margin-top: 150px" class="w3-button" onclick="plusDivsA(-1)">&#10094;</button></div>
			<c:forEach var="fal" items="${fur_arr_list }">
				<div class="arrSlides w3-col m3 w3-round w3-margin w3-padding w3-border">
					<table class="w3-container w3-padding" >
						<tr>
							<td colspan="3" style="height: 200px">
								<a href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${fal.fur_arr_plan_no}">
									<img src="${fal.fur_arr_plan_img_loc }" alt="${fal.fur_arr_name }" style="height:100%">
								</a>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="w3-right-align" style="font-size: 15px">
								<i class="material-icons">favorite</i>${fal.fur_arr_plan_good_num}
								<i class="material-icons">attachment</i>${fal.fur_arr_plan_scrap_num }
								<i class="material-icons">cloud</i>${fal.fur_arr_plan_repl_num }
							</td>
						</tr>
						<tr>
							<td colspan="2" class="w3-center"><b>　No${fal.fur_arr_plan_no}. ${fal.fur_arr_name }</b></td>
						</tr>
						<tr>
							<td class="w3-center"><b>${fal.mem_id }</b></td>
							<td class="w3-center">${fal.fur_arr_con }</td>
						</tr>
						<tr>
							<td></td>
							<td class="w3-center">${fal.fur_arr_room_kind }</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			<div class="w3-col m1 "><button style="margin-top: 150px" class="w3-button" onclick="plusDivsA(1)">&#10095;</button></div>
		</div>
	</div>
	
	<!-- 가운데로 데여로고 싶은데.. -->
	<div class="w3-container w3-center w3-margin-top w3-border-top w3-border-bottom" >
		<div class="w3-container">
			<img class="w3-margin" src="/resources/Images/basic/fur.jpg" style="height:50px">
		</div>
		<div class="w3-container w3-right-align">
			<a href=<%=URLs.URI_FURNITURE_LIST_LOOKAROUND_GET_FULL%> >
				<img class="w3-margin" src="/resources/Images/basic/more.jpg" style="height:15px">
			</a>
		</div>
		<div class="w3-container">
			<div class="w3-col m1 ">
			<button style="margin-top: 150px" class="w3-button" id="furbtnpre" onclick="plusDivs(-1)">&#10094;</button></div>
			<c:forEach var="fsl" items="${fur_list }">
				<div class="furSlides w3-col m3 w3-round w3-margin w3-padding w3-border">
					<table class="w3-container w3-padding" >
						<tr>
							<td colspan="3" style="height: 200px">
								<a href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fsl.fur_no }">
									<img src="${fsl.fur_pic_loc }" alt="${fsl.fur_pic_loc  }" style="height:100%; ">
								</a>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="w3-right-align" style="font-size: 15px">
								<i class="material-icons">favorite</i>${fsl.fur_good_num }
								<i class="material-icons">attachment</i>${fsl.fur_scrap_num }
								<i class="material-icons">cloud</i>${fsl.fur_repl_num }
							</td>
						</tr>
						<tr>
							<td colspan="2"><b>　No${fsl.fur_no }. ${fsl.fur_name }</b></td>
						</tr>
						<tr>
							<td colspan="2">${fsl.fur_brand_name } /${fsl.fur_price }원</td>
						</tr>
					</table>
				</div>
			</c:forEach>
			<div class="w3-col m1 "><button style="margin-top: 150px" class="w3-button" onclick="plusDivs(1)">&#10095;</button></div>
		</div>
	</div>
</div>
<!-- footer include -->
<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />

<!-- 도로록 자바스크립트 -->
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
 	showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("furSlides");
  if (n >= x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  x[slideIndex-1].style.display = "block";  
  x[slideIndex].style.display = "block";  
  x[slideIndex+1].style.display = "block"; 
}

var slideIndexA = 1;
showDivsA(slideIndexA);

function plusDivsA(n) {
 	showDivsA(slideIndexA += n);
}

function showDivsA(n) {
  var i;
  var a = document.getElementsByClassName("arrSlides");
  if (n >= a.length) {slideIndexA = 1}    
  if (n < 1) {slideIndexA = a.length}
  for (i = 0; i < a.length; i++) {
     a[i].style.display = "none"; 
  }
  a[slideIndexA-1].style.display = "block";  
  a[slideIndexA].style.display = "block"; 
  a[slideIndexA+1].style.display = "block";  
}
</script>
</body>
</html>
