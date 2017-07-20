<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<style>
body, h1, h2, h3, h4, h5, h6 {font-family: "Lato", sans-serif}
.w3-bar, h1, button { font-family: "Montserrat", sans-serif}
.fa-anchor, .fa-coffee { font-size: 200px }
</style>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
		
		var fur_scrap_no = $(this).val();

	 	var trans_object = {
			'fur_scrap_no' : fur_scrap_no
		} 
		//alert(mem_id + "/" + mem_nickname + "/" + fur_no);
		var trans_json = JSON.stringify(trans_object); //json으로 반환//
		$.ajax({
			url : "${URLs.URI_FURNITURE_SCRAP_DELETE_FULL}",
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

<div class="w3-container ">

	<!--사이드 메뉴-->
	<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_mypage_sidebar.jsp" flush="false" />
	
	<!-- Page Container -->
	<div class="w3-main w3-content" style="max-width: 1200px; margin-top: 200px; margin-left: 300px">

	<table cellspacing="0" border="1" class="tb_list tb_order_check _order_area">

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
		</thead>
	
		<tbody>
			<c:forEach var="fsl" items="${fur_scrap_list }">
				<tr>
					<td><img alt="가구사진" src="${fsl.fur_pic_loc }" width="100px" height="100px"></td>
					<td>${fsl.fur_name }</td>
					<td>${fsl.fur_price }</td>
					<td>${fsl.fur_brand_name }</td>
					<td>${fsl.fur_scrap_date }</td>
					<td>${fsl.fur_good_count }</td>
					<td>${fsl.fur_scrap_count }</td>
					<td>${fsl.fur_reply_count }</td>
					<td><%-- <a href="${URLs.URI_FURNITURE_SCRAP_DELETE_FULL }?fur_scrap_no=${fsl.fur_scrap_no}">삭제하기</a> --%>
					<button id="btn-scrap-delete" value="${fsl.fur_scrap_no}">삭제하기</button></td>
					<!-- <td><input type="button" name="scrapdelete" id="scrapdelete" value="삭제하기"></td> -->
				
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>

</body>
</html>