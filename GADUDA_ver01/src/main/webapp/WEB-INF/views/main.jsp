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

<link rel="stylesheet" href="/resources/Css/Bootstrap/bootstrap.css">

<body>
<div>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	
	<!-- Main사진 -->
	<div class="w3-display-container w3-content w3-wide w3-center" style="max-width:90%;" id="home">
  		<img class="w3-image" src="/resources/Images/image.jpg" alt="가구 배치도" width="90%">
  		<div class="w3-display-middle w3-margin-top w3-center">
   		 	<h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>내방에 딱 맞을까?!</b></span></h1>
  		</div>
  		
  		
	</div>
	<br><br>
	<!-- 가운데로 데여로고 싶은데.. -->
	<div class="w3-container">
		<!-- First Grid(인기 가구 리스트) -->
		<div>
			<div class="w3-col w3-center">
				<h3 class="w3-left-align"><b>인기 가구 리스트</b></h3>
				<c:forEach var="fsl" items="${fur_list }">
					<div class="w3-col m3 w3-padding w3-card w3-hover-shadow">
						<div class=" w3-center">
	      					<div class="w3-display-container w3-center">
	      						<a href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fsl.fur_no }">
	      							<img src="${fsl.fur_pic_loc }" alt="${fsl.fur_no }" style="width:90%">
	        						<div class="w3-display-bottomleft w3-padding w3-center">
	        							<div>
	        								<h5><b>${fsl.fur_name }</b></h5>
	        								<p>${fsl.fur_brand_name } 　${fsl.fur_price }원</p>
	        							</div>
	        						</div><br>
	        						
	        						<div class="w3-padding w3-display-bottomright">
										<i class="material-icons" >favorite</i>${fsl.fur_good_num }
										<i class="material-icons">attachment</i>${fsl.fur_scrap_num }
										<i class="material-icons">cloud</i>${fsl.fur_repl_num }
									</div>
									<br>
	        					</a>
	        				</div>
	    				</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<br><br>
	
	<div class="w3-container">
	<!-- Second Grid(인기 가구 배치도 리스트) -->
		<div>
			<div class="w3-center">
				<h3 class="w3-left-align"><b>인기 가구 배치도 리스트</b></h3>
				<c:forEach var="fal" items="${fur_arr_list }">
					<div class="w3-col m3 w3-padding w3-card w3-hover-shadow">
						<div class="w3-row-padding w3-center">
      						<div class="w3-display-container w3-center">
      							<a href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${fal.fur_arr_plan_no}">
        							<div class="w3-display-topleft w3-padding">
        								<h4><b>No${fal.fur_arr_plan_no}. ${fal.fur_arr_name }</b></h4><br><br>
        								<p class="w3-display-right"><b>${fal.mem_id }</b>님의 배치도 <br>
        								<b>${fal.fur_arr_con }/${fal.fur_arr_room_kind }</b></p>
        							</div><br><br><br><br><br>
        							<img src="${fal.fur_arr_plan_img_loc }" alt="${fal.fur_arr_name }" style="width:60%"><br><br>
        							<div class="w3-padding w3-display-bottomright">
										<i class="material-icons" >favorite</i>${fal.fur_arr_plan_good_num}
										<i class="material-icons">attachment</i>${fal.fur_arr_plan_scrap_num }
										<i class="material-icons">cloud</i>${fal.fur_arr_plan_repl_num }
									</div>
									<br>
        						</a>
        					</div>
    					</div>
					</div>
				</c:forEach>
			</div>
		</div>
	<br><br>
	</div>
</div>	
</body>
</html>
