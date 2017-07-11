<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가구스크랩</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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

<c:set var="member" value="${ member }" />
<input type="hidden" id="user_id" value="${member.mem_id }"/>
<input type="hidden" id="user_nickname" value="${member.mem_nickname }"/>


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
				<td><%-- <a href="${URLs.URI_FURNITURE_SCRAP_DELETE_FULL }?fur_scrap_no=${fsl.fur_scrap_no}">삭제하기</a> --%>
					<button id="btn-scrap-delete" value="${fsl.fur_scrap_no}">삭제하기</button>
				</td>
				<!-- <td><input type="button" name="scrapdelete" id="scrapdelete" value="삭제하기"></td> -->
				
			</tr>
		</c:forEach>
	</tbody>

</table>


</body>
</html>