<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.gaduda.common.URLs" %> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="member" value="${ member }" />

<form class="w3-container" method="post" action=${ URLs.URI_UPDATE_MEMBER_CHK_FULL }>
	<input class="w3-input w3-border w3-margin-bottom" type="hidden" name="mem_id" value=${ member.mem_id }>

	<label for="mem_nickname"><b>닉네임</b></label>
	<input class="w3-input w3-border w3-margin-bottom" name="mem_nickname" id="mem_nickname" value='' placeholder=${ member.mem_nickname } type="text"/>
	<br>
	<div class="form-group">
		<input type="radio" name="mem_sex" value="남"><b>남</b>
		<input type="radio" name="mem_sex" value="여"><b>여</b>
	</div>
	<br>				
	<label for="mem_intro"><b>자기소개</b></label>
	<input class="w3-input w3-border w3-margin-bottom" name="mem_intro" id="mem_intro" value='' placeholder=${ member.mem_intro } type="text"/>		
	<br>
	<label for="mem_birth"><b>생년월일</b></label>
	<input type="date" placeholder="DD MM YYYY" name="mem_birth" class="w3-input w3-border w3-margin-bottom" >
	<br>				
		
	<button type="submit" class="w3-button w3-block w3-orange w3-text-white w3-section w3-padding" type="submit" >변경하기</button>
</form>

<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
	<button onclick="document.getElementById('profMod').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
	<button class="w3-button w3-subcolor" onclick="document.getElementById('profMod').style.display='none'; document.getElementById('pwMod').style.display='block'" method="post" type="submit">비밀번호 수정</button>
	<button class="w3-button w3-white w3-hover-white" onclick="document.getElementById('profMod').style.display='none'; document.getElementById('delMember').style.display='block'" method="post" type="submit">회원 탈퇴</button>
</div>


</body>
</html>