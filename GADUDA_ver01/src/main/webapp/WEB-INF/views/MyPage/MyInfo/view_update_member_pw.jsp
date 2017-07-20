<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="httpRequest.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$('#mem_pa').keyup(function() {
		$('font[name=pw_chk]').text('');
	});

	$('#mem_pw_chk').keyup(function() {
		if ($('#mem_pa').val() != $('#mem_pw_chk').val()) {
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
<c:set var="member" value="${ member }"/>
<form method="post" class="w3-container" action=${ URLs.URI_UPDATE_MEMBER_PW_FULL }>
	<div class="w3-section">
		<label><b>NEW Password</b></label>
		<input name="mem_pw" id="mem_pa" value='' placeholder="Password" type="password" class="w3-input w3-border" />
			
		<label><b>Password check</b></label>
		<input name="mem_pw_chk" id="mem_pw_ch" value='' placeholder="Password" type="password" class="w3-input w3-border" />
		<font name="pw_chk" size="2" color="red"></font>
		<input type="hidden" value=${member.mem_id } name="mem_id" id="mem_id">	
		<br>
	</div>
	
	<button class="w3-button w3-block w3-subcolor w3-section w3-padding" type="submit">변경하기</button>
	</form>
	<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
		<button onclick="document.getElementById('pwMod').style.display='none'"
				type="button" class="w3-button w3-red">Cancel</button>
	</div>
</body>
</html>