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

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	var mem_id = $('#user_id').val();
	var mem_nickname = $('#user_nickname').val();
	var mem_profile_pic = $("#user_profile_pic").val();
	var now_date = new Date();
	var fur_arr_plan_no = $("#fur_arr_plan_no").val();
	
	//좋아요 누를시
	$('.btn-fur-arr-good').click(function(){
		//var fur_arr_plan_no = $('#fur_arr_plan_no').val();
		
		//alert(mem_id + " / " + mem_nickname + " / " + fur_arr_plan_no 
		//		+ " / " + now_date);
		
		var trans_object = {
			'mem_id' : mem_id,
			'mem_nickname' : mem_nickname,
			'fur_arr_plan_no' : fur_arr_plan_no,
			'mem_profile_pic' : mem_profile_pic,
			'fur_arr_plan_good_date' : now_date
		}
		
		//alert(mem_id + "/" + mem_nickname + "/" + fur_no);

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
		

		var fur_arr_plan_no = $("#fur_arr_plan_no").val();
		
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
				//alert("좋아요 목록" + " / " + retVal.goodList[].mem_id);
				
				$(".good_list_show").html("");
				
				for(var i=0; i<retVal.goodList.length; i++){
					$(".good_list_show").append("<tr>");
					$(".good_list_show").append("<td>사진 : " + retVal.goodList[i].mem_profile_pic + "</td>");
					$(".good_list_show").append("<td>" + retVal.goodList[i].mem_nickname + "</td>");
					$(".good_list_show").append("<td>" + retVal.goodList[i].mem_id + "</td>");
					$(".good_list_show").append("<td>" + retVal.goodList[i].fur_arr_plan_good_date + "</td>");
					$(".good_list_show").append("</tr>");
				}
				
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);

			}
		
		});
		

	});
	
	
	//댓글 작성
	$("#reply_write").click(function(){

		//var fur_arr_plan_no = $("#fur_arr_plan_no").val();
		var reply_text = $("#reply_text").val();
		
		//alert(fur_arr_plan_no + " / " + reply_text);
		
		var trans_object = {
			'fur_arr_plan_no' : fur_arr_plan_no,
			'mem_id' : mem_id,
			'mem_nickname' : mem_nickname,
			'mem_profile_pic' : mem_profile_pic,
			'fur_arr_plan_rep_contents' : reply_text,
			'fur_arr_plan_rep_write_date' : now_date

		}

		//alert(mem_id + "/" + mem_nickname + "/" + fur_no);

		var trans_json = JSON.stringify(trans_object); //json으로 반환//

		$.ajax({
			url : "${URLs.URI_FURNITURE_ARR_REPLY_WRITE_FULL}",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				//alert("좋아요 목록" + " / " + retVal.goodList[].mem_id);
				alert("결과값 : " + retVal.result);
				
				location.reload();
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);

			}
		
		});
		

	});
	
	
	//댓글 삭제
	$(".btn-reply-delete").click(function(){
		
		var _id = $(this).val();

		//alert(_id);
		
		var trans_object = {
			'_id' : _id,
			'fur_arr_plan_no' : fur_arr_plan_no
		}

		//alert(mem_id + "/" + mem_nickname + "/" + fur_no);

		var trans_json = JSON.stringify(trans_object); //json으로 반환//

		$.ajax({
			url : "${URLs.URI_FURNITURE_ARR_REPLY_DELETE_FULL}",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				//alert("좋아요 목록" + " / " + retVal.goodList[].mem_id);
				//alert("결과값 : " + retVal.result);
				
				location.reload();
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);

			}
		
		});
		

	});
	
	//스크랩하기
	$("#btn-scrap-add").click(function(){
		
		
		var trans_object = {
			'mem_id' : mem_id,
			'fur_arr_plan_no' : fur_arr_plan_no
		}

		//alert(mem_id + "/" + mem_nickname + "/" + fur_no);

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

</head>
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

<div class="w3-container" style="float: right">
	<c:set var="member" value="${ member }" />
	<input type="hidden" id="user_id" value="${ member.mem_id }">
	<input type="hidden" id="user_nickname" value="${ member.mem_nickname }">
	<c:set var="fur_arr" value="${ detailVO }" />
	<input type="hidden" id="fur_arr_plan_no" value="${ detailVO.fur_arr_plan_no }">
</div>

<div>
	<div class="w3-light-grey w3-padding-64 w3-margin-bottom w3-center">
  		<h1 class="w3-jumbo">${detailVO.fur_arr_name }</h1>
	</div>
	
	<div class="w3-row-padding w3-content" style="max-width:1200px;"">
  		<div class="w3-twothird">
    		<img src="${detailVO.fur_arr_plan_img_loc }" alt="Furniture" style="width:600px">
    	</div>
    	<br>
    	<br>
    	<br>
    	
	<div class="w3-third">
 			<h1>${detailVO.fur_arr_name }</h1>
 			<p>${detailVO.fur_arr_contents}</p>
			<table class="w3-table w3-bordered w3-border">
					<tr><td style="width:30%">User Profile</td>
							<td><p>사진주소 : ${detailVO.mem_profile_pic }</p>
								<p>아디 : ${detailVO.mem_id }</p>
								<p>닉네임 : ${detailVO.mem_nickname }</p></td></tr>
					<tr><td>Date</td><td>${detailVO.fur_arr_create_date }</td></tr>
					<tr><td><button  name="goodup" class="btn-fur-arr-good" value="${detailVO.fur_arr_plan_no }">Like</button></td>
						<td><button onclick="document.getElementById('myModal').style.display='block'" class="good_list" data-toggle="modal" data-target="#myModal"> ${detailVO.fur_arr_plan_good_num } </button></td></tr>
					<tr><td><button id="btn-scrap-add">scrap</button></td><td>${detailVO.fur_arr_plan_scrap_num }</td></tr>
					<tr><td>HashTag</td><td>${detailVO.fur_arr_hashtags }</td></tr>
					<tr><td>Concept</td><td>${detailVO.fur_arr_concepts }</td></tr>
					<tr><td>RoomKind</td><td>${detailVO.fur_arr_rooms }</td></tr>
			</table>
 		</div>
 	</div>
</div>		
 	<br><br>
<div class="w3-container" style="float: center">
<h1>가구배치도에 사용된 가구</h1>
<h3>사용된 가구의 총 가격 : ${detailVO.total_fur_price }</h3>
	<div class="w3-container">
		<div class="w3-container" style="float: center">
			<div>
				<c:forEach var="fur" items="${arr_fur }">
					<div class="w3-quarter">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-basiccolor w3-xlarge w3-padding-32"><a
								href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fur.fur_no }"><b>${fur.fur_name }</b></a></li>
							<li class="w3-padding-16"><img alt="가구사진"
								src="${fur.fur_pic_loc }" width="100px" height="100px"></li>
							<li class="w3-padding-16"><b>${fur.fur_price }</b>원</li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<br>

<div class="w3-container" style="float: center">
	<h1>가구배치도 댓글들</h1>
	<p>댓글 개수 : ${detailVO.fur_arr_plan_repl_num }</p>
	
	<div class="w3-container" style="float: center">
		<table>
			<tbody>
			<c:forEach var="reply" items="${reply_list }">
				<tr>
					<td>${member.mem_profile_pic }</td>
					<td>${reply.mem_id }(${reply.mem_nickname }) </td>
					<td>${reply.fur_arr_plan_rep_contents }</td>
					<td>${reply.fur_arr_plan_rep_write_date }</td>
					<td><button class="btn-reply-delete" value="${reply._id }">delete</button> </td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="w3-container" style="float: center">
		<table>
			<tbody>
				<tr><td>${member.mem_profile_pic } || ${member.mem_id } (${member.mem_nickname })</td></tr>
				<tr><td><input type="text" id="reply_text" placeholder="댓글 입력" size="80px"></td></tr>
				<tr><td><button id="reply_write">댓글쓰기</button></td></tr>
			</tbody>
		</table>
	</div>
</div>
<br>

<div class="w3-container" style="float: center">
	<h1>작성자의 다른 가구배치도</h1>
	<div class="w3-container" style="float: center">
		<c:forEach var="otherFurArr" items="${detailVO.other_furniture_arrList }">
				<div class="w3-quarter">
					<ul class="w3-ul w3-border w3-center w3-hover-shadow">
						<li class="w3-basiccolor w3-xlarge w3-padding-32"><a
								href="<%= URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL %>/?fur_arr_plan_no=${otherFurArr.fur_arr_plan_no }"><b>${otherFurArr.fur_arr_name }</b></a></li>
						<li class="w3-padding-16"><img alt="배치도 이미지"
								src="${otherFurArr.fur_arr_plan_img_loc }" width="100px" height="100px"></li>
					</ul>
				</div>
		</c:forEach>
	</div>
</div>
<br>

<div class="w3-container" style="float: center">
	<h1>가구배치도에 들어간 가구와 비슷한 가구들 추천이 들어가야함</h1>
</div>

<!-- Footer -->
	<footer class="w3-center w3-white w3-padding-16">
	<p>
		made by <a href="https://www.w3schools.com/w3css/default.asp"
			title="W3.CSS" target="_blank" class="w3-hover-text-green">sin
			park han jo</a>
	</p>
	</footer>


<!-- Modal -->
	<div class="w3-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 1000px" >
			<div class="modal-content" style="margin: 20px">
				<h1>좋아요 누른 사람</h1>
				<div class="modal-body">
					<table border="1">
						<tbody class="good_list_show">						
		
						</tbody>

					</table>


				</div>
				<button
					onclick="document.getElementById('myModal').style.display='none'"
					type="button" class="w3-button w3-red">Cancel</button>
			</div>
		</div>
	</div>

</body>
</html>