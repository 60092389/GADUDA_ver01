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
<style>
.dropbtn {
    background: #fefefe;
    color: white;
    padding: 5px;
    color: black;
    font-size: 15px;
    height: 30px;
    width: 268px;
    border: none;
    cursor: pointer;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #fff;
    font-size: 14px;
    min-width: 268px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #eee}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown:hover .dropbtn {
    background-color: #eee;
}
</style>
</head>
<body>
<!-- header include -->
<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	
<div class="w3-container" style="float: right">
	<c:set var="mem" value="${ member }" />
	<input type="hidden" id="mem_id" value="${mem.mem_id }">
	<input type="hidden" id="user_nickname"value="${mem.mem_nickname }">
</div>


<!-- select box -->
<div class="w3-container" >
	<div class="w3-main w3-content w3-center" style="max-width: 1200px; margin-top: 200px; margin-left: 300px">
		<div class="w3-container w3-center" id="furarrselectbox">
				<table>
					<tr>
						<td style="width: 300px"><h3>ROOM</h3></td>
						<td style="width: 300px"><h3>CONCEPT</h3></td>
						<td style="width: 300px"><h3>FURNITURE</h3></td>
						<td style="width: 300px"><h3></h3></td>
					</tr>
					<tr>
						<td>
							<div class="styled-select select" id="roomkindselect">
								<div class="dropdown">
						    		<div class="w3-dropdown-hover">
						      			<button onclick="RoomKind()" class="dropbtn">방 종류</a></button>
						      		<div id="RoomkindDropdown" class="dropdown-content" class="dropdown-content w3-bar-block w3-hover-white w3-card-4">
						      			<a href="/furniture/fur_list_get" class="w3-bar-item w3-center">전체</a>
						      			<c:forEach var="roomkind" items="${roomKind}">
						      				<a href="/furniture/fur_list_get?room_kind_def_name=${roomkind}" class="w3-bar-item" id="c_room_kind" value="${roomkind}">${roomkind}</a>
						      			</c:forEach>
						      		</div>
						   		</div>
							</div>
						</td>
						<td>
							<div class="styled-select select" id="roomkindselect">
								<div class="dropdown">
						    		<div class="w3-dropdown-hover">
						      			<button onclick="ConceptKind()" class="dropbtn" >컨셉 종류</a></button>
						      		<div id="ConceptkindDropdown" class="dropdown-content" class="dropdown-content w3-bar-block w3-hover-white w3-card-4">
						      			<a href="/furniture/fur_list_get" class="w3-center w3-bar-item">전체</a>
						      			<c:forEach var="conceptKind" items="${conceptKind}">
						      				<a href="/furniture/fur_list_get?concept_name=${conceptKind}" class="w3-bar-item" value="${conceptKind}">${conceptKind}</a>
						      			</c:forEach>
						      		</div>
						   		</div>
							</div>
						</td>
						<td>
							<div class="styled-select select" id="roomkindselect">
								<div class="dropdown">
						    		<div class="w3-dropdown-hover">
						      			<button onclick="ConceptKind()" class="dropbtn" >가구 종류</a></button>
						      		<div id="ConceptkindDropdown" class="dropdown-content" class="dropdown-content w3-bar-block w3-hover-white w3-card-4">
						      			<a href="/furniture/fur_list_get" class="w3-center w3-bar-item">전체</a>
						      			<c:forEach var="furDefKind" items="${furDefKind}">
						      				<a href="/furniture/fur_list_get?fur_kind_def_name=${furDefKind}" class="w3-bar-item" value="${furDefKind}">${furDefKind}</a>
						      			</c:forEach>
						      		</div>
						   		</div>
							</div>
						</td>
					</tr>
				</table>
		</div>	
</div>
<br>
	
	<!-- First Grid(인기 가구 리스트) -->
	<div class="w3-container w3-margin-top">
		<div class="w3-padding w3-margin-2">
			<div>
      			<div class="w3-col w3-border-top">
      				<div class="w3-col m2 w3-center">
      					<a href="/furniture/fur_list_get?array_option=furno"><h5>가구 번호 ▼</h5></a>
      				</div>
      				<div class="w3-col m2 w3-center">
      					<h5>가구 사진</h5>
      				</div> 								
        			<div class="w3-col m3 w3-center">
        				<h5>가구 이름</h5>
        			</div>
        			<div class="w3-col m1 w3-center">
        				<h5>브랜드 이름</h5>
        			</div>
        			<div class="w3-col m2 w3-center">
        				<h5>가격</h5>
        			</div>
        			<div class="w3-col m1 w3-center">
        				<a href="/furniture/fur_list_get?array_option=good"><h5>LIKE ▼</h5></a>
					</div>
					<div class="w3-col m1 w3-center">
        				<div class="w3-bar-item"><a href="/furniture/fur_list_get?array_option=reply"><h5>REPL ▼</h5></a>
					</div>
				</div>
        	</div>
		</div>
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