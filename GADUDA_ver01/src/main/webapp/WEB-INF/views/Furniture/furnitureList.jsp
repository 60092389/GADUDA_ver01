<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_listview.css">
<link rel="stylesheet" href="/resources/Css/Bootstrap/bootstrap.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가두다</title>
<script type="text/javascript">
function RoomKind() {
    document.getElementById("RoomkindDropdown").classList.toggle("show");
}

function ConceptKind() {
    document.getElementById("ConceptkindDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

</script>
</head>
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	
	<div class="w3-container" style="float: right">
		<c:set var="mem" value="${ member }" />
		<input type="hidden" id="mem_id" value="${mem.mem_id }">
		<input type="hidden" id="user_nickname"value="${mem.mem_nickname }">
	</div>
<div class="w3-container w3-center mainSection">
	<h1><b>가구검색하기</b></h1>
  	<div>
  		<div class="dropdown">
    		<div class="w3-dropdown-hover">
      			<button onclick="RoomKind()" class="dropbtn ">방 종류</a></button>
      		<div id="RoomkindDropdown" class="dropdown-content" class="dropdown-content w3-bar-block w3-hover-white w3-card-4">
      			<a href="/furniture/fur_list_get" class="w3-center">전체</a>
      			<c:forEach var="roomkind" items="${roomKind}">
      				<a href="/furniture/fur_list_get?room_kind_def_name=${roomkind}" class="w3-bar-item w3-button" id="c_room_kind" value="${roomkind}">${roomkind}</a>
      			</c:forEach>
      		</div>
   		</div>
   		
   		<div class="dropdown">
    		<div class="w3-dropdown-hover">
      			<button onclick="ConceptKind()" class="dropbtn" >컨셉 종류</a></button>
      		<div id="ConceptkindDropdown" class="dropdown-content" class="dropdown-content w3-bar-block w3-hover-white w3-card-4">
      			<a href="/furniture/fur_list_get" class="w3-center">전체</a>
      			<c:forEach var="conceptKind" items="${conceptKind}">
      				<a href="/furniture/fur_list_get?concept_name=${conceptKind}" class="w3-bar-item w3-button" value="${conceptKind}">${conceptKind}</a>
      			</c:forEach>
      		</div>
   		</div>
   	</div>		
   		<br>

			<div class="w3-dropdown-hover" id="FurDropdown">
      		<button class="w3-button">Furniture</button>
      		<div class="w3-dropdown-content w3-bar-block w3-hover-white w3-card-4">
      			<c:forEach var="furDefKind" items="${furDefKind}">
      					<a href="/furniture/fur_list_get?fur_kind_def_name=${furDefKind}" class="w3-bar-item w3-button" value="${furDefKind}">${furDefKind}</a>
      				</c:forEach>
      		</div>
    	</div>
</div>
<br>
	<div class="w3-bar">
  	<p>종류별로 정렬해서 보세용~</p>
		<div class="w3-bar">
  			<div class="w3-bar-item"><a href="/furniture/fur_list_get?array_option=furno">Furniture No.</a></div>
  			<div class="w3-bar-item"><a href="/furniture/fur_list_get?array_option=good">Like</a></div>
  			<div class="w3-bar-item"><a href="/furniture/fur_list_get?array_option=reply">Comment</a></div>
		</div>
	</div>
</div>
<br>
	
	<!-- First Grid(인기 가구 리스트) -->
	<div class="w3-container">
		<br>
		<c:forEach var="fsl" items="${furList }">
			<div class="w3-padding w3-margin-2">
				<div class=" w3-center">
      				<a href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fsl.fur_no }">
      					<div class="w3-col w3-border-top w3-padding">
      						<div class="w3-col m2 w3-padding-32">
      							No.<h1>${fsl.fur_no }</h1>
      						</div>
      						<div class="w3-col m2">
      							<img src="${fsl.fur_pic_loc }" alt="${fsl.fur_no }" style="width:90%">
      						</div> 								
        					<div class="w3-col m3 w3-padding-64 w3-center">
        						<h5><b>${fsl.fur_name }</b></h5>
        					</div>
        					<div class="w3-col m1 w3-padding-64 w3-center">
        						<p>${fsl.fur_brand_name }</p>
        					</div>
        					<div class="w3-col m2 w3-padding-64 w3-center">
        						<p>${fsl.fur_price }원</p>
        					</div>
        					<div class="w3-col m2 w3-padding-64 w3-center">
								<i class="material-icons" >favorite</i>${fsl.fur_good_num }
								<i class="material-icons">attachment</i>${fsl.fur_scrap_num }
								<i class="material-icons">cloud</i>${fsl.fur_repl_num }
							</div>
						</div>
        			</a>
        		</div>
    		</div>
		</c:forEach>
	</div>

</div>

</body>
</html>