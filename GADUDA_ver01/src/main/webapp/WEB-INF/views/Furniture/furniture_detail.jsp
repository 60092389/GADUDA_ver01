<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
				$("#furrepllist").append("</tr>");
				}
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
	${ member.mem_id }  가구 페이지입니당
	
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
					<button>좋아요</button>
					<input type="hidden" id="good_fur_no" value="${furdeVO.fur_no }">
					<button name="subject" id="mongofurgoodlist">좋아요 누른사람 보기</button>
				</th>
				<th width="200px">
					<button id="scrap_btn" value="${ member.mem_id }" action>스크랩</button>
					<input type="hidden" id="scrap_fur_no" value="${furdeVO.fur_no }">
					<button>스크랩 누른사람 보기</button>
				</th>
				<th width="500px">
					<div class="form-group">
					<label for="mem_pw">내용작성 >> </label>
					<input name="fur_repl" id="fur_repl" value='' placeholder="내용을 작성하세요" type="text"
						   class="form-control" /> <input type="submit" value="작성" />
					</div>
					<input type="hidden" id="repl_fur_no" value="${furdeVO.fur_no }">
					<button name="subject" id="mongofurrepllist">댓글 보기</button>
				</th>
			</thead>

			<tbody>
				<c:set var="furdeVO" value="${furdeVO }" />
				<tr>
					<td width="200px">${furdeVO.fur_good_num }</td>
					<td>${furdeVO.fur_scrap_num }</td>
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
			</thead>
		
			<tbody id="furrepllist">
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