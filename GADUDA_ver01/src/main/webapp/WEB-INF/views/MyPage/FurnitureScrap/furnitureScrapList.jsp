<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가구스크랩</title>

<script type="text/javascript">


</script>


</head>
<body>


<table border ="1">

	<thead>
		<th>이미지</th>
		<th>가구이름</th>
		<th>가구 가격</th>
		<th>가구브랜드</th>
		<th>스크랩 작성날짜</th>
		<th>좋아요 수</th>
		<th>스크랩 수</th>
		<th>댓글 수</th>
		<th></th>
	</thead>furnitureScrapList.jsp
	
	<tbody>
		<c:forEach var="fsl" items="${fur_scrap_list }">
			<tr>
				<td><img alt="가구사진" src="${fsl.fur_pic_loc }" width="100px" height="100px">
					${fsl.fur_pic_loc }</td>
				<td>${fsl.fur_name }</td>
				<td>${fsl.fur_price }</td>
				<td>${fsl.fur_brand_name }</td>
				<td>${fsl.fur_scrap_date }</td>
				<td>${fsl.fur_good_count }</td>
				<td>${fsl.fur_scrap_count }</td>
				<td>${fsl.fur_reply_count }</td>
				<td><a href="${URLs.URI_FURNITURE_SCRAP_DELETE_FULL }?fur_scrap_no=${fsl.fur_scrap_no}">삭제하기</a></td>
				<!-- <td><input type="button" name="scrapdelete" id="scrapdelete" value="삭제하기"></td> -->
				
			</tr>
		</c:forEach>
	</tbody>

</table>


</body>
</html>