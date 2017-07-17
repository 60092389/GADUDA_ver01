<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
<body>
	<!-- header include -->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />

	<div class="w3-container" style="float: right">
		<c:set var="member" value="${ member }" />
		<input type="hidden" id="user_id" value="${ member.mem_id }">
		<input type="hidden" id="user_nickname"
			value="${ member.mem_nickname }">
	</div>

	<!--사이드 메뉴-->
	<div class="w3-container w3-section">
		<div class="w3-col m2">
			<nav class="w3-sidebar w3-bar-block w3-white w3-collapse"
				style="z-index:3;width:200px" id="mySidebar">
			<div class="w3-container w3-display-container w3-padding-16">
				<i onclick="w3_close()"
					class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
				<h3 class="w3-wide w3-text-grey">
					<b>MY PAGE</b>
				</h3>
			</div>
			<div class="w3-padding-64 w3-large w3-text-grey"
				style="font-weight: bold">

				<a href=<%=URLs.URI_MYPAGE_MEMBER_FULL%>
					class="w3-bar-item w3-button">내 정보</a> <a
					onclick="myRoomSetAccFunc()" href="javascript:void(0)"
					class="w3-button w3-block w3-white w3-left-align w3-text-grey"
					id="myBtn">내 배치도</a>
				<div id="myRoomAcc"
					class="w3-bar-block w3-hide w3-padding-large w3-medium">
					<a href="#" class="w3-bar-item w3-button"><i
						class="fa fa-caret-right w3-margin-right"></i>A방</a> <a href="#"
						class="w3-bar-item w3-button"><i
						class="fa fa-caret-right w3-margin-right"></i>B방</a> <a href="#"
						class="w3-bar-item w3-button"><i
						class="fa fa-caret-right w3-margin-right"></i>C방</a>
				</div>
				<a href="${URLs.URI_FURNITURE_SCRAP_FULL }?mem_id=${member.mem_id}"
					class="w3-bar-item w3-button">가구 스크랩</a> <a
					href="${URLs.URI_FURNITURE_ARR_SCRAP_FULL }?mem_id=${member.mem_id}"
					class="w3-bar-item w3-button">배치도 스크랩</a>
			</div>
			</nav>
		</div>
	</div>
	<!-- Page Container -->
	<div class="w3-container w3-content w3-section"
		style="max-width: 1200px; margin-top: 80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- Profile -->
				<div class="w3-card-2 w3-round w3-white">
					<c:set var="member" value="${ member }" />
					<div class="w3-container">
						<h4 class="w3-center">My Profile</h4>
						<p class="w3-center">
							<img src=${ member.mem_profile_pic } class="w3-circle"
								style="height: 106px; width: 106px" alt="Avatar">
						</p>
						<hr>
						<p>
							<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
							${ member.mem_nickname }
						</p>
						<p>
							<i
								class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>
							${ member.mem_birth }
						</p>
						<p>
							<i class="fa fa-male fa-fw w3-margin-right w3-text-theme"></i> <a
								href=${URLs.URI_MYPAGE_MEMBER_FOLLOWER_FULL }>팔로워
								${follower}</a>
						</p>
						<p>
							<i class="fa fa-male fa-fw w3-margin-right w3-text-theme"></i> <a
								href=${URLs.URI_MYPAGE_MEMBER_FOLLOWING_FULL }>팔로잉
								${following }</a>
						</p>
						<button type="button"
							onclick="document.getElementById('profMod').style.display='block'"
							class="w3-button w3-theme-d2 w3-margin-bottom">프로필 수정하기</button>
					</div>
				</div>
				<br>

				<!-- End Left Column -->
			</div>

			<!-- Middle Column -->
			<div class="w3-col m7">

				<div class="w3-container w3-card-2 w3-white w3-round w3-margin">
					<br>

					<h4>최근 검색 배치도</h4>
					<hr class="w3-clear">
					<div class="w3-row-padding" style="margin: 0 -16px">
						<div class="w3-half">
							<img src="/w3images/lights.jpg" style="width: 100%"
								alt="Northern Lights" class="w3-margin-bottom">
						</div>
						<div class="w3-half">
							<img src="/w3images/nature.jpg" style="width: 100%" alt="Nature"
								class="w3-margin-bottom">
						</div>
					</div>
					<button type="button"
						class="w3-button w3-theme-d1 w3-margin-bottom">
						<i class="fa fa-thumbs-up"></i> Like
					</button>
					<button type="button"
						class="w3-button w3-theme-d2 w3-margin-bottom">
						<i class="fa fa-comment"></i> Comment
					</button>
					<button type="button"
						class="w3-button w3-theme-d2 w3-margin-bottom">
						<i class="fa fa-home"></i> 구경하기
					</button>
				</div>

				<div class="w3-container w3-card-2 w3-white w3-round w3-margin">
					<br>
					<h4>최근 검색 가구</h4>
					<br>
					<hr class="w3-clear">
					<div class="w3-row-padding" style="margin: 0 -16px">
						<div class="w3-half">
							<img src="/w3images/lights.jpg" style="width: 100%"
								alt="Northern Lights" class="w3-margin-bottom">
						</div>
						<div class="w3-half">
							<img src="/w3images/nature.jpg" style="width: 100%" alt="Nature"
								class="w3-margin-bottom">
						</div>
					</div>
					<button type="button"
						class="w3-button w3-theme-d1 w3-margin-bottom">
						<i class="fa fa-thumbs-up"></i> Like
					</button>
					<button type="button"
						class="w3-button w3-theme-d2 w3-margin-bottom">
						<i class="fa fa-comment"></i> Comment
					</button>
					<button type="button"
						class="w3-button w3-theme-d2 w3-margin-bottom">
						<i class="fa fa-home"></i> 배치해보기
					</button>
				</div>

				<!-- End Middle Column -->
			</div>


			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>
	</div>

	<br>
	<br>
	<!-- Footer -->
	<footer class="w3-center w3-white w3-padding-16">
	<p>
		made by <a href="https://www.w3schools.com/w3css/default.asp"
			title="W3.CSS" target="_blank" class="w3-hover-text-green">sin
			park han jo</a>
	</p>
	</footer>
	<!--프로필 수정 창 띄우기-->

	<div id="profMod" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-zoom"
			style="max-width: 600px">


			<form class="w3-container" action=${URI_UPDATE_MEMBER_CHK }>
				<div class="w3-section">
					<label><b>닉네임 변경</b></label> <input
						class="w3-input w3-border w3-margin-bottom" type="text"
						placeholder="변경안함" name="mem_nickname" id="mem_nickname">
					<label><b>소개 입력</b></label> <input
						class="w3-input w3-border w3-margin-bottom" type="text"
						placeholder="변경안함" name="mem_intro" id="mem_intro"> <label><b>성별</b></label>
					<p>
						<input class="w3-radio" type="radio" name="mem_sex" value="남"><label>Male</label>
					</p>
					<p>
						<input class="w3-radio" type="radio" name="mem_sex" value="여"><label>Female</label>
					</p>
					<br /> <label><b>생년월일</b></label> <input
						class="w3-input w3-border w3-margin-bottom" type="date"
						placeholder="DD MM YYYY" name="mem_birth" required> <label><b>Password</b></label>
					<p>
						<input class="w3-input w3-border" type="password"
							placeholder="Enter Password" name="psw" required>
					</p>
					<label><b>Password 확인</b></label> <input class="w3-input w3-border"
						type="password" placeholder="Enter Password" name="pswCon"
						required>
					<p>변경을 원하시면 비밀번호를 다시 입력하세요</p>
					<button
						class="w3-button w3-block w3-orange w3-text-white w3-section w3-padding"
						type="submit">변경하기</button>
				</div>
			</form>

			<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
				<button
					onclick="document.getElementById('profMod').style.display='none'"
					type="button" class="w3-button w3-red">Cancel</button>
			</div>

		</div>
	</div>

	<!--메뉴보기-->
	<script>
		// Accordion 
		function myRoomSetAccFunc() {
			var x = document.getElementById("myRoomAcc");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>

</body>
</html>
