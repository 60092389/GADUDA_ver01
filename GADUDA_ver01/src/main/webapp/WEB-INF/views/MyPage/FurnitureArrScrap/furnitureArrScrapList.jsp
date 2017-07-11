<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<table border ="1">

	<thead>
		<th>가구배치도이미지</th>
		<th>가구배치도제목</th>
		<th>가구배치도 작성자닉네임</th>
		<th>가구배치도 작성자아이디</th>
		<th>가구배치도 컨셉</th>
		<th>가구배치도 방종류</th>
		<th>좋아요 수</th>
		<th>스크랩 수</th>
		<th>댓글 수</th>
		<th>가구배치도 스크랩 날짜</th>
		<th>가구배치도 스크랩번호</th>
		<th>가구배치도 번호</th>
		<th>삭제하기</th>
	</thead>
	
	<tbody>
		<c:forEach var="fasl" items="${fur_arr_scrap_list}">
			<tr>
				<td><img alt="가구배치도사진" src="${fasl.fur_arr_plan_img_loc }" width="200px" height="200px">
					${fasl.fur_arr_plan_img_loc }</td>
				<td>${fasl.fur_arr_plan_name }</td>
				<td>${fasl.fur_arr_plan_mem_nickname }</td>
				<td>${fasl.fur_arr_plan_mem_id }</td>
				<td>${fasl.fur_arr_plan_concepts }</td>
				<td>${fasl.fur_arr_plan_room_kind_names}</td>
				<td>${fasl.fur_arr_plan_good_count }</td>
				<td>${fasl.fur_arr_plan_scrap_count }</td>
				<td>${fasl.fur_arr_plan_reply_count }</td>
				<td>${fasl.fur_arr_plan_scrap_date }</td>
				<td>${fasl.fur_arr_plan_scrap_no }</td>
				<td>${fasl.fur_arr_plan_no }</td>
				<td><a href="${URLs.URI_FURNITURE_ARR_SCRAP_DELETE_FULL }?fur_arr_plan_scrap_no=${fasl.fur_arr_plan_scrap_no }">삭제하기</a></td>
				<!-- <td><input type="button" name="scrapdelete" id="scrapdelete" value="삭제하기"></td> -->
				
			</tr>
		</c:forEach>
	</tbody>

</table>

</body>
</html>