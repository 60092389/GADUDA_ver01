<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 -->
	<form class="w3-container" method="post" action=${ URLs.URI_LOGIN_CHK_FULL }>
		<div class="w3-section">
			<label><b>ID or E-mail</b></label>
			<input class="w3-input w3-border w3-margin-bottom" type="text"
				placeholder="Enter user E-mail" name="mem_id" id="mem_id" required>
			<label><b>Password</b></label>
			<input class="w3-input w3-border" type="password" placeholder="Enter Password" name="mem_pw"
				id="mem_pw" required>
			<button class="w3-button w3-block w3-orange w3-section w3-padding" type="submit">Login</button>
			<input class="w3-check w3-margin-top" type="checkbox"
				checked="checked"> Remember me
		</div>
	</form>
	
	<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
		<button onclick="document.getElementById('loginUser').style.display='none'"
				type="button" class="w3-button w3-red">Cancel</button>
		<button onclick="document.getElementById('loginUser').style.display='none';
						document.getElementById('joinUser').style.display='block'"
				type="button" class="w3-button w3-green">회원가입하기</button>
		<span class="w3-right w3-padding w3-hide-small"> <a href="#">비밀번호 찾기</a></span>
	</div>
			
</body>
</html>