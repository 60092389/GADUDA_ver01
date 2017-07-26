<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="httpRequest.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$('#mem_pas').keyup(function() {
		$('font[name=del_pw_chk]').text('');
	});

	$('#mem_pas_chk').keyup(function() {
		if ($('#mem_pas').val() != $('#mem_pas_chk').val()) {
			$('font[name=del_pw_chk]').text('');
			$('font[name=del_pw_chk]').text("비밀번호 다시 확인 바람");
		} else {
			$('font[name=del_pw_chk]').text('');
			$('font[name=del_pw_chk]').css("color", "blue").text("비밀번호를 확인 성공");
		}
	});
});
</script>
</head>
<body>
<c:set var="member" value="${ member }" />

<form class="w3-container" method="post" action=${ URLs.URI_DELETE_MEMBER_CHK_FULL }>
	<input class="w3-input w3-border w3-margin-bottom" type="hidden" name="mem_id" value=${ member.mem_id }>

	<label for="mem_nickname"><b>비밀번호</b></label>
	<input class="w3-input w3-border w3-margin-bottom" name="mem_pw" id="mem_pas" value='' placeholder="비밀번호 확인" type="password"/>	
	
	<label for="mem_nickname"><b>비밀번호 확인</b></label>
	<input class="w3-input w3-border w3-margin-bottom" name="mem_pas_chk" id="mem_pas_chk" value='' placeholder="비밀번호 확인" type="password"/>			
	<br>
	
	<font name="del_pw_chk" size="2" color="red"></font>
	
	<button type="submit" class="w3-button w3-block w3-orange w3-text-white w3-section w3-padding" type="submit" >탈퇴하기</button>
</form>

<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
	<button onclick="document.getElementById('delMember').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
</div>

</body>
</html>