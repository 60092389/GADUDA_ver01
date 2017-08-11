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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	var mem_id = $('#user_id').val();
	var mem_nickname = $('#user_nickname').val();
	var mem_profile_pic = $("#user_profile_pic").val();
	var now_date = new Date();
	var fur_arr_plan_no = $("#fur_arr_plan_no").val();
	
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
	
	
	//댓글 작성
	$("#reply_write").click(function(){

		var reply_text = $("#reply_text").val();
		var mem_id = $("#repl_mem_id").val();
		
		
		var trans_object = {
			'fur_arr_plan_no' : fur_arr_plan_no,
			'mem_id' : mem_id,
			'mem_nickname' : mem_nickname,
			'mem_profile_pic' : mem_profile_pic,
			'fur_arr_plan_rep_contents' : reply_text,
			'fur_arr_plan_rep_write_date' : now_date

		}


		var trans_json = JSON.stringify(trans_object); //json으로 반환//

		$.ajax({
			url : "${URLs.URI_FURNITURE_ARR_REPLY_WRITE_FULL}",
			type : 'POST',
			dataType : 'json',
			data : trans_json,
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(retVal){
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

		
		var trans_object = {
			'_id' : _id,
			'fur_arr_plan_no' : fur_arr_plan_no
		}


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
	
	//스크랩 리스트 보기
	$('.scrap_list').click('show.bs.modal', function(){
			$('#myScrapModal').focus();
			var fur_arr_plan_no = $(this).val();
			
			 var trans_object_scrap = {
					'fur_arr_plan_no' : fur_arr_plan_no
			} 
			
			var trans_json_scrap = JSON.stringify(trans_object_scrap);
			$.ajax({
				url : "${URLs.URI_FURNITURE_ARR_DETAIL_SCRAP_LIST_FULL}",
				data : trans_json_scrap,
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(retVal) {
					
					$(".scrap_list_show").html("");
					
					for(var i =0; i < retVal.fur_arr_plan_list.length; i++){ 
						$(".scrap_list_show").append("<div>");
						$(".scrap_list_show").append("<p><b>" + retVal.fur_arr_plan_list[i].mem_id +"</b>　"+retVal.fur_arr_plan_list[i].mem_nickname+"</p>");
						//$(".scrap_list_show").append("<h6>[" + retVal.fur_arr_plan_list[i].fur_scrap_date+"]</h6>");
						$(".scrap_list_show").append("</div>");
					}
				}
			});
			
	});
	
	//스크랩하기
	$("#btn-scrap-add").click(function(){
		
		var fur_arr_plan_no = $(this).val();
		var mem_id = $('#sc_user_id').val();
		
		
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
//팔로우 관련

	function follow(fol_mem_id){
		var data = {"fol_mem_id" : fol_mem_id};
			$.ajax({
				url : "${URLs.URI_MYPAGE_FOLLOW_CHK_FULL}",
				type : 'GET',
				data : data,
				
				success : function(){
					location.reload();
					alert("성공");
				}
			
			});
			
		}
	//새로 팔로우 하기	
	function newfollow(fol_mem_id){
		var data = {"fol_mem_id" : fol_mem_id};
			$.ajax({
				url : "${URLs.URI_MYPAGE_NEW_FOLLOW_FULL}",
				type : 'GET',
				data : data,
				
				success : function(){
					location.reload();
					alert("성공");
				}
			
			});
			
		}
	//언팔하기
	function delfollow(fol_mem_id){
		var data = {"fol_mem_id" : fol_mem_id};
		alert(fol_mem_id);
			$.ajax({
				url : "${URLs.URI_MYPAGE_DEL_FOLLOW_FULL}",
				type : 'GET',
				data : data,
				
				success : function(){
					location.reload();
					alert("성공");
				}
			
			});
			
		}

var repl_id = $('#repl_id').val();
if(mem_id != repl_id){
	$('.btn-reply-delete').hide();
}

</script>

<body>
<!-- 메뉴 -->
<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

<!-- 로그인 정보 -->
<div class="w3-container" style="float: right">
	<c:set var="member" value="${ member }" />
	<input type="hidden" id="user_id" value="${ member.mem_id }">
	<input type="hidden" id="user_nickname" value="${ member.mem_nickname }">
	<c:set var="fur_arr" value="${ detailVO }" />
	<input type="hidden" id="fur_arr_plan_no" value="${ detailVO.fur_arr_plan_no }">
	<input type="hidden" id="user_profile_pic" value="${ member.mem_profile_pic }">
</div>

<!-- 메인 화면 -->
<div class="w3-main w3-container mainSection">

	<!-- 가구 배치도 이름 보기 -->
	<div class="w3-padding-64 w3-margin-bottom w3-center">
  		<h1 class="w3-jumbo">${detailVO.fur_arr_name }</h1>
	</div>
	
	<!-- 가구 배치도 사진 -->
	<div class="w3-row-padding w3-content w3-col m9">
  		<div class="w3-twothird">
    		<img src="${detailVO.fur_arr_plan_img_loc }" alt="FurnitureArr" style="width:600px">
    	</div>
    </div>
    
    <!-- 가구 배치도 정보 -->
    <div>
    	<div id="user_action">
    		<div class="w3-col m3">
    		<p>	
    			<img class="w3-circle" src="${detailVO.mem_profile_pic }" alt="${detailVO.mem_id }" style="width:10%"><h3><b>${detailVO.fur_arr_name }</b></h3>
    			<b class="w3-medium" style="color: blue;">${detailVO.mem_id }　　</b>
    			<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★사용자가 팔로우한 사람이면 다른 아이콘 뜨도록 해야합니다.★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
    			<c:set var="followox" value="${followox }"/>
    				
    				<!-- 사용자랑 게시자랑 같을때 -->
    				<c:if test="${ followox eq 0 }">
    					<a class="w3-button" href=<%=URLs.URI_MYPAGE_MEMBER_FULL%>>마이페이지</a>
    				</c:if>
    				<!-- 둘다 팔로우 안한 상태일때 -->
    				<c:if test="${ followox eq 1 }">
    					<button onclick="newfollow('${detailVO.mem_id}');" class="w3-button w3-blue">팔로우하기${followox }</button>
    				</c:if>
    				<!-- 게시자만 팔로우 -->
    				<c:if test="${ followox eq 2 }">
    					<button onclick="follow('${detailVO.mem_id}');" class="w3-button w3-blue">팔로우하기${followox }</button>
    					<p>당신을 팔로우 합니다.</p>
    				</c:if>
    				<!-- 나만 팔로우 한 상태일때 -->
    				<c:if test="${ followox eq 3 }">
    					<button onclick="delfollow('${detailVO.mem_id}');" class="w3-button w3-blue">언팔로우하기${followox }</button>
    				</c:if>
    				<!-- 둘다 팔로우 -->
    				<c:if test="${ followox eq 4 }">
    					<button onclick="follow('${detailVO.mem_id}');" class="w3-button w3-blue">언팔로우하기${followox }</button>
    					<p>당신을 팔로우 합니다.</p>
    				</c:if>
    		</p>
	 			<a class="w3-button w3-border w3-round" href="${URLs.URI_FOLLOW_FURARR_FULL }?fol_mem_id=${detailVO.mem_id}" value="${detailVO.mem_id}">작성자의 다른 가구배치도 보러가기</a>
	 			<p><b>Date</b> 　　　　 <b>${detailVO.fur_arr_create_date }</b></p> 
	 			<p><b>종류</b> 　　　 　<b>${detailVO.fur_arr_rooms }</b></p> 
	 			<p><b>컨셉</b> 　　　 　<b>${detailVO.fur_arr_concepts }</b></p> 
	 			<p><b>#</b> 　　　 　　<b>${detailVO.fur_arr_hashtags }</b></p> 
	 			<b>소개</b>
	 			<p>${detailVO.fur_arr_contents}</p>
	 			<br>
	 			<br>
	 			<div class="w3-center">
	 				<div class="w3-border w3-round " style="width: 150px">
						<button class="btn-fur-arr-good w3-button w3-hover-white" value="${detailVO.fur_arr_plan_no}" name="subject" id="btn_good" value="${detailVO.fur_arr_plan_no }">좋아요</button> 
						<input type="hidden" id="user_id_li" value="${ member.mem_id }">
						<button onclick="document.getElementById('myModal').style.display='block'" class="good_list w3-button w3-hover-white" 
								data-toggle="modal" data-target="#myModal">${detailVO.fur_arr_plan_good_num }</button>
					</div>
					<br>
					<div class="w3-border w3-round" style="width: 150px">
						<button class="w3-button w3-hover-white" name="subject" id="btn-scrap-add" value="${detailVO.fur_arr_plan_no }">스크랩</button> 
						<input type="hidden" id="sc_user_id" value="${ member.mem_id }">
						<button onclick="document.getElementById('myScrapModal').style.display='block'" class="scrap_list w3-button w3-white w3-hover-white" 
								data-toggle="modal" data-target="#myScrapModal" value="${detailVO.fur_arr_plan_no }">${detailVO.fur_arr_plan_scrap_num }</button>
					</div>
					<br>
					<div class="w3-border w3-round" style="width: 150px">
						<button class="w3-button w3-hover-white" name="subject">댓글</button> 
						<button class="w3-button w3-hover-white" >${detailVO.fur_arr_plan_repl_num }</button>
					</div>
					<br>
	 			</div>
			</div>
 		</div> 
 	</div>
</div>

<div>
	<!-- 댓글 -->
	<div id="more_comments" class="w3-container w3-left">
		<!-- 댓글 보기 -->
		<div class="w3-content w3-border-bottom ">
			<a><h5><b>댓글 더보기</b></h5></a>
			<!-- ★★★★★★★★★★★★★★★★★★★★★★★댓글이 많아지는 경우에는 더보기 버튼 눌러야 더나오는 걸로 수정하거나, 최근 댓글만 보여주기 ★★★★★★★★★★★★★★★★★★★★★★★-->
			<!-- 댓글 리스트 불러오기 -->
			<c:forEach var="reply" items="${reply_list }">
				<div id="repllistcall" class="w3-padding w3-margin-left">
					<div>
						<img class="w3-circle" alt="${reply.mem_id }" src="${reply.mem_profile_pic }" style="width:25px; height: 25px" >
						<b>　　　${reply.mem_id }(${reply.mem_nickname })</b>　　　${reply.fur_arr_plan_rep_contents }
						<input type="hidden" id="repl_id" value="${ reply.mem_id }">
						<b class="w3-right" style="font-size: 11px">
						<c:set value="${reply.mem_id }" var="repl"/>
						<c:set value="${member.mem_id }" var="user"/>
						<c:if test="${repl == user}">
							<button class="w3-button btn-reply-delete" style="size: 15px" value="${reply._id }"> delete</button>
						</c:if>${reply.fur_arr_plan_rep_write_date }</b>
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
							<input type="hidden" id="repl_mem_id" value="${member.mem_id }">
							<input class="w3-margin-left" type="text" id="reply_text" placeholder="댓글 입력" size="60px">
							<button class="w3-button w3-right" id="reply_write">댓글쓰기</button>
						</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<!-- 가구에 사용된 제품 -->
	<div class="w3-padding-large">
		<div class="w3-container w3-left">
			<div id="recommend_items" class="w3-content">
				<div class="title"><h4><b>배치도에 사용된 제품</b></h4></div>
				<div class="w3-bar">
					<c:forEach var="fur" items="${arr_fur }">
						<div class="w3-container w3-border-top">
							<a href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fur.fur_no }">
	      						<div class=" w3-padding">
	      							<div class="w3-col m2 ">
	      								<b>No.<h3>${fur.fur_no }</h3></b>
	      							</div>
	      							<div class="w3-col m3">
	      								<img src="${fur.fur_pic_loc }" alt="${fur.fur_no }" style="width:100px">
	      							</div> 								
	        						<div class="w3-col m4 w3-center">
	        							<h5><b>${fur.fur_name }</b></h5>
	        						</div>
	        						<div class="w3-col m3 w3-padding-16 w3-center">
	        							<p>${fur.fur_price }원</p>
	        						</div>
								</div>
	        				</a>
						</div>
					</c:forEach>
					<div class=" w3-border-top w3-center">
						<p><b>배치도에 사용된 제품의 총 가격</b>　　${detailVO.total_fur_price } 원</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 작성자의 다른 가구 배치도 -->
	<div class="w3-padding-large">
		<div class="w3-container w3-left">
			<div id="other_arr_fur" class="w3-content">
				<div class="title"><h4><b>작성자의 다른 가구배치도</b></h4></div>
				<div class="w3-bar">
					<c:forEach var="otherFurArr" items="${detailVO.other_furniture_arrList }">
						<div class="w3-container w3-border-top">
							<a href="<%= URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL %>/?fur_arr_plan_no=${otherFurArr.fur_arr_plan_no }">
	      						<div class=" w3-padding">
	      							<div class="w3-col m2 ">
	      								<b>No.<h3>${otherFurArr.fur_arr_plan_no }</h3></b>
	      							</div>
	      							<div class="w3-col m3">
	      								<img src="${otherFurArr.fur_arr_plan_img_loc }" alt="${otherFurArr.fur_arr_plan_no }" style="width:100px">
	      							</div> 								
	        						<div class="w3-col m4 w3-center">
	        							<h5><b>${otherFurArr.fur_arr_name }</b></h5>
	        						</div>
								</div>
	        				</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- ★★★★★★★★★★★★★★★크롤링 완성 후 수정하기★★★★★★★★★★★★★★ -->
	<!-- 가구배치도에 사용된 가구와 비슷한 가구 추천 리스트 -->
	<div class="w3-padding-large">
         <div class="w3-container w3-left">
            <div id="recom_fur" class="w3-content">
               <div class="title">
                  <h4>
                     <b>가구 추천 리스트</b>
                  </h4>
               </div>


               <div class="w3-bar">

                  <c:forEach var="craw_fur4" items="${craw_fur_detail }">

                     <div class="w3-container w3-border-top">

                        <div class="w3-container" style="white-space: nowrap; overflow-x: scroll;">
                           <c:forEach var="craw_fur" items="${craw_fur4.value }">
                              <ul class="recommand_ul"
                                 style="white-space: nowrap; overflow: auto; display: inline-block; list-style: none;">
                                 <div class="w3-container" style="position: absolute; left: 400px;">
                                    <h5 style="margin-bottom: 15px;">${craw_fur.arr_fur_name }</h5>
                                 </div>
                                 <br />
                                 <div class="w3-container w3-margin">
                                    <li class="recommand_li" style="float: left; margin: 20px;">
                                       <a href=${craw_fur.craw_fur_brand_site }><img
                                          src="${craw_fur.craw_fur_img }"
                                          style="width: 150px; height: 150px;"><br>${craw_fur.craw_fur_name }<br>${craw_fur.craw_fur_brand }<br>${craw_fur.craw_fur_price }원<br>${craw_fur.craw_fur_kind_name }</a>
                                    </li>
                                 </div>

                              </ul>
                           </c:forEach>
                        </div>
                        <%--  <c:forEach var="craw_fur" items="${craw_fur4.value }" >
                                 
                                    <li class="recommand_li" style="float: left; margin: 20px;">
                                       <a href=${craw_fur.craw_fur_brand_site }><img
                                          src="${craw_fur.craw_fur_img }"
                                          style="width: 150px; height: 150px;"><br>${craw_fur.craw_fur_name }<br>${craw_fur.craw_fur_brand }<br>${craw_fur.craw_fur_price }<br>${craw_fur.craw_fur_kind_name }</a>
                                    </li>
                     
                              
                              </c:forEach> --%>

                     </div>
                  </c:forEach>
               </div>



            </div>
         </div>
      </div>
   </div>
</div>

<!-- Modal -->
<!-- 좋아요 -->
	<div class="w3-modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 1000px" >
			<div class="modal-content" style="margin: 20px">
				<img class="w3-image" src="/resources/Images/basic/like.jpg">
				<div class="w3-section w3-center">
					<div class="good_list_show w3-margin">
					</div>
				</div>
				<button
					onclick="document.getElementById('myModal').style.display='none'"
					type="button" class="w3-button w3-red">Cancel</button>
			</div>
		</div>
	</div>
	
<!-- 스크랩 -->	
	<div id="myScrapModal" class="w3-modal">	
		<!-- 여기도 좋아요 한사람 많아지면 바꿔야 될거같은데 -->
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px; ">
			<img class="w3-image" src="/resources/Images/basic/scrap.jpg">
			<div class="w3-section">
				<div class="scrap_list_show w3-margin"></div>
			</div>
			<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button onclick="document.getElementById('myScrapModal').style.display='none'"
					type="button" class="w3-button w3-red">Cancel</button>
			</div>
		</div>
	</div>

</body>
</html>