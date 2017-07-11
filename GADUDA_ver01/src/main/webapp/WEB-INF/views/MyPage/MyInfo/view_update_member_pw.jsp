<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
$(function(){
	$('#mem_pw').keyup(function(){
		$('font[name=pw_chk]').text('');
	});
	
	$('#mem_pw_chk').keyup(function(){
		if($('#mem_pw').val()!=$('#mem_pw_chk').val()){
			$('font[name=pw_chk]').text('');
			$('font[name=pw_chk]').text("비밀번호 다시 확인 바람!");
		}else{
			$('font[name=pw_chk]').text('');
			$('font[name=pw_chk]').text("비밀번호 일치!");
		}
});
});
</script>
</head>
<body>
<c:set var="member" value="${ member }" />

	<form role="form" method="post"
		action=${ URLs.URI_UPDATE_MEMBER_PW_FULL }>
		<div >
							<label for="mem_pw">새로운 비밀번호</label> <input name="mem_pw"
								id="mem_pw" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="mem_pw_chk">새로운 비밀번호 확인</label> <input name="mem_pw_chk"
								id="mem_pw_chk" value='' placeholder="Password" type="password"
								class="form-control" />
								<font name="pw_chk" size="2" color="red"></font>
						</div>
						<input type="hidden" value=${member.mem_id } name="mem_id" id="mem_id">
		
		<div >
			<input type="submit"
				class="btn btn-default btn-login-submit btn-block m-t-md"
				value="비밀번호 수정하기" />
		</div>
		</form>
</body>
</html>