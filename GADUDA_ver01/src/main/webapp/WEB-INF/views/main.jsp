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
	<div>

		<a href=<%=URLs.URI_MAIN_HOME%>>홈</a> 
		<a href=<%=URLs.URI_MAIN_TO_LIST%>>목록</a>
		<a href=<%=URLs.URI_MAIN_TO_ARR%>>배치</a>
		<a href=<%=URLs.URI_MAIN_TO_WATCH%>>구경</a>
		<a href=<%=URLs.URI_MAIN_TO_RECOM%>>추천</a>
		<a href=<%=URLs.URI_MAIN_TO_MYPAGE%>>마이페이지</a>

	</div>

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


			<form role="form" action=${ URLs.URI_DELETE_MEMBER_FULL }
				method="post">
				<div>
					<input type="submit" value="회원탈퇴">
				</div>
			</form>

		</c:otherwise>
	</c:choose>

	<table border="1">

		<h1>가구 리스트</h1>

		<thead>
			<th>이미지</th>
			<th>가구이름</th>
			<th>가구 가격</th>
			<th>가구브랜드</th>
			<th>좋아요 수</th>
			<th>스크랩 수</th>
			<th>댓글 수</th>
		</thead>

		<tbody>
			<c:forEach var="fur_list" items="${fur_list }">
				<tr>
					<td>${fur_list.fur_pic_loc }</td>
					<td>${fur_list.fur_name }</td>
					<td>${fur_list.fur_price }</td>
					<td>${fur_list.fur_brand_name }</td>
					<td>${fur_list.fur_good_num }</td>
					<td>스크랩</td>
					<td>${fur_list.fur_repl_num }</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>


</body>
</html>