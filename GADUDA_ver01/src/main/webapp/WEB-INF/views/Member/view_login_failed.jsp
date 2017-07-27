<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가두다</title>
</head>
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	
	<!-- Main사진 -->
	<div class="w3-display-container w3-content w3-wide w3-center" style="max-width:90%;" id="home">
  		<img class="w3-image" src="/resources/Images/image.jpg" alt="가구 배치도" width="90%">
  		<div class="w3-display-middle w3-margin-top w3-center">
   		 	<h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min" ><a onclick="document.getElementById('loginUser').style.display='block'">로그인하고 이용하기</a></span></h1>
  		</div>
  	</div>	
</body>
</html>