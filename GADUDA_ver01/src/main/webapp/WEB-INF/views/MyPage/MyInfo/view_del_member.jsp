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

	<c:set var="member" value="${ member }" />
	<form role="form" method="post"
		action=${ URLs.URI_DELETE_MEMBER_CHK_FULL }>
		<input type="hidden" value=${ member.mem_id } name="mem_id" />
		<divclass="form-group"> <label for="mem_pw">비밀번호 확인</label> <input
			name="mem_pw" id="mem_pw" value='' placeholder="Password"
			type="password" class="form-control" />
		</div>
		<div class="form-group">
			<input type="submit"
				class="btn btn-default btn-login-submit btn-block m-t-md"
				value="회원탈퇴" />
		</div>
	</form>
	<form role="form" action=${ URLs.URI_MAIN }>
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="go main page" />
						</div>
					</form>
</body>
</html>