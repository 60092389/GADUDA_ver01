<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="kr.co.gaduda.common.URLs"%>
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
		

		//var fur_arr_plan_no = $("#fur_arr_plan_no").val();
		//alert(fur_arr_plan_no);
		
		var trans_object = {
			'fur_arr_plan_no' : fur_arr_plan_no

		}

		//alert(mem_id + "/" + mem_nickname + "/" + fur_no);

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

	<c:set var="detailVO" value="${detailVO }"/>
	<c:set var="member" value="${ member }" />
	<input type="hidden" id="user_id" value="${member.mem_id }"/>
	<input type="hidden" id="user_nickname" value="${member.mem_nickname }"/>
	<input type="hidden" id="user_profile_pic" value="${member.mem_profile_pic}"/>
	<input type="hidden" id="fur_arr_plan_no" value="${detailVO.fur_arr_plan_no }"/>
	
	<div style ="margin-left: 50px">
	<h1>가구배치도상세</h1>
	<table border="1" width="1200px" >
		<tbody>
			<tr>
				<th>이미지</th>
				<td><img alt="가구사진" src="${detailVO.fur_arr_plan_img_loc }" width="200px" height="200px"></td>
				<th>가구배치도번호</th>
				<td>${detailVO.fur_arr_plan_no }</td>
				<th>제목</th>
				<td>${detailVO.fur_arr_name }</td>
				<th>작성자</th>
				<td>
					<p>사진주소 : ${detailVO.mem_profile_pic }</p>
					<p>아디 : ${detailVO.mem_id }</p>
					<p>닉네임 : ${detailVO.mem_nickname }</p>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7">${detailVO.fur_arr_contents}</td>			
			</tr>
			<tr>
				<th>작성일</th>
				<td>${detailVO.fur_arr_create_date }</td>
				<th>좋아요 개수  :  <button class="good_list" data-toggle="modal" data-target="#myModal"> 
								${detailVO.fur_arr_plan_good_num } </button>
				</th>
				<td colspan="2">
					<button name="goodup" class="btn-fur-arr-good" value="${detailVO.fur_arr_plan_no }">
						좋아요
					</button>
				</td>

				<th>스크랩 개수   :   ${detailVO.fur_arr_plan_scrap_num }</th>
				<td colspan="2"><button id="btn-scrap-add">스크랩</button></td>
			</tr>
			<tr>
				<th>해시태그</th>
				<td>${detailVO.fur_arr_hashtags }</td>
				<th>컨셉</th>
				<td colspan="2">${detailVO.fur_arr_concepts }</td>
				<th>방종류</th>
				<td colspan="2">${detailVO.fur_arr_rooms }</td>
			</tr>			
			<tr>
				<th>가구배치도에 사용된 가구</th>
				<th>사용된 가구의 총 가격 : ${detailVO.total_fur_price }</th>
				<td colspan="6">
					<c:forEach var="fur" items="${arr_fur }">
						<p>가구번호 : ${fur.fur_no } </p>
						<p>가구이미지 : <img alt="가구사진" src="${fur.fur_pic_loc }" width="100px" height="100px"></p>
						<p>가구 이름 : ${fur.fur_name }</p>
						<p>가구 가격 : ${fur.fur_price }</p>
					</c:forEach>						
				</td>
			</tr>
			<tr>
				<th colspan="5">가구배치도 댓글들</th>
				<th colspan="3">댓글 개수 : ${detailVO.fur_arr_plan_repl_num }</th>
			</tr>
			<tr>
				<td colspan="8">
					<ul id ="reply_show">
					<c:forEach var="reply" items="${reply_list }">
					<%-- <p>댓글오브잭트아디 : ${reply._id } || 배치도 번호 : ${reply.fur_arr_plan_no }
						댓글 작성자 : ${reply.mem_id } || 댓글 작성자닉네임 : ${reply.mem_nickname }</p>
					<p>댓글 내용 : ${reply.fur_arr_plan_rep_contents } || 댓글 작성날짜 : ${reply.fur_arr_plan_rep_write_date }</p>
					<p></p> --%>
						<li>
							${reply.mem_profile_pic }|| ${reply.mem_id } (${reply.mem_nickname } ) || ${reply.fur_arr_plan_rep_contents }
								|| ${reply.fur_arr_plan_rep_write_date }
								|| <button class="btn-reply-delete" value="${reply._id }">삭제하기</button>   							
						</li>
					</c:forEach>
					</ul>
				</td>
			</tr>
			<tr>
				<th>${member.mem_profile_pic } || ${member.mem_id } (${member.mem_nickname })</th>
				<td colspan="6"><input type="text" id="reply_text" placeholder="댓글 입력" size="80px"> </td>
				<td><button id="reply_write">댓글쓰기</button></td>
			</tr>
			<tr>
				<th colspan="8">작성자의 다른 가구배치도</th>
			</tr>
			<tr>
				<td colspan="8">
					<c:forEach var="otherFurArr" items="${detailVO.other_furniture_arrList }">
						<p>배치도번호 : ${otherFurArr.fur_arr_plan_no } || 배치도이미지 : ${otherFurArr.fur_arr_plan_img_loc }
							|| 배치도 제목 : ${otherFurArr.fur_arr_name }
						</p>
					</c:forEach>
				</td>
			</tr>
		</tbody>
	
	</table>

	</br>
	<h1>가구배치도에 들어간 가구와 비슷한 가구들 추천이 들어가야함</h1>
	</br>
	<h1></h1>
	</br>

</div>


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
					<h2>좋아요 누른 사람</h2>
					<table border="1">
						<tbody class="good_list_show">
							
		
						</tbody>

					</table>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>


</body>
</html>