<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.designRoom_Progress_Button2_css{
 	width: 90%; 
 	text-align: right;
 	padding-bottom: 50px;
 }
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#designRoom_up_next").click(function() {
			
			if(fig_img_arr.length==0){
				alert("가구를 배치해주세요")
			}else{
				$("#myBar").css("width","75%");
				$("#ing").html("");
				$("#ing").append("75%");
				
				
				$.ajax({
					url : "${URLs.URI_DESIGNROOM_NAME_UP_FULL}",
					success : function(data) {
						$("#design_up_Include_body").html(data);
					}
				});
				$.ajax({
					url:"${URLs.URI_DESIGNROOM_BUTTON2_UP_FULL}",
					success:function(data){
						$("#design_up_Include_button").html(data);
					}
				});
			}
		});
	});
</script>
</head>
<body>
<div class="w3-container designRoom_Progress_Button2_css">
	<button  class="w3-button w3-red" id="designRoom_up_next">다음</button>
</div>
</body>
</html>