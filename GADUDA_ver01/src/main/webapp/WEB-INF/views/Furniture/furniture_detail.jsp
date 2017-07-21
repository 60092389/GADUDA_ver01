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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	

	$('.good_list').click('show.bs.modal', function(){
		$('#myLikeModal').focus();
		var goodfurno = $('#fur_no').val();
		alert(goodfurno);

		var trans_object = {
			'goodfurno' : goodfurno,
		}

		var trans_json = JSON.stringify(trans_object);
		
		$.ajax({
			url : "${URLs.URI_FURNITURE_DETAIL_GOOD_LIST_FULL}",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				$(".good_list_show").html("");
				
				for(var i =0; i < retVal.list_good.length; i++){ 
				$(".good_list_show").append("<tr>");
				$(".good_list_show").append("<td>" + retVal.list_good[i].mem_id +"</td>");
				$(".good_list_show").append("<td>" + retVal.list_good[i].mem_nickname +"</td>");
				$(".good_list_show").append("<td>" + retVal.list_good[i].fur_good_date+"</td>");
				$(".good_list_show").append("</tr>");
				}
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);
			}

		});

	});
	
	$(".btn-fur-reply-del").click(function(){
		var fur_reply_id = $(this).val();
		var fur_no = $('#fur_no').val();
		
		var fur_reply_id_trans_object = {
				'_id' : fur_reply_id,
				'fur_no' : fur_no
		}
					
		var reply_id_trans_json = JSON.stringify(fur_reply_id_trans_object); 
		
		$.ajax({
			url : "${URLs.URI_FURNITURE_REPLY_DELETE_FULL}",
			type : 'POST',
			dataType : 'json',
			data : reply_id_trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retDeleteVal){
				alert("삭제 성공 - " + retDeleteVal.val );
				location.reload();
			}
		});
	});
	
	//스크랩 리스트 보기
	$('.scrap_list').click('show.bs.modal', function(){
			$('#myScrapModal').focus();
			var scrap_fur_no = $('#fur_no').val();
			
			 var trans_object_scrap = {
					'fur_no' : scrap_fur_no
			} 
			
			var trans_json_scrap = JSON.stringify(trans_object_scrap);
			$.ajax({
				url : "${URLs.URI_FURNITURE_DETAIL_SCRAP_LIST_FULL}",
				data : trans_json_scrap,
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(retVal) {
					
					$(".scrap_list_show").html("");
					
					for(var i =0; i < retVal.fur_scrap_list.length; i++){ 
						$(".scrap_list_show").append("<tr>");
						$(".scrap_list_show").append("<td>" + retVal.fur_scrap_list[i].mem_id +"</td>");
						$(".scrap_list_show").append("<td>" + retVal.fur_scrap_list[i].mem_nickname +"</td>");
						$(".scrap_list_show").append("<td>" + retVal.fur_scrap_list[i].fur_scrap_date+"</td>");
						$(".scrap_list_show").append("</tr>");
					}
				}
			});
			
	});
	
	//좋아요 누르기
	$('#btn_good').click(function() {
		var mem_nickname = $('#fur_memnick').val();
		var fur_no = $('#fur_no').val();
		var mem_id = $('#fur_mem_id').val();
		var now_date = new Date();
		
		var trans_object = {
				'mem_id' : mem_id,
				'mem_nickname' : mem_nickname,
				'fur_no' : fur_no,
				'fur_good_date' : now_date
		}
		var trans_json = JSON.stringify(trans_object);
		
		$.ajax({
			url : "${URLs.URI_FURNITURE_GOOD_UP_FULL}",
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

	//스크랩 누르기
	$('#btn_scrap').click(function() {
		
		var fur_no = $('#fur_no').val();
		var mem_id = $('#fur_mem_id').val();
		
		var trans_object = {
				'mem_id' : mem_id,
				'fur_no' : fur_no
		}
		var trans_json = JSON.stringify(trans_object);
		
		$.ajax({
			url : "${URLs.URI_FURNITURE_FUR_SCRAP_FULL}",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				alert("스크랩 결과" + " / " + retVal.val);
				
				location.reload();
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);
				location.reload();
			}
		
		});
		
	});
	
	//댓글쓰기
	$("#replinput").click(function(){
		alert("댓글?")
		var mem_nickname = $('#fur_memnick').val();
		var fur_no = $('#fur_no').val();
		var mem_id = $('#fur_mem_id').val();
		var now_date = new Date();
 		var contents = $('#fur_repl').val();
		
		var trans_object = {
				'mem_id' : mem_id,
				'mem_nickname' : mem_nickname,
				'fur_no' : fur_no,
				'fur_rep_contents' : contents,
				'fur_rep_write_date' : now_date
			}
		
		var trans_json = JSON.stringify(trans_object);
		
		$.ajax({
			url : "${URLs.URI_FURNITURE_REPLY_WRITE_FULL}",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				alert("댓글 작성 결과" + " / " + retVal.val);
				location.reload();
			},
			error : function(retVal, status, er){
				alert("댓글 에러 : " + retval + " status : " + status + " er : " + er);
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
	<input type="hidden" id="fur_mem_id" value="${ member.mem_id }">
	<input type="hidden" id="fur_memnick" value="${ member.mem_nickname }">
	<c:set var="fur" value="${ furdeVO }" />
	<input type="hidden" id="fur_no" value="${ furdeVO.fur_no }">
</div>
<div class="w3-main w3-container" style="max-width: 1200px; margin-top: 200px; margin-left: 300px">
	<div class="w3-light-grey w3-padding-64 w3-margin-bottom w3-center">
  		<h1 class="w3-jumbo">${furdeVO.fur_name }</h1>
	</div>
	
	<div class="w3-row-padding w3-content" style="max-width:1200px;"">
  		<div class="w3-twothird">
  			<c:set var="furdeVO" value="${furdeVO }" />
    		<img src="${furdeVO.fur_pic_loc.get(0) }" alt="Furniture" style="width:600px">
    		<div>
    			<c:forEach var="pic_loc" items="${furdeVO.fur_pic_loc }">
					<img style="border:1px solid grey" alt="가구사진" src="${pic_loc}" width="200px" height="200px">						
				</c:forEach>
    		</div>
    	</div>
    	<br>
    	<br>
    	<br>
    	<div class="w3-third">
 			<h1>${furdeVO.fur_name }</h1>
 			<p>${furdeVO.fur_info }</p>
			<table class="w3-table w3-bordered w3-border">
					<tr><td style="width:30%">Brand</td><td>${furdeVO.fur_brand_name }</td></tr>
					<tr><td>Price</td><td>${furdeVO.fur_price } won</td></tr>
					<tr><td>Concept</td><td>${furdeVO.fur_con }</td></tr>
					<tr><td>Kind</td><td>${furdeVO.fur_kind }</td></tr>
					<tr><td>Like</td><td><i class="material-icons">favorite</i> <button name="subject" id="btn_good" value="${furdeVO.fur_no }">Like</button> 
						<button onclick="document.getElementById('myLikeModal').style.display='block'" class="good_list" 
						data-toggle="modal" data-target="#myLikeModal"> ${furdeVO.fur_good_num } </button></td></tr>
						
					<tr><td>Scrap</td><td><i class="material-icons">attachment</i> <button name="subject" id="btn_scrap" value="${furdeVO.fur_no }">Scrap</button>
						<button onclick="document.getElementById('myScrapModal').style.display='block'" class="scrap_list" 
						data-toggle="modal" data-target="#myScrapModal">${furdeVO.fur_scrap_num }</button></td></tr>
						
					<tr><td>Comment</td><td><i class="material-icons">cloud</i> ${furdeVO.fur_repl_num }</td></tr>
			</table>

 		</div>
 	</div>
<br><br>

<!-- 댓글 보기 -->
	<div id="repl" class="w3-container">
		<div class="w3-container">
		
			<h1>댓글</h1> 
			<div>
				<table>
					<tbody id="furrepllist">
						<c:forEach var="replyList" items="${fur_repl_list }">
							<tr>
								<td>${replyList.mem_id }(${replyList.mem_nickname }) </td>
								<td>${replyList.fur_rep_contents }</td>
								<td>${replyList.fur_rep_write_date }</td>
								<td><button class="btn-fur-reply-del" value="${replyList._id }">delete</button> </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="float: center">
				<table>
					<tbody>
						<tr><td>${member.mem_profile_pic } || ${member.mem_id } (${member.mem_nickname })</td></tr>
						<tr><td><input name="fur_repl" id="fur_repl" value='' placeholder="내용을 작성하세요" type="text" class="form-control" /></td></tr>
						<tr><td><input type="submit" id="replinput" value="작성" /><input type="hidden" id="repl_fur_no" value="${furdeVO.fur_no }"></td></tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<br>

<div class="w3-container">


	<h2>제품에 대한 평(크롤링)</h2>
	<div>제품평(나중에 완성)</div>

	<h2>비슷한 제품 추천</h2>
	<div>비슷한 제품들 목록(나중에 완성)</div>

	<h2>사이트별 가구 가격 비교</h2>
	<div>가격 비교 목록(나중에 완성)</div>
</div>
<br><br>
</div>

<!-- Modal -->
<!-- 좋아요 -->


<div class="w3-modal" id="myLikeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		
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
					onclick="document.getElementById('myLikeModal').style.display='none'"
					type="button" class="w3-button w3-red">Cancel</button>
			</div>
		</div>
	</div>

	
<!-- 스크랩 -->	
	<div class="w3-modal w3-container" id="myScrapModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 1000px" >
			<div class="modal-content" style="margin: 20px">
				<h1>스크랩 한 사람</h1>
				<div class="w3-container w3-center modal-body">
					<table border="1">
						<tbody class="scrap_list_show">						
		
						</tbody>

					</table>


				</div>
				<button
					onclick="document.getElementById('myScrapModal').style.display='none'"
					type="button" class="w3-button w3-red">Cancel</button>
			</div>
		</div>
	</div>
</body>
</html>