<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 실패!!!!!!!
	<form role="form" action=${URLs.URI_LOGIN_FULL } method="post">
		<div>
			<input type="submit" value="login" />
		</div>
	</form>
	<form role="form" action=${ URLs.URI_JOIN_VIEW_FULL } method="post">
		<div>
			<input type="submit" value="join" />
		</div>
	</form>
	<form role="form" action=${ URLs.URI_MAIN }>
		<div class="form-group">
			<input type="submit"
				class="btn btn-default btn-login-submit btn-block m-t-md"
				value="go main" />
		</div>
	</form>
</body>
</html>