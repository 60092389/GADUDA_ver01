<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가구 상세보기 페이지</title>
</head>
<body>
	<table border="1">

		<h1>가구 상세보기 페이지</h1>

		<thead>
			<th>이미지</th>
			<th>가구이름</th>
			<th>가구 가격</th>
			<th>가구브랜드</th>
			<th>가구 정보</th>
			<th>좋아요 수</th>
			<th>스크랩 수</th>
			<th>댓글 수</th>
		</thead>

		<tbody>
			<c var="furVO" items="${furVO }">
				<tr>
					<td><img alt="가구사진" src="${furVO.fur_pic_loc }" width="100px" height="100px">
					${furVO.fur_pic_loc }</td>
					<td>${furVO.fur_name }</td>
					<td>${furVO.fur_price }</td>
					<td>${furVO.fur_brand_name }</td>
					<td>${furVO.fur_info }</td>
					<td>${furVO.fur_good_num }</td>
					<td>${furVO.fur_scrap_num }</td>
					<td>${furVO.fur_repl_num }</td>
				</tr>
			</c>
		</tbody>

	</table>
</body>
</html>