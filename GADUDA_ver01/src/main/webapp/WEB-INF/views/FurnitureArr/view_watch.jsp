<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	var mem_nickname = $('#user_nickname').val();
	var mem_profile_pic = $("#user_profile_pic").val();
	
	
	//좋아요 누를시
	$('.btn-fur-arr-good').click(function(){
		
		var mem_id = $('#user_id_li').val();
		var fur_arr_plan_no = $(this).val();
		var now_date = new Date();
		
		
		var trans_object = {
			'mem_id' : mem_id,
			'mem_nickname' : mem_nickname,
			'fur_arr_plan_no' : fur_arr_plan_no,
			'mem_profile_pic' : mem_profile_pic,
			'fur_arr_plan_good_date' : now_date
		}
		

		var trans_json = JSON.stringify(trans_object); //json으로 반환//

		$.ajax({
			url : "${URLs.URI_FURNITURE_ARR_GOOD_UP_FULL}",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				alert("좋아요 결과" + " / " + retVal.val);
				
				location.reload();
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);
				location.reload();
			}
		
		});
		

	});
	
	
	//좋아요 갯수 누르면 좋아요목록 보이기
	$('.good_list').click('show.bs.modal', function(){
		
		$('#myModal').focus();
		var fur_arr_plan_no = $(this).val();
		
		var trans_object = {
			'fur_arr_plan_no' : fur_arr_plan_no

		}

		var trans_json = JSON.stringify(trans_object); //json으로 반환//

		$.ajax({
			url : "${URLs.URI_FURNITURE_ARR_GOOD_LIST_FULL}",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				
				$(".good_list_show").html("");
				
				for(var i =0; i < retVal.goodList.length; i++){ 
					$(".good_list_show").append("<div>");
					$(".good_list_show").append("<p><b>" + retVal.goodList[i].mem_id +"</b>　"+retVal.goodList[i].mem_nickname+"</p>");
					//$(".good_list_show").append("<h6>[" + retVal.goodList[i].fur_arr_plan_good_date+"]</h6>");
					$(".good_list_show").append("</div>");
				}
				
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);

			}
		
		});
		

	});
	
	//스크랩하기
	$(".btn-scrap-add").click(function(){
		
		var fur_arr_plan_no = $(this).val();
		var mem_id = $('#user_id_li').val();
		var write_id = $('#write_id').val();
		
			var trans_object = {
					'mem_id' : mem_id,
					'fur_arr_plan_no' : fur_arr_plan_no
				}
			var trans_json = JSON.stringify(trans_object); //json으로 반환//
			$.ajax({
				url : "${URLs.URI_FURNITURE_ARR_SCRAP_ADD_FULL}",
				type : 'POST',
				dataType : 'json',
				data : trans_json,
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(retVal){
					//alert("좋아요 목록" + " / " + retVal.goodList[].mem_id);
					//alert("결과값 : " + retVal.result);
					
					if(retVal.resultNum == 1){
						alert("스크랩에 추가 되었습니다.");
					}else if(retVal.resultNum == 2){
						alert("이미 스크랩한 가구배치도입니다.");
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
<style>
.styled-select select {
   background: transparent;
   border: none;
   border-radius: 4px;
   font-size: 14px;
   height: 29px;
   padding: 5px; /* If you add too much padding here, the options won't show in IE */
   width: 268px;
   box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.modal-backdrop {
	height : 20px !important
}

</style>
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

<!-- 로그인 정보 -->
<div class="w3-container" style="float: right">
	<c:set var="member" value="${ member }" />
	<input type="hidden" id="user_id" value="${ member.mem_id }">
	<input type="hidden" id="user_nickname" value="${ member.mem_nickname }">
	<input type="hidden" id="user_profile_pic" value="${ member.mem_profile_pic }">
</div>

<!-- select box -->
<div class="w3-container" >
	<div class="w3-main w3-content w3-center mainSection">
		<form method="get" action=${URLs.URI_FURNITURE_WATCH_FULL }>
			<div class="w3-container w3-center" id="furarrselectbox">
				<table>
					<tr>
						<td style="width: 300px"><h3>ROOM</h3></td>
						<td style="width: 300px"><h3>CONCEPT</h3></td>
						<td style="width: 300px"></td>
					</tr>
					<tr>
						<td>
							<div class="styled-select select" id="roomkindselect">
								<select name="room_kind_def_name">
									<option selected value="0" >전체</option>
									<c:forEach var="roomkind" items="${roomKind}">
										<option value="${roomkind}">${roomkind}</option>
									</c:forEach>
								</select>
							</div>
						</td>
						<td>
							<div class="styled-select select" id="roomkindselect">
								<select name="concept_name">
									<option selected value="0">전체</option>
									<c:forEach var="conceptKind" items="${conceptKind}">
				      					<option value="${conceptKind}">${conceptKind}</option>
				      				</c:forEach>
								</select>
							</div>
						</td>
						<td>
							<button class="w3-button w3-subcolor w3-padding w3-round" type="submit">검색하기</button>
						</td>
					</tr>
				</table>
				
			</div>
		</form>
	</div>

	<!-- First Grid(인기 가구 배치도 리스트) -->
	<div class="w3-margin-top">
		<div class=" w3-container">
		
			<div class="w3-content">
				<c:forEach var="fur_arr_list" items="${fur_arr_list }">
					<div class="w3-round w3-display-center w3-white">
						
						<!-- 배치도 보기 -->
						<div class="w3-border w3-round w3-margin w3-padding w3-center">
			      				<table class="w3-container w3-center">
									  <tr>
									    <td rowspan="2" colspan="2" style="width:80px;height:80px">
									    	<img class="w3-circle" src="${fur_arr_list.mem_profile_pic }" alt="${fur_arr_list.mem_id }" style="width:75px;height:75px">
									    </td>
									    <td colspan="3"><b>${fur_arr_list.mem_id }(${fur_arr_list.mem_nickname })</b></td>
									    <td rowspan="5" style="height: 200px">
									    	<img class="w3-margin-top w3-margin-bottom" src="${fur_arr_list.fur_arr_plan_img_loc }" alt="${fur_arr_list.fur_arr_name }" style="height:100%">
									    </td>
									  </tr>
									  <tr>
									    <td colspan="3">${fur_arr_list.fur_arr_create_date }</td>
									  </tr>
									  <tr>
									    <td colspan="5"><a class="w3-margin-top w3-margin-bottom w3-container w3-button w3-hover-white"
										href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${fur_arr_list.fur_arr_plan_no}"><h5>${fur_arr_list.fur_arr_name }</h5></a></td>
									  </tr>
									  
									  <tr></tr>
									  <tr>
									  </tr>
									  <tr>
									    <td colspan="5">
									    	<div>
										    	<div class="w3-col m3 w3-border w3-round w3-margin-right">
										    		<button class="btn-fur-arr-good w3-button w3-hover-white w3-white" value="${fur_arr_list.fur_arr_plan_no}">좋아요</button>
										    		<input type="hidden" id="user_id_li" value="${ member.mem_id }">
										    		<button onclick="document.getElementById('myModal').style.display='block'" 
										    				class="good_list w3-button w3-hover-white w3-white" value="${fur_arr_list.fur_arr_plan_no}"
										    				data-toggle="modal" data-target="#myModal">
										    				${fur_arr_list.fur_arr_plan_good_num}
										    		</button>
										    	</div>
										    	<div class="w3-col m3 w3-border w3-round w3-margin-right">
										    		<button class="btn-scrap-add w3-button w3-hover-white w3-white" value="${fur_arr_list.fur_arr_plan_no}">스크랩</button>
										    		<input type="hidden" id="write_id" value="${ fur_arr_list.mem_id }">
										    		<button class="w3-button w3-hover-white w3-white">${fur_arr_list.fur_arr_plan_scrap_num }</button>
										    	</div>
										    	<div class="w3-col m3 w3-border w3-round w3-margin-right">
										    		<button class="w3-button w3-hover-white w3-white">댓글</button>
										    		<button class="w3-button w3-hover-white w3-white">${fur_arr_list.fur_arr_plan_repl_num }</button>
										    	</div>
									    	</div>
									    </td>
									     <td class="w3-right-align w3-padding-right">
									    	<span class="w3-opacity w3-black">Room ${fur_arr_list.fur_arr_room_kind }
									    									<br>Concept ${fur_arr_list.fur_arr_con }
									    									<br>HashTag ${fur_arr_list.fur_arr_hashtag_name }</span>
									    </td>
									  </tr>
								</table>
		        		</div>
		    		</div>
				</c:forEach>
			</div>
		</div>
	</div>
	

<!-- Modal -->
<!-- 좋아요 -->
	<div id="myModal" class="w3-modal" style="margin-top: 0px; margin-bottom: 0px;">	
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px;margin-bottom: 300px">
				<img class="w3-image" src="/resources/Images/basic/like.jpg">
				<div class="w3-section w3-center">
					<div class="good_list_show w3-margin">
					</div>
				</div>
				<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button onclick="document.getElementById('myModal').style.display='none'"
					type="button" class="w3-button w3-red">취소</button>
				</div>
			</div>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>
</html>