<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가두다</title>
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


<div class="w3-container ">

	<!--사이드 메뉴-->
	<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_mypage_sidebar.jsp" flush="false" />

	
	<!-- Page Container -->
	<div class="w3-padding-32 w3-main mainSection w3-content w3-center ">
		<h2><b>가구 배치도 스크랩 리스트</b></h2>
		<br>
		<c:forEach var="fasl" items="${fur_arr_scrap_list}">
			<div class="w3-padding-16 w3-main w3-content w3-margin-top w3-border-top">
				<table class="w3-container w3-table">
					<tr>
   						<th colspan="4" class="w3-blue w3-button w3-center"><a href="<%= URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL%>/?fur_arr_plan_no=${fasl.fur_arr_plan_no }"><b>No.${fasl.fur_arr_plan_no } 　${fasl.fur_arr_plan_name }</b></a></th>
  					</tr>
  					<tr>
	    				<th rowspan="3" class="w3-padding-32"><img alt="${fasl.fur_arr_plan_name }" src="${fasl.fur_arr_plan_img_loc }" height="200px"></th>
	   					<th class="w3-padding-32">${fasl.fur_arr_plan_mem_id }</th> 
	    				<th class="w3-padding-32">${fasl.fur_arr_plan_mem_nickname }</th>
	    				<th></th> 
  					</tr>
  					<tr>
	   	 				<th class="w3-padding-32"> ${fasl.fur_arr_plan_scrap_date } | ${fasl.fur_arr_plan_scrap_no } </th> 
	    				<th class="w3-padding-32">
	    					<div >
								<i class="material-icons" >favorite</i>${fasl.fur_arr_plan_good_count }
								<i class="material-icons">attachment</i>${fsl.fur_reply_count }
								<i class="material-icons">cloud</i>${fasl.fur_arr_plan_reply_count }
							</div>
	    				</th> 
	    				<th></th>
  					</tr>
  					<tr>
	    				<th class="w3-padding-32">${fasl.fur_arr_plan_concepts }</th> 
	    				<th class="w3-padding-32">${fasl.fur_arr_plan_room_kind_names}</th>
	    				<th><button class="w3-button w3-red" id="btn-scrap-delete" value="${fasl.fur_arr_plan_scrap_no }">삭제하기</button></th>
  					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>