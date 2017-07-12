<%@page import="kr.co.gaduda.common.URLs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가구 상세보기 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	

	//좋아요 목록 리스트 보기
		
	$('#mongofurgoodlist').click(function() {
		
		var goodfurno = $('#good_fur_no').val();
		

		var trans_object = {
			'goodfurno' : goodfurno,
		}

		var trans_json = JSON.stringify(trans_object);
		
		$.ajax({
			url : "http://localhost:8080/furniture/detail/mongofurgoodlistajax",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				$("#furgoodlist").html("");
				
				for(var i =0; i < retVal.list_good.length; i++){ 
				$("#furgoodlist").append("<tr>");
				$("#furgoodlist").append("<td>" + retVal.list_good[i].mem_id +"</td>");
				$("#furgoodlist").append("<td>" + retVal.list_good[i].mem_nickname +"</td>");
				$("#furgoodlist").append("<td>" + retVal.list_good[i].fur_good_date+"</td>");
				$("#furgoodlist").append("</tr>");
				}
			},
			error : function(retVal, status, er){
				alert("에러 : " + retval + " status : " + status + " er : " + er);
			}

		});

	});
	
	// 댓글 리스트 보기
	$('#mongofurrepllist').click(function() {
		var replfurno = $('#repl_fur_no').val();
		
		var fur_no_trans_object = {
				'fur_no' : replfurno
		}
		
		var fur_no_trans_json = JSON.stringify(fur_no_trans_object); 
		
		$.ajax({
			url : "http://localhost:8080/furniture/fur_reply_list",
			type : 'POST',
			dataType : 'json',
			data : fur_no_trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
				$("#furrepllist").html("");
				
				for(var i =0; i < retVal.replyList.length; i++){ 
				$("#furrepllist").append("<tr>");
				$("#furrepllist").append("<td>" + retVal.replyList[i].mem_id +"</td>");
				$("#furrepllist").append("<td>" + retVal.replyList[i].fur_rep_contents+"</td>");
				$("#furrepllist").append("<td>" + retVal.replyList[i].mem_nickname +"</td>");
				$("#furrepllist").append("<td>" + retVal.replyList[i].fur_rep_write_date+"</td>");
				$("#furrepllist").append("<td><button type='button' class='btn btn-primary " 
						+ "btn-xs btn-fur-reply-del' value='"+retVal.replyList[i]._id +"'> 댓글 삭제</button> </td>");
				$("#furrepllist").append("</tr>");
				}
				
				$(".btn-fur-reply-del").click(function(){
					var fur_reply_id = $(this).val();
					//alert("댓글 아디 : " + fur_reply_id);
					var fur_reply_id_trans_object = {
							'_id' : fur_reply_id,
							'fur_no' : replfurno
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

	});
	
	//스크랩 리스트 보기
	$("#scraplist").click(function() {
			var scrap_fur_no = $('#good_fur_no').val();
			
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
					
					$("#furscraplist").html("");
					
					for(var i =0; i < retVal.fur_scrap_list.length; i++){ 
						$("#furscraplist").append("<tr>");
						$("#furscraplist").append("<td>" + retVal.fur_scrap_list[i].mem_id +"</td>");
						$("#furscraplist").append("<td>" + retVal.fur_scrap_list[i].mem_nickname +"</td>");
						$("#furscraplist").append("<td>" + retVal.fur_scrap_list[i].fur_scrap_date+"</td>");
						$("#furscraplist").append("</tr>");
					}
				}
			});
			
	});
	
	//좋아요 누르기
	$('#btn_good').click(function() {
		var mem_nickname = $('#fur_memnick').val();
		var fur_no = $('#good_fur_no').val();
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

	//스크랩 누르기
	$('#btn_scrap').click(function() {
		
		var fur_no = $('#good_fur_no').val();
		var mem_id = $('#fur_mem_id').val();
		
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
	
	//댓글쓰기
	$("#replinput").click(function(){
		alert("댓글?")
		var mem_nickname = $('#fur_memnick').val();
		var fur_no = $('#good_fur_no').val();
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
	//댓글삭제
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
	
		


});
</script>

</head>
<body>

	<c:set var="member" value="${ member }" />
	${ member.mem_nickname }  가구 페이지입니당
	<form role="form" method="get">
		<input type="hidden" name="fur_mem_id" id="fur_mem_id" value="${member.mem_id }"/>
		<input type="hidden" name="fur_memnick" id="fur_memnick" value="${member.mem_nickname } "/>
		<input type="hidden" name="good_fur_no" id="good_fur_no" value="${furdeVO.fur_no }"/>
	</form>
	<form action=${URLs.URI_FURNITURE_FUR_SCRAP_FULL } method="get">
		<input type="hidden" name="fur_mem_id" id="fur_mem_id" value="${member.mem_id }"/>
		<input type="hidden" name="good_fur_no" id="good_fur_no" value="${furdeVO.fur_no }"/>
	</form>
	<h1>가구 상세보기 페이지</h1>
	<h2>제품 기본 정보(가구 이미지 여러개 불러오는거 완성하기)</h2>
	<div>
		<table border="1">
			<thead>
				<th>이미지</th>
				<th>가구이름</th>
				<th>가구 가격</th>
				<th>가구브랜드</th>
				<th width="200px">가구 정보</th>
				<th>가구 컨셉</th>
				<th>가구 종류</th>
			</thead>

			<tbody>
				<c:set var="furdeVO" value="${furdeVO }" />
				<tr>


					<td><c:forEach var="pic_loc" items="${furdeVO.fur_pic_loc }">
							<img alt="가구사진" src="${pic_loc}" width="100px" height="100px"> ${pic_loc}
													
					</c:forEach></td>

					<td>${furdeVO.fur_name }</td>
					<td>${furdeVO.fur_price }</td>
					<td>${furdeVO.fur_brand_name }</td>
					<td width="200px">${furdeVO.fur_info }</td>
					<td>${furdeVO.fur_con }</td>
					<td>${furdeVO.fur_kind }</td>
				</tr>

			</tbody>
		</table>
	</div>

	<h2>제품 추가 정보</h2>
	<div>
		<table border="1">
			<thead>
				<th width="200px">
					<button name="subject" id="btn_good" value="${furdeVO.fur_no }">좋아요</button>
					<button name="subject" id="mongofurgoodlist">좋아요 누른사람 보기</button>
				</th>
				<th width="200px">
					<button name="subject" id="btn_scrap">스크랩 ${furdeVO.fur_scrap_num }</button><br/>
					<button name="subject" id="scraplist">스크랩 누른사람 보기</button>
				</th>
				<th width="500px">
					<div class="form-group">
					<label for="mem_pw">내용작성 >> </label>
					<input name="fur_repl" id="fur_repl" value='' placeholder="내용을 작성하세요" type="text"
						   class="form-control" /> <input type="submit" id="replinput" value="작성" />
					</div>
					<input type="hidden" id="repl_fur_no" value="${furdeVO.fur_no }">
					<button name="subject" id="mongofurrepllist">댓글 보기</button>
				</th>
			</thead>

			<tbody>
				<c:set var="furdeVO" value="${furdeVO }" />
				<tr>
					<td width="200px">${furdeVO.fur_good_num }</td>
					<td width="200px">${furdeVO.fur_scrap_num }</td>
					<td width="200px">${furdeVO.fur_repl_num }</td>
				</tr>

			</tbody>
		</table>
		
		<h3>좋아요 한 사람 보기</h3>
		<div>
			<table border="1">
			<thead>
				<th>아이디</th>
				<th>닉네임</th>
				<th>날짜</th>
			</thead>
			<tbody id="furgoodlist">
			</tbody>
			</table>
		</div>
		<br/>
		
		<h3>댓글 보기</h3>
		<div>
			<table border="1">
			<thead>
				<th>아이디</th>
				<th>내용</th>
				<th>닉네임</th>
				<th>날짜</th>
				<th>댓글 삭제</th>
			</thead>
		
			<tbody id="furrepllist">
			</tbody>
			</table>
		</div>
		
		<h3>스크랩 한 사람 보기</h3>
		<div>
			<table border="1">
			<thead>
				<th>아이디</th>
				<th>닉네임</th>
				<th>날짜</th>
			</thead>
			
			<tbody id="furscraplist">
			</tbody>
			</table>
		</div>
	
	</div>


	<h2>제품에 대한 평(크롤링)</h2>
	<div>제품평(나중에 완성)</div>

	<h2>비슷한 제품 추천</h2>
	<div>비슷한 제품들 목록(나중에 완성)</div>

	<h2>사이트별 가구 가격 비교</h2>
	<div>가격 비교 목록(나중에 완성)</div>





</body>
</html>