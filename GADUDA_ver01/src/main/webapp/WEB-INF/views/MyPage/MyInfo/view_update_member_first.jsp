<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.gaduda.common.URLs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:set var="member" value="${ member }" />
${member.mem_id }
${member.mem_name }
${member.mem_nickname }
${member.mem_sex }
${member.mem_birth }
${member.mem_intro }

<form action="./upload" method="post" enctype="multipart/form-data">
 <input type="file" name="file"><br> 
<input type="submit" value="프로필 사진 변경">
 </form>
 <div>
 <image src="${member.mem_profile_pic }" width=200 height=200 class="img-circle">프로필 사진${member.mem_profile_pic }</image>
 
 </div> 
<form role="form" action=${ URLs.URI_UPDATE_MEMBER_FULL }
				method="post">
				<div>
					<input type="submit" value="회원정보수정">
				</div>
			</form>
			<form role="form" action=${ URLs.URI_MAIN }>
						<div >
							<input type="submit"
								
								value="go main page" />
						</div>
					</form>
			
</body>
</html>