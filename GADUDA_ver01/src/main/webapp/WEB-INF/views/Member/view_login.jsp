<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form role="form" method="post" action=${ URLs.URI_LOGIN_CHK_FULL }>
						<legend>로그인</legend>
						<div class="form-group">
							<label for="mem_id">이메일 or 아이디</label> <input name="mem_id"
								value='' id="mem_id" placeholder="Id" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="mem_pw">비밀번호</label> <input name="mem_pw"
								id="mem_pw" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="Login" />
						</div>
					</form>
</body>
</html>