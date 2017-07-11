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
<h1>나를 팔로우한 리스트</h1>

		<thead>
			<th>나를 팔로우한 아이디</th>
			<th>내가 팔로우 했는지 여부</th>
		</thead>

		<tbody>
			<c:forEach var="following_list" items="${following_list }">
			
				<tr>
					<td>${following_list}</td>
					<td>${following_available }</td>
				</tr>
				
			</c:forEach>
		</tbody>

	</table>
</body>
</html>