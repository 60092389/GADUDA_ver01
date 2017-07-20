<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
body, h1, h2, h3, h4, h5, h6 {font-family: "Lato", sans-serif}
.w3-bar, h1, button { font-family: "Montserrat", sans-serif}
.fa-anchor, .fa-coffee { font-size: 200px }
</style>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#user_id').blur(function() {
		var mem_id = $('#user_id').val();
		$.ajax({
			url : "${URLs.URI_JOIN_IDCHK_FULL}",
			type : 'POST',
			dataType : "json",
			data : mem_id,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(result) {
				if (result.idchk == "1") {
					$("#idchk").css("color", "red").text("사용 할 수 없는 ID 입니다.");
				} else {
					$("#idchk").css("color", "blue").text("사용 할 수 있는 ID 입니다.");
				}
			}
		});
	});

	$('#mem_pass').keyup(function() {
		$('font[name=pw_chk]').text('');
	});

	$('#mem_pw_chk').keyup(function() {
		if ($('#mem_pass').val() != $('#mem_pw_chk').val()) {
			$('font[name=pw_chk]').text('');
			$('font[name=pw_chk]').text("비밀번호 다시 확인 바람");
		} else {
			$('font[name=pw_chk]').text('');
			$('font[name=pw_chk]').css("color", "blue").text("비밀번호를 확인 성공");
		}
	});
});
</script>
</head>
<body>
	<form method="post" class="w3-container" action=${ URLs.URI_JOIN_CHK_FULL }>
		<div class="w3-section">
			<label><b>ID or Email</b></label>
			<input name="mem_id" value='' id="user_id" placeholder="id or email" type="text" class="w3-input w3-border w3-margin-bottom" />
			<p id="idchk"></p>
			<br>
			<label><b>Password</b></label>
			<input name="mem_pw" id="mem_pass" value='' placeholder="Password" type="password" class="w3-input w3-border" />
			
			<label><b>Password</b></label>
			<input name="mem_pw_chk" id="mem_pw_chk" value='' placeholder="Password" type="password" class="w3-input w3-border" />
			<font name="pw_chk" size="2" color="red"></font>
			<br>
			<label><b>Name</b></label>
			<input name="mem_name" id="mem_name"value='' placeholder="UserName" type="text" class="w3-input w3-border"/>
			<button class="w3-button w3-block w3-orange w3-section w3-padding" type="submit">Join</button>
		</div>
	</form>
	
	<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
		<button onclick="document.getElementById('joinUser').style.display='none'"
				type="button" class="w3-button w3-red">Cancel</button>
	</div>
	
</body>
</html>