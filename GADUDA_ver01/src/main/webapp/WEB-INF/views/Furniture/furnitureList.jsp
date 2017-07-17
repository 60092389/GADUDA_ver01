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
	var now_date = new Date();
	
	//스크랩 누르기
	$('.btn-scrap').click(function() {
		var fur_no = $(this).val();
		var mem_id = $('#user_id').val();
		alert(mem_id);
		
		var trans_object = {
				'mem_id' : mem_id,
				'fur_no' : fur_no
		}
		var trans_json = JSON.stringify(trans_object);
		
		$.ajax({
			url : "http://localhost:8080/furniture/furniture_scrap",
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
	
	
	//좋아요 누를시
	$('.btn-good').click(function(){
		//var fur_no = $(this).find('.fur_no_val').val();
		var fur_no = $(this).val();
		
		
		
		
		var trans_object = {
			'mem_id' : mem_id,
			'mem_nickname' : mem_nickname,
			'fur_no' : fur_no,
			'fur_good_date' : now_date
		}

		//alert(mem_id + "/" + mem_nickname + "/" + fur_no);

		var trans_json = JSON.stringify(trans_object); //json으로 반환//

		$.ajax({
			url : "http://localhost:8080/furniture/fur_good_up",
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
	
	
	
	//댓글창 눌렀을때
	$('.btn-repl-fur-no').click('show.bs.modal', function () {
		$('#myModal').focus();

		var fur_no = $(this).val();
		//alert(fur_no);
		
		$('.reply_fur_no').val(fur_no);
		
		//alert("히히 = " + $('.reply_fur_no').val());
		
		
		var fur_no_trans_object = {
				'fur_no' : fur_no
		}
		
		var fur_no_trans_json = JSON.stringify(fur_no_trans_object); 
		
		//alert(fur_no_trans_json);
		
		$.ajax({
			url : "http://localhost:8080/furniture/fur_reply_list",
			type : 'POST',
			dataType : 'json',
			data : fur_no_trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				//alert("나오낫 : " + retVal.replyList[0].fur_rep_contents);
				
				$(".reply_list").html("");
				
				for(var i=0; i<retVal.replyList.length; i++){
					$(".reply_list").append("<tr>");
					$(".reply_list").append("<td>" + retVal.replyList[i].mem_nickname + "</td>");
					$(".reply_list").append("<td>" + retVal.replyList[i].mem_id + "</td>");
					$(".reply_list").append("<td>" + retVal.replyList[i].fur_rep_contents + "</td>");
					$(".reply_list").append("<td>" + retVal.replyList[i].fur_rep_write_date + "</td>");
					$(".reply_list").append("<td><button type='button' class='btn btn-primary " 
							+ "btn-xs btn-fur-reply-del' value='"+retVal.replyList[i]._id +"'> 댓글 삭제</button> </td>");
					$(".reply_list").append("</tr>");
				}
				
				
				//댓글삭제를 위한 아디
				$(".btn-fur-reply-del").click(function(){
					var fur_reply_id = $(this).val();
					//alert("댓글 아디 : " + fur_reply_id);
					
					var fur_reply_id_trans_object = {
							'_id' : fur_reply_id,
							'fur_no' : fur_no
					}
					
					var reply_id_trans_json = JSON.stringify(fur_reply_id_trans_object); 
					
					$.ajax({
						url : "http://localhost:8080/furniture/fur_reply_delete",
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
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);
			}

		});  
		
		
		//댓글 작성 시
		$(".btn-reply-write").click(function(){
			var contents = $('.reply_contents_input').val();
			
			//alert(fur_no + "/" + mem_id + " / " + mem_nickname +" / " + contents);
			
			var trans_object = {
					'mem_id' : mem_id,
					'mem_nickname' : mem_nickname,
					'fur_no' : fur_no,
					'fur_rep_contents' : contents,
					'fur_rep_write_date' : now_date
				}
			
			var trans_json = JSON.stringify(trans_object);
			
			$.ajax({
				url : "http://localhost:8080/furniture/fur_reply_write",
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

<div class="w3-container">
  <h2>Furniture</h2>
  <p>종류별로 검색해서 보세용~</p>

  <div class="w3-bar">
    <div class="w3-dropdown-hover">
      <button class="w3-button"><a href="/furniture/fur_list_get">Room</a></button>
      <div class="w3-dropdown-content w3-bar-block w3-hover-white w3-card-4">
        <a href="/furniture/fur_list_get?room_kind_def_name=침실" class="w3-bar-item w3-button">침실</a>
        <a href="/furniture/fur_list_get?room_kind_def_name=거실" class="w3-bar-item w3-button">거실</a>
        <a href="/furniture/fur_list_get?room_kind_def_name=서재" class="w3-bar-item w3-button">서재</a>
      </div>
    </div>
    <div class="w3-dropdown-hover">
      <button class="w3-button"><a href="/furniture/fur_list_get">Concept</a></button>
      <div class="w3-dropdown-content w3-bar-block w3-hover-white w3-card-4">
        <a href="/furniture/fur_list_get?concept_name=내추럴" class="w3-bar-item w3-button">내추럴</a>
        <a href="/furniture/fur_list_get?concept_name=모던" class="w3-bar-item w3-button ">모던</a>
        <a href="/furniture/fur_list_get?concept_name=미니멀" class="w3-bar-item w3-button">미니멀</a>
		<a href="/furniture/fur_list_get?concept_name=시골풍" class="w3-bar-item w3-button">시골풍</a>
		<a href="/furniture/fur_list_get?concept_name=앤틱" class="w3-bar-item w3-button">앤틱</a>
		<a href="/furniture/fur_list_get?concept_name=북유럽" class="w3-bar-item w3-button">북유럽</a>
		<a href="/furniture/fur_list_get?concept_name=동양적" class="w3-bar-item w3-button">동양적</a>
      </div>
    </div>
    <div class="w3-dropdown-hover">
      <button class="w3-button">Furniture</button>
      <div class="w3-dropdown-content w3-bar-block w3-hover-white w3-card-4">
        <a href="/furniture/fur_list_get?fur_kind_def_name=침대" class="w3-bar-item w3-button">침대</a>
        <a href="/furniture/fur_list_get?fur_kind_def_name=책상" class="w3-bar-item w3-button">책상</a>
        <a href="/furniture/fur_list_get?fur_kind_def_name=소파" class="w3-bar-item w3-button">소파</a>
      </div>
    </div>
  </div>
</div>
<br>
<div class="w3-container">
  	<p>종류별로 정렬해서 보세용~</p>
	<div class="w3-bar">
  		<div class="w3-bar-item"><a href="/furniture/fur_list_get?array_option=furno">Furniture No.</a></div>
  		<div class="w3-bar-item"><a href="/furniture/fur_list_get?array_option=good">Like</a></div>
  		<div class="w3-bar-item"><a href="/furniture/fur_list_get?array_option=reply">Comment</a></div>
	</div>
</div>
<br>
	<!-- First Grid(인기 가구 리스트) -->
	<div class="w3-container">
		<div class="w3-container" style="float: center">
			<h1>인기 가구 리스트</h1>
			<div>
				<c:forEach var="fsl" items="${furList}">
					<div class="w3-quarter">
						<ul class="w3-ul w3-border w3-center w3-hover-shadow">
							<li class="w3-basiccolor w3-xlarge w3-padding-32"><a
								href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fsl.fur_no }"><b>${fsl.fur_name }</b></a></li>
							<li class="w3-padding-16"><img alt="가구사진"
								src="${fsl.fur_pic_loc }" width="100px" height="100px"></li>
							<li class="w3-padding-16"><b>${fsl.fur_price }</b>원</li>
							<li class="w3-padding-16">No.<b>${fsl.fur_no }</b></li>
							<li class="w3-padding-16"><b>${fsl.fur_brand_name }</b></li>
							<li class="w3-padding-16"><i class="material-icons">favorite</i><button name="goodup" class="btn-good" value="${fsl.fur_no }"><b>${fsl.fur_good_num }</b></button></li>
							<li class="w3-padding-16"><i class="material-icons">attachment</i><button name="subject" class="btn-scrap" id="btn_scrap" value="${fsl.fur_no }"><b>${fsl.fur_scrap_num }</b></button></li>
							<li class="w3-padding-16"><i class="material-icons">cloud</i>
								<button type="button" class="btn-repl-fur-no" data-toggle="modal" data-target="#myModal" value="${fsl.fur_no }"><b>${fsl.fur_repl_num }</b></button></li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<br><br>
	<!-- Footer -->
	<footer class="w3-center w3-white w3-padding-16">
	<p>
		made by <a href="https://www.w3schools.com/w3css/default.asp"
			title="W3.CSS" target="_blank" class="w3-hover-text-green">sin
			park han jo</a>
	</p>
	</footer>


<!--댓글 Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Modal title</h4>
									</div>
									<div class="modal-body">
										<table border="1">
											<tbody class="reply_list">
											
											
											</tbody>
										
										</table>
										

									</div>
									<div class="modal-footer">
									
										
											<input type="hidden" class="reply_fur_no" id="temp_fur_no" value="">
											<input type="text" class="reply_contents_input" value="" placeholder="내용입력">
											<button name="writeReply" class="btn-reply-write">댓글 작성</button>
									
									
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>
								</div>
							</div>
						</div>




</body>
</html>