<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="/resources/Css/Bootstrap/bootstrap.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	

	$('.good_list').click('show.bs.modal', function(){
		$('#myLikeModal').show();
		var goodfurno = $('#fur_no').val();

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
					$(".good_list_show").append("<div>");
					$(".good_list_show").append("<p><b>" + retVal.list_good[i].mem_id +"</b>　"+retVal.list_good[i].mem_nickname+"</p>");
					//$(".good_list_show").append("<h6>[" + retVal.list_good[i].fur_good_date+"]</h6>");
					$(".good_list_show").append("</div>");
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
						$(".scrap_list_show").append("<div>");
						$(".scrap_list_show").append("<p><b>" + retVal.fur_scrap_list[i].mem_id +"</b>　"+retVal.fur_scrap_list[i].mem_nickname+"</p>");
						//$(".scrap_list_show").append("<h6>[" + retVal.list_good[i].fur_scrap_date+"]</h6>");
						$(".scrap_list_show").append("</div>");
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
<!-- 메뉴 -->
<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

<!-- 로그인 정보 -->
<div class="container-fluid">
	<c:set var="member" value="${ member }" />
	<input type="hidden" id="fur_mem_id" value="${ member.mem_id }">
	<input type="hidden" id="fur_memnick" value="${ member.mem_nickname }">
	<c:set var="fur" value="${ furdeVO }" />
	<input type="hidden" id="fur_no" value="${ furdeVO.fur_no }">
</div>

<!-- 메인 화면 -->
<div class="w3-main w3-container mainSection">
	
	<!-- 가구 이름 보기 -->
	<div class="w3-padding-64 w3-margin-bottom w3-center">
  		<h1 class="w3-jumbo">${furdeVO.fur_name }</h1>
	</div>
	
	<!-- 가구 사진 보기(도도록) -->
	<div class="w3-row-padding w3-content w3-col m9">
		<div class="w3-twothird w3-display-container w3-padding-16">
			<button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
			<c:forEach var="pic" items="${furdeVO.fur_pic_loc }">
				<img class="mySlides" src="${pic}" style="width:80%; max-height: 100%" >
			</c:forEach>
  			<button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
  			<!-- ★★★★★★★★★★★★★★★★★★★★★★★사진이 가끔가다가 여러개 나와서 밑에 댓글이 저 밑으로감 ★★★★★★★★★★★★★★★★★★★★★★★-->
		</div>
    </div>
    
    <!-- 가구 정보 -->
    <div>
		<div id="user_action">
			<div class="w3-col m3">
				<p style="color: orange;">
					<b>${furdeVO.fur_brand_name }</b></p>
				<h3><b>${furdeVO.fur_name }</b></h3>
 				<p><b>가격</b> 　　　　 <b>${furdeVO.fur_price } won</b></p> 
 				<p><b>종류</b> 　　　 　<b>${furdeVO.fur_kind }</b></p> 
 				<p><b>컨셉</b> 　　　 　<b>${furdeVO.fur_con }</b></p> 
 				<p><b>사이즈</b> 　　　 　<b>${furdeVO.fur_width }|${furdeVO.fur_height }|${furdeVO.fur_depth }</b></p> 
 				<b>소개</b>
 				<p>${furdeVO.fur_info }</p>
 				<br>
 				<br>
 				<div class="w3-center">
 					<div class="w3-border w3-round" style="width: 150px">
						<button class="w3-button w3-white w3-hover-white" name="subject" id="btn_good" value="${furdeVO.fur_no }"><i class="material-icons">favorite</i></button> 
						<button onclick="document.getElementById('myLikeModal').style.display='block'" class="good_list w3-button w3-white w3-hover-white" 
								data-toggle="modal" data-target="#myLikeModal">Like${furdeVO.fur_good_num }</button>
					</div>
					<br>
					<div class="w3-border w3-round" style="width: 150px">
						<button class="w3-button w3-white w3-hover-white" name="subject" id="btn_scrap" value="${furdeVO.fur_no }"><i class="material-icons">attachment</i></button> 
						<button onclick="document.getElementById('myScrapModal').style.display='block'" class="scrap_list w3-button w3-white w3-hover-white" 
								data-toggle="modal" data-target="#myScrapModal">Scrap${furdeVO.fur_scrap_num }</button>
					</div>
					<br>
					<div class="w3-border w3-round" style="width: 150px">
						<button class="w3-button w3-white w3-hover-white" name="subject"><i class="material-icons">cloud</i></button> 
						<button class="w3-button w3-white w3-hover-white" >Repl${furdeVO.fur_repl_num }</button>
					</div>
 				</div>
			</div>
 		</div>   
 	</div> 
</div>

<div>
	<!-- 댓글 -->
	<div id="more_comments" class="w3-container w3-left">
		<div class="w3-content w3-border-bottom ">
			<a><h5><b>댓글 더보기</b></h5></a>
			<!-- ★★★★★★★★★★★★★★★★★★★★★★★댓글이 많아지는 경우에는 더보기 버튼 눌러야 더나오는 걸로 수정하거나, 최근 댓글만 보여주기 ★★★★★★★★★★★★★★★★★★★★★★★-->
			<!-- 댓글 리스트 불러오기 -->
			<c:forEach var="replyList" items="${fur_repl_list }">
				<div id="repllistcall" class="w3-padding w3-margin-left">
						<c:set value="${replyList.mem_id }" var="repl_id"/>
						<c:set value="${member.mem_id }" var="user_id"/>
						<div>
							<!-- ★★★★★★★★★★★★★★★사진 왜 안나오는 거니★★★★★★★★★★★★★★ -->
							<b style="width: 30px">${replyList.mem_id }(${replyList.mem_nickname })</b>　　　${replyList.fur_rep_contents }
							<input type="hidden" id="repl_id" value="${replyList._id }">
							<b class="w3-right" style="font-size: 11px">
							<c:if test="${repl_id == user_id}">
								<button class="w3-button btn-reply-delete" style="size: 15px" value="${replyList._id }"> delete</button>
							</c:if>${replyList.fur_rep_write_date }</b>
						</div>		
				</div>
			</c:forEach>
		</div>
		<!-- 댓글 달기 -->
		<div class="w3-content w3-border-bottom ">
			<div id="replwritediv" class="w3-padding w3-margin-left">
				<c:choose>
					<c:when test="${ empty member }">
							<a onclick="document.getElementById('loginUser').style.display='block'"
								class="w3-center w3-button w3-hover-white"><h6>로그인을 하여 의견을 남겨주세요 *^^*</h6></a>	
					</c:when>
					<c:otherwise>
						<p>
							<img class="w3-circle" alt="${member.mem_id }" src="${member.mem_profile_pic }" style="width:25px; height: 25px" >
							<b>　　　${member.mem_id }(${member.mem_nickname })</b>
							<input class="w3-margin-left" type="text" id="fur_repl" placeholder="댓글 입력" size="60px">
							<button class="w3-button w3-right" id="replinput">댓글쓰기</button>
						</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- ★★★★★★★★★★★★★★★크롤링 완성 후 수정하기★★★★★★★★★★★★★★ -->
	<!-- 비슷한 가구 추천 리스트 -->
	<div class="w3-padding-large">
		<div class="w3-container w3-left">
			<div id="recom_fur" class="w3-content">
				<div class="title"><h4><b>가구 추천 리스트</b></h4></div>
				<div class="w3-bar">

				</div>
			</div>
		</div>
	</div>
	<!-- 가구 리뷰 리스트 -->
	<div class="w3-padding-large">
		<div class="w3-container w3-left">
			<div id="recom_fur" class="w3-content">
				<div class="title"><h4><b>가구 리뷰 리스트</b></h4></div>
				<div class="w3-bar">

				</div>
			</div>
		</div>
	</div>
	<!-- 가구 가격 비교 -->
	<div class="w3-padding-large">
		<div class="w3-container w3-left">
			<div id="recom_fur" class="w3-content">
				<div class="title"><h4><b>가구 가격 비교</b></h4></div>
				<div class="w3-bar">

				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<!-- 좋아요 -->
	<div id="myLikeModal" class="w3-modal">	
		<!-- 여기도 좋아요 한사람 많아지면 바꿔야 될거같은데 -->
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px; ">
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">좋아요 누른 사람</h1>
			<div class="w3-section">
				<div class="good_list_show w3-margin">
				</div>
			</div>
			<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button onclick="document.getElementById('myLikeModal').style.display='none'"
					type="button" class="w3-button w3-red">Cancel</button>
			</div>
		</div>
	</div>

	
<!-- 스크랩 -->	
	<div id="myScrapModal" class="w3-modal">	
		<!-- 여기도 좋아요 한사람 많아지면 바꿔야 될거같은데 -->
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px; ">
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">스크랩 한 사람</h1>
			<div class="w3-section">
				<div class="scrap_list_show w3-margin"></div>
			</div>
			<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button onclick="document.getElementById('myScrapModal').style.display='none'"
					type="button" class="w3-button w3-red">Cancel</button>
			</div>
		</div>
	</div>
	
<!-- 사진 도로록 자바스크립트 -->
<script>
var slideIndex = 3;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

</body>
</html>