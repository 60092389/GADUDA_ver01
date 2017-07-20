<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:set var="member" value="${ member }" />

<div class="w3-container w3-center">
	<image src="${member.mem_profile_pic }" width="40%" class="img-circle"></image>
	<br><br><br>
	<p>${ member.mem_id } 님의 프로필 사진</p>
	
	<form action="${URLs.URI_MYPAGE_MEMBER_IMAGE_FULL }" method="post" enctype="multipart/form-data">
 		<input type="file" name="file">
		<input class="w3-button w3-grey" type="submit" value="사진 변경">
	</form>
	<br>
	
</div>
<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
	<button onclick="document.getElementById('proficMod').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
	<button class="w3-button w3-orange" onclick="document.getElementById('proficMod').style.display='none'; document.getElementById('profMod').style.display='block'" method="post" type="submit">프로필 수정</button>
</div>
</body>
</html>