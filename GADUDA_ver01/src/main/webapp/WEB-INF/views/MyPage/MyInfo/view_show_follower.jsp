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
<table border="1">

		<h1>팔로우한 리스트</h1>

		<thead>
			<th>팔로우한 아이디</th>
			
		</thead>

		<tbody>
			<c:forEach var="follower_list" items="${follower_list }">
				<tr>
					<td>${follower_list }</td>
					
				</tr>
			</c:forEach>
		</tbody>

	</table>
</body>
</html>