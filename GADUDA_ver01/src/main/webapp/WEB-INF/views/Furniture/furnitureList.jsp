<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
					$(".reply_list").append("<td>" + retVal.replyList[i].fur_no + "</td>");
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


<h2>방종류</h2>
<table border = "1">
<thead>
	<th><a href="/furniture/fur_list_get">전체</a></th>
	<th><a href="/furniture/fur_list_get?room_kind_def_name=침실">침실</a></th>
	<th><a href="/furniture/fur_list_get?room_kind_def_name=거실">거실</a></th>
	<th><a href="/furniture/fur_list_get?room_kind_def_name=서재">서재</a></th>
</thead>
</table>

<h2>컨셉 종류</h2>
<table border = "1">
<thead>
	<th><a href="/furniture/fur_list_get">전체</a></th>
	<th><a href="/furniture/fur_list_get?concept_name=내추럴">내추럴</a></th>
	<th><a href="/furniture/fur_list_get?concept_name=모던">모던</a></th>
	<th><a href="/furniture/fur_list_get?concept_name=미니멀">미니멀</a></th>
	<th><a href="/furniture/fur_list_get?concept_name=북유럽">시골풍</a></th>
	<th><a href="/furniture/fur_list_get?concept_name=앤틱">앤틱</a></th>
	<th><a href="/furniture/fur_list_get?concept_name=북유럽">북유럽</a></th>
	<th><a href="/furniture/fur_list_get?concept_name=동양적">동양적</a></th>
</thead>
</table>

<h2>가구 종류</h2>
<table border="1">
	<thead>
		
		<th><a href="/furniture/fur_list_get?fur_kind_def_name=침대">침대</a></th>
		<th><a href="/furniture/fur_list_get?fur_kind_def_name=책상">책상</a></th>
		<th><a href="/furniture/fur_list_get?fur_kind_def_name=소파">소파</a></th>
	</thead>
</table>

<h2>정렬기준</h2>
<table border="1">
	<thead>
		<th><a href="/furniture/fur_list_get?array_option=furno">가구번호순</a></th>
		<th><a href="/furniture/fur_list_get?array_option=good">좋아요순</a></th>
		<th><a href="/furniture/fur_list_get?array_option=reply">댓글순</a></th>
	</thead>
</table>

	 세션에있는 유저아이디와 닉네임
	<input type="hidden" id="user_id" value="user01">
	<input type="hidden" id="user_nickname" value="abcd">
<table border ="1">

	<thead>
		<th>이미지</th>
		<th>가구이름</th>
		<th>가구 가격</th>
		<th>가구브랜드</th>
		<th>가구번호</th>
		<th>좋아요 수</th>
		<th>스크랩 수</th>
		<th>댓글 수</th>
		<th>좋아요</th>
		<th>댓글달기</th>
	</thead>furnitureScrapList.jsp
	
	<tbody>
		<c:forEach var="fsl" items="${furList}">
			<tr>
				<td><img alt="가구사진" src="${fsl.fur_pic_loc }" width="100px" height="100px">
					${fsl.fur_pic_loc }</td>
				<td>${fsl.fur_name }</td>
				<td>${fsl.fur_price }</td>
				<td>${fsl.fur_brand_name }</td>
				<td>${fsl.fur_no }</td>
				<td>${fsl.fur_good_num }</td>
				<td>${fsl.fur_scrap_num }</td>
				<td>${fsl.fur_repl_num }</td>
				<td>
					<button name="goodup" class="btn-good" value="${fsl.fur_no }">좋아요</button>

					<%-- <form name="good_form" class="good_form">
						<input type="hidden" class="fur_no_val" value="${fsl.fur_no }"/>
						<input type="submit" value="좋아요">
					</form> --%>
					
					
				</td>				
				<td>
					<button type="button" class="btn btn-primary btn-small btn-repl-fur-no" 
						data-toggle="modal" data-target="#myModal" value="${fsl.fur_no }">
  						댓글
					</button>
					


				</td>
		
			</tr>
		</c:forEach>
	</tbody>

</table>


<!-- Modal -->
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