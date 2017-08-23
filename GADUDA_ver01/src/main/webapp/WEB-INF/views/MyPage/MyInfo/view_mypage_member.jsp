<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html { scrollbar-arrow-color: #efefef;
        scrollbar-Track-Color: #efefef; 
        scrollbar-base-color: #dfdfdf;
        scrollbar-Face-Color: #dfdfdf;
        scrollbar-3dLight-Color: #dfdfdf;         
        scrollbar-DarkShadow-Color: #dfdfdf;
        scrollbar-Highlight-Color: #dfdfdf;
        scrollbar-Shadow-Color: #dfdfdf}
/* Chrome, Safari용 스크롤 바 */
::-webkit-scrollbar {width: 12px; height: 12px;  }
::-webkit-scrollbar-button:start:decrement, 
::-webkit-scrollbar-button:end:increment {display: block; width: 12px;height: 12px; background: url() rgba(0,0,0,.05);}
::-webkit-scrollbar-track {     background: rgba(0,0,0,.05); }
::-webkit-scrollbar-thumb {  background: rgba(0,0,0,.1);  }

</style>
</head>

<body>
	<!-- Main MenuBar -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	
	
	<div class="w3-container" style="float: right">
		<c:set var="member" value="${ member }" />
		<input type="hidden" id="user_id" value="${ member.mem_id }">
		<input type="hidden" id="user_nickname"
			value="${ member.mem_nickname }">
	</div>
	
<div class="w3-container ">
	<!--사이드 메뉴-->
	<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_mypage_sidebar.jsp" flush="false" />
	<!-- Page Container -->
	<div class="w3-main w3-content" style="max-width: 1200px; margin-left: 300px">
	
		<div>
			<div class="w3-container">
				<!-- Profile -->
				<div class="w3-white">
					<c:set var="member" value="${ member }" />
					<div class="w3-container">
						<h4>My Profile</h4>
						<div class="w3-container">
							<table class="w3-margin w3-padding w3-center">
								<tr>
									<td rowspan="5" colspan="2" style="width: 300px; height: 300px">
										<img src=${ member.mem_profile_pic } class="w3-circle" style="height: 200px; width: 200px" alt="profile ficture">
									</td>
									<td rowspan="6" style="width: 50px">　</td>
								</tr>
  								<tr>
    								<td style="width: 100px">별명</td>
   	 								<td style="width: 200px"><b class="w3-button w3-hover-white">${ member.mem_nickname }</b></td>
								</tr>
								<tr>
								    <td>생년월일</td>
								    <td><p class="w3-button w3-hover-white">${ member.mem_birth }</p></td>
								</tr>
								
								<tr>
								    <td>팔로워</td>
								    <td><a class="w3-button" href=${URLs.URI_MYPAGE_MEMBER_FOLLOWER_FULL }>${follower}</a></td>
								</tr>
								<tr>
								    <td>팔로잉</td>
								    <td><a class="w3-button" href=${URLs.URI_MYPAGE_MEMBER_FOLLOWING_FULL }>${following }</a></td>
								</tr>
								<tr>
									<td colspan="2"><a type="button" onclick="document.getElementById('proficMod').style.display='block'" 
									class="w3-button w3-blue w3-margin w3-center">프로필 사진 수정하기</a></td>
									<td colspan="2"><a type="button" onclick="document.getElementById('profMod').style.display='block'" 
									class="w3-button w3-green w3-margin w3-center">프로필 수정하기</a></td>
								</tr>
							</table>
							</div>
						<hr>
					</div>
				</div>
				<br>
				<c:set value="${recent_view }" var="recent_view"/>
				<c:if test="${ recent_view eq '0' }">
				 　　
				</c:if>
				<c:if test="${ recent_view eq '1' }">
					<!-- Middle Column -->
					<div class="w3-container" id="re_fur">
						<h3>최근에 본 가구</h3>
						<div class="w3-col m1"><button style="margin-top: 100px" class="w3-button" id="furbtnpre" onclick="plusDivs(-1)">&#10094;</button></div>
						<c:forEach var="fur_list" items="${recent_view_fur_list }">
							<div class="furSlides w3-col m3 w3-round w3-margin-right w3-padding w3-border" style="height: 220px">
								<table class="w3-container w3-padding w3-center" >
									<tr>
										<td colspan="3" style="height: 130px">
											<a href="<%= URLs.URI_FURNITURE_DETAIL_FULL %>/?fur_no=${fur_list.fur_no }">
												<img src="${fur_list.fur_pic_loc }"  alt="${fur_list.fur_no  }" style="max-width:60% ;">
											</a>
										</td>
									</tr>
									<tr>
										<td colspan="2"><b class="w3-padding" style="font-size: 13px">${fur_list.fur_name }</b></td>
									</tr>
								</table>
							</div>
						</c:forEach>
						<div class="w3-col m1"><button style="margin-top: 100px" class="w3-button" onclick="plusDivs(1)">&#10095;</button></div>
					</div>
				</c:if>
				<c:set value="${repl_view }" var="repl_view"/>
				<c:if test="${ repl_view eq '0' }">
				 　　
				</c:if>
				<c:if test="${ repl_view eq '1' }">
					<!-- Middle Column -->
					<div class="w3-container w3-margin-top" id="replt_arr" style="max-height: 400px; overflow: auto;">
						<h3>내 배치도 반응</h3>
						<c:forEach var="repllist" items="${repllist }">
							<c:set value="${repllist.mem_id }" var="repl"/>
							<c:set value="${member.mem_id }" var="user"/>
							<c:choose>
								<c:when test="${repl == user}">
										
								</c:when>
								<c:otherwise>
									<div class="w3-container w3-margin-top">
										<div class="w3-col m2"><a class="w3-button w3-hover-white" href="${URLs.URI_FURNITURE_ARR_DETAIL_VIEW_FULL }/?fur_arr_plan_no=${repllist.fur_arr_plan_no}"><b>${repllist.fur_arr_plan_no }</b>번 배치도에</a></div>
										<div class="w3-col m4">
											<img class="w3-circle" alt="${repllist.mem_id }" src="${repllist.mem_profile_pic }" style="width:25px; height: 25px" >　
											<b>${repllist.mem_nickname }</b>님이
										</div>
										<div class="w3-col m6"> 댓글　<b>"${repllist.fur_arr_plan_rep_contents }"</b>　을 남기셨습니다.</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>



	
	<!--프로필 사진 수정 창 띄우기-->
	<div id="proficMod" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">회원사진 수정</h1> 

			<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_update_member_first.jsp" flush="false" />

		</div>
	</div>
	
	<!--프로필 수정 창 띄우기-->
	<div id="profMod" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">회원정보 수정</h1> 

			<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_update_member.jsp" flush="false" />

		</div>
	</div>
	
	<!--비밀번호 수정 창 띄우기-->
	<div id="pwMod" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">비밀번호 변경</h1> 

			<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_update_member_pw.jsp" flush="false" />

		</div>
	</div>
	
	<!--회원탈퇴 창 띄우기-->
	<div id="delMember" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">회원탈퇴</h1> 

			<jsp:include page="/WEB-INF/views/MyPage/MyInfo/view_del_member.jsp" flush="false" />

		</div>
	</div>

	<!--팔로워 띄우기-->
	<div id="follower" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width: 600px">
		
			<h1 class="modal-title" style="margin: 20px; margin-top: 30px;">FOLLOWER</h1> 
			
			<c:forEach var="follower_list" items="${follower_list }">
				${follower_list.fol_mem_id }	
			</c:forEach>

		</div>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />	

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
 	showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("furSlides");
  if (n >= x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  x[slideIndex-1].style.display = "block";  
  x[slideIndex].style.display = "block";  
  x[slideIndex+1].style.display = "block"; 
}

</script>
</body>
</html>
