<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.gaduda.common.URLs" %> 
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="member" value="${ member }" />
id:${ member.mem_id }
<form role="form" method="post" action=${ URLs.URI_UPDATE_MEMBER_CHK_FULL }>
						<div class="form-group">
						<input type="hidden" name="mem_id" value=${ member.mem_id }>
						</div>
						<div class="form-group">
							<label for="mem_nickname">mem_nickname</label> <input name="mem_nickname" id="mem_nickname"
								value='' placeholder=${ member.mem_nickname } type="text"/>
						</div>
						<div class="form-group">
							<input type="radio" name="mem_sex" value="남">남
							<input type="radio" name="mem_sex" value="여">여
						</div>
						
						<div class="form-group">
							<label for="mem_intro">mem_intro</label> <input name="mem_intro" id="mem_intro"
								value='' placeholder=${ member.mem_intro } type="text"/>
						</div>
						<div class="form-group">
						<label for="mem_birth">생년월일 ${member.mem_birth }</label>
						<input  type="date" placeholder="DD MM YYYY" name="mem_birth" >
						
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="정보수정" />
						</div>

</form>
<!-- <form action="./upload" method="post" enctype="multipart/form-data">
 <input type="file" name="imageFile"><br> 
<input type="submit" value="전송">
 </form> -->


<form role="form" action=${ URLs.URI_UPDATE_MEMBER_PW_PAGE_FULL }
				method="post">
				<div>
					<input type="submit" value="비밀번호 수정">
				</div>
			</form>
</body>
</html>