<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif
}

.w3-bar, h1, button {
	font-family: "Montserrat", sans-serif
}

.fa-anchor, .fa-coffee {
	font-size: 200px
}
</style>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript">


$(document).ready(function(){
	var mem_id = $('#user_id').val();
	var mem_nickname = $('#user_nickname').val();
	var mem_profile_pic = $("#user_profile_pic").val();
	

	
	//스크랩삭제
	$("#btn-scrap-delete").click(function(){
		
		var fur_arr_scrap_no = $(this).val();

		
	 	var trans_object = {
			'fur_arr_scrap_no' : fur_arr_scrap_no
		} 

		//alert(mem_id + "/" + mem_nickname + "/" + fur_no);

		var trans_json = JSON.stringify(trans_object); //json으로 반환//

		$.ajax({
			url : "${URLs.URI_FURNITURE_ARR_SCRAP_DELETE_FULL }",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				//alert("좋아요 목록" + " / " + retVal.goodList[].mem_id);
				//alert("결과값 : " + retVal.result);
				
				if(retVal.resultNum == 1){
					alert("스크랩이 삭제 되었습니다.");
				}else if(retVal.resultNum == 2){
				}
				
				location.reload();
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);

			}
		
		});
		

	});
	
	
});

</script>


</head>
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

<div class="w3-container" style="float: right">
	<c:set var="member" value="${ member }" />
	<input type="hidden" id="user_id" value="${ member.mem_id }">
	<input type="hidden" id="user_nickname" value="${ member.mem_nickname }">
</div>


<div class="w3-container" style="float: center">
	<table cellspacing="0" border="1" class="tb_list tb_order_check _order_area">

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
				<td>
					<button id="btn-scrap-delete" value="${fasl.fur_arr_plan_scrap_no }">삭제하기</button>
				</td>
				<!-- <td><input type="button" name="scrapdelete" id="scrapdelete" value="삭제하기"></td> -->
				
			</tr>
		</c:forEach>
	</tbody>

</table>
</div>
</body>
</html>