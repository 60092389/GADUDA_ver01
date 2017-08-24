<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_listview.css">
<link rel="stylesheet" href="/resources/Css/Bootstrap/bootstrap.css">

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
	<div class="w3-padding-32 w3-main mainSection w3-content w3-center ">
		<h2><b>가구 스크랩 리스트</b></h2>
		<br>
		<c:forEach var="fsl" items="${fur_scrap_list }">
		<div class="w3-padding-16 w3-main w3-content w3-margin-top w3-border-top">
			<table class="w3-container w3-table">
  				<tr>
   					 <th colspan="4" class="w3-center"><a class="w3-button w3-white" href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fsl.fur_no }"><h4>No.${fsl.fur_no }　${fsl.fur_name }</h4></a></th>
  				</tr>
  				<tr>
    				<th rowspan="3"><img alt="${fsl.fur_name }" src="${fsl.fur_pic_loc }" height="200px"></th>
   					<th></th> 
    				<th></th>
    				<th></th> 
  				</tr>
  				<tr>
   	 				<th>${fsl.fur_scrap_date }</th> 
    				<th></th>
    				<th>
    					<div>
							<i class="material-icons" >favorite</i>${fsl.fur_good_count }
							<i class="material-icons">attachment</i>${fsl.fur_scrap_count }
							<i class="material-icons">cloud</i>${fsl.fur_reply_count }
						</div>
    				</th> 
  				</tr>
  				<tr>
    				<th>${fsl.fur_brand_name } 　　 ${fsl.fur_price }won</th> 
    				<th></th>
    				<th><a  class="w3-button w3-deep-orange" id="btn-scrap-delete" value="${fsl.fur_scrap_no}">삭제하기</a></th>
  				</tr>
  
			</table>
		</div>
		</c:forEach>
	</div>
</div>

</body>
</html>