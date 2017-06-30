<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="kr.co.gaduda.common.URLs" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$("#mem_id").on({
			"blur" : function() {
				var mem_id = $(this).serialize();
				$.ajax({
					url : "${URLs.URI_JOIN_IDCHK_FULL}",
					data : mem_id,
					dataType : "json",
					success : function(result) {
						if (result.idchk == "1") {
							$("#idchk").css("color", "red").text("사용 할 수 없는 ID 입니다.");
						} else {
							$("#idchk").css("color", "blue").text("사용 할 수 있는 ID 입니다.");
						}
					}
				});
			}
		});
	});
</script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
$(function(){
	$('#mem_pw').keyup(function(){
		$('font[name=pw_chk]').text('');
	});
	
	$('#mem_pw_chk').keyup(function(){
		if($('#mem_pw').val()!=$('#mem_pw_chk').val()){
			$('font[name=pw_chk]').text('');
			$('font[name=pw_chk]').text("비밀번호 다시 확인 바람");
		}else{
			$('font[name=pw_chk]').text('');
			$('font[name=pw_chk]').text("비밀번호를 확인 성공");
		}
});
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h2>회원가입</h2>
			</div>
			<div class="col-md-3">
				<div class="login-box well">
					<form role="form" method="post" action=${ URLs.URI_JOIN_CHK_FULL }>
						<legend>회원가입</legend>
						<div class="form-group">
							<label for="mem_id"> 아이디</label> <input name="mem_id" value=''
								id="mem_id" placeholder="id or email" type="text" class="form-control" />

							<span id="idchk"></span>

						</div>
						<div class="form-group">
							<label for="mem_pw">비밀번호</label> <input name="mem_pw"
								id="mem_pw" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="mem_pw_chk">비밀번호 확인</label> <input name="mem_pw_chk"
								id="mem_pw_chk" value='' placeholder="Password" type="password"
								class="form-control" />
								<font name="pw_chk" size="2" color="red"></font>
						</div>
						<div class="form-group">
							<label for="mem_name">이름</label> <input name="mem_name" id="mem_name"
								value='' placeholder="UserName" type="text" class="form-control" />
						</div>
						<!-- <div class="form-group">
							<label for="mem_nickname">별명</label> <input name="mem_nickname" id="mem_nickname"
								value='' placeholder="mem_nickname" type="text" class="form-control" />
						</div> -->
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="Join" />
						</div>
					</form>
					<form role="form" action=${ URLs.URI_MAIN }>
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="go main page" />
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>