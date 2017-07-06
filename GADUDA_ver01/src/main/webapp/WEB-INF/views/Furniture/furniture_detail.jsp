<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가구 상세보기 페이지</title>
</head>
<body>


	<h1>가구 상세보기 페이지</h1>
	<h2>제품 기본 정보(가구 이미지 여러개 불러오는거 완성하기)</h2>
	<div>
		<table border="1">
			<thead>
				<th>이미지</th>
				<th>가구이름</th>
				<th>가구 가격</th>
				<th>가구브랜드</th>
				<th width="200px">가구 정보</th>
				<th>가구 컨셉</th>
				<th>가구 종류</th>
			</thead>

			<tbody>
				<c:set var="furdeVO" value="${furdeVO }"/>
					<tr>
						
						
						<td>
						<c:forEach var="pic_loc" items="${furdeVO.fur_pic_loc }">
						<img alt="가구사진" src="${pic_loc}"
							width="100px" height="100px"> ${pic_loc}
							
							
						</c:forEach>	
						</td>
						
						
						
						<td>${furdeVO.fur_name }</td>
						<td>${furdeVO.fur_price }</td>
						<td>${furdeVO.fur_brand_name }</td>
						<td width="200px">${furdeVO.fur_info }</td>
						<td>${furdeVO.fur_con }</td>
						<td>${furdeVO.fur_kind }</td>
					</tr>

			</tbody>
		</table>
	</div>

	<h2>제품 추가 정보</h2>
	<div>
		<table border="1">
			<thead>
				<th>좋아요 수<button>좋아요</button></th>
				<th>스크랩 수<button>스크랩</button></th>
			</thead>

			<tbody>
				<c:set var="furdeVO" value="${furdeVO }"/>
					<tr>
						<td>${furdeVO.fur_good_num }</td>
						<td>${furdeVO.fur_scrap_num }</td>
					</tr>
				
			</tbody>
		</table>
	</div>


	<h2>댓글</h2>
	<div>
		댓글 목록 주르륵
		<form role="form" action=# method="post">
			<div class="form-group">
				<label for="mem_pw">내용작성 >> </label> <input name="fur_repl"
					id="fur_repl" value='' placeholder="내용을 작성하세요" type="text"
					class="form-control" /> <input type="submit" value="작성" />
			</div>
		</form>
	</div>

	<h2>제품에 대한 평(크롤링)</h2>
	<div>제품평(나중에 완성)</div>

	<h2>비슷한 제품 추천</h2>
	<div>비슷한 제품들 목록(나중에 완성)</div>

	<h2>사이트별 가구 가격 비교</h2>
	<div>가격 비교 목록(나중에 완성)</div>



	

</body>
</html>