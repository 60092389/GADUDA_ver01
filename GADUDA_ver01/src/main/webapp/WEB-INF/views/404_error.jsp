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
	<div class="w3-margin-left" style="margin-top: 400px;" id="home">
		<div class="w3-center">
			<h2>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</h2>
			<p>방문하시려는 페이지의 주소가 잘못 입력되었거나, 페이지의 주소가 변경/삭제 되어 요청하신 페이지를 찾을 수 없습니다.</p>
   		 	<h1 class="w3-text-white"><span class="w3-padding w3-black w3-opacity-min" ><a onclick="history.back();">이전 페이지로 돌아가기</a></span></h1>
		</div>
  	</div>
</div>
</body>
</html>
