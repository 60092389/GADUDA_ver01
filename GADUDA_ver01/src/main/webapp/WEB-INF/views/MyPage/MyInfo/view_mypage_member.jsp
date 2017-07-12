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
 <form role="form" action=${ URLs.URI_DELETE_MEMBER_FULL }
				method="post">
				<c:set var="member" value="${ member }" />
				
				<ul>
					<li><a href="${URLs.URI_FURNITURE_SCRAP_FULL }?mem_id=${member.mem_id}">가구스크랩</a></li>
					<li><a href="${URLs.URI_FURNITURE_ARR_SCRAP_FULL }?mem_id=${member.mem_id}">가구 배치도 스크랩</a></li>
				</ul>
	
				
	
				<div>
					<input type="submit" value="회원탈퇴">
				</div>
			</form>
			<form role="form" action=${ URLs.URI_UPDATE_MEMBER_FIRST_FULL}
				method="post">
				<div>
					<input type="submit" value="정보수정">
				</div>
			</form>
			<c:set var="member" value="${ member }" />
			
			
			<a href=${URLs.URI_MYPAGE_MEMBER_FOLLOWER_FULL }>${member.mem_id }가 팔로우 한 사람인원${follower}</a></br>
			<a href=${URLs.URI_MYPAGE_MEMBER_FOLLOWING_FULL }>${member.mem_id }를 팔로우 한 사람인원${following }</a>
</body>
</html>