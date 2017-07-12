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

<form method="get" action=${URLs.URI_FURNITURE_WATCH_FULL }>
<table border=1>
<tr><th>방종류</th>
<td><select name="room_kind_def_name">
<option selected value="0" >전체</option>
<option value="침실">침실</option>
<option value="거실">거실</option>
<option value="서재">서재</option>
</select>
</td>
</tr>
<tr><th>컨셉</th>
<td><select name="concept_name">
<option selected value="0">전체</option>
<option value="내추럴">내추럴</option>
<option value="모던">모던</option>
<option value="미니멀">미니멀</option>
<option value="시골풍">시골풍</option>
<option value="앤틱">앤틱</option>
<option value="북유럽">북유럽</option>
<option value="동양적">동양적</option>

</select>
</td>
</tr>
</table>
<input type="submit" value="검색">
</form>

<!-- <h2>정렬기준</h2>
<table border="1">
   <thead>
      <th><a href="/furniture/fur_list_get?array_option=furno">가구번호순</a></th>
      <th><a href="/furniture/fur_list_get?array_option=good">좋아요순</a></th>
      <th><a href="/furniture/fur_list_get?array_option=reply">댓글순</a></th>
   </thead>
</table> -->
<table border="1">

		<h1>가구배치도 리스트</h1>

		<thead>
			<th>가구배치도이미지</th>
			<th>가구배치도이름</th>
			<th>작성자</th>
			<th>가구배치도 컨셉</th>
			<th>가구배치도 방종류</th>
			
			<th>좋아요 수</th>
			<th>스크랩 수</th>
			<th>댓글 수</th>
			<th>좋아요 체크</th>
		</thead>

		<tbody>
			<c:forEach var="fal" items="${fur_arr_list }">
				<tr>
					<td><img alt="가구배치돈사진" src="${fal.fur_arr_plan_img_loc }" width="100px" height="100px">
					${fal.fur_arr_plan_img_loc }</td>
					<td><a href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${fal.fur_arr_plan_no}">${fal.fur_arr_name }</a></td>
					
					<td>${fal.mem_id }</td>
					<td>${fal.fur_arr_con }</td>
					<td>${fal.fur_arr_room_kind }</td>
					
					<td>${fal.fur_arr_plan_good_num }</td>
					<td>${fal.fur_arr_plan_scrap_num }</td>
					<td>${fal.fur_arr_plan_repl_num }</td>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</body>
</html>