<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:set var="member" value="${ member }" />
	<c:choose>
		<c:when test="${ empty member }">
			<form role="form" action=${URLs.URI_LOGIN_FULL } method="post">
				<div>
					<input type="submit" value="login" />
				</div>
			</form>
			<form role="form" action=${ URLs.URI_JOIN_VIEW_FULL } method="post">
				<div>
					<input type="submit" value="join" />
				</div>
			</form>
		</c:when>
		<c:otherwise>
		
		${ member.mem_name }님 환영합니다.
			<form role="form" action=${ URLs.URI_LOGOUT_FULL } method="post">
				<div>
					<input type="submit" value="logout" />
				</div>
			</form>
			
			
			<form role="form" action=${ URLs.URI_DELETE_MEMBER_FULL } method="post">
				<div>
				<input type="submit" value="회원탈퇴">
				</div>
			</form>
			
		</c:otherwise>
	</c:choose>
</body>
</html>