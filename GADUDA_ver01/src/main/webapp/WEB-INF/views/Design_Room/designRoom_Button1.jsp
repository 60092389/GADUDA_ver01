<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">

.designRoom_Progress_Button1_css{
	width: 90%; 
	text-align: right;
	padding-bottom: 50px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#designRoom_next1").click(function(){
		if(select_myroom == ''){
			alert("방을 선택하세요!")
		}else{
			$("#myBar").css("width","50%");
			$("#ing").html("");
			$("#ing").append("50%");
			$.ajax({
				url:"${URLs.URI_DESIGNROOM_CANVAS_FULL}",
				success:function(data){
					$("#design_Include_body").html(data);
				}
			});
			$.ajax({
				url:"${URLs.URI_DESIGNROOM_BUTTON2_FULL}",
				success:function(data){
					$("#design_Include_button").html(data);
				}
			});
			
		}
		
	});
});
</script>
</head>
<body>
<div class="w3-container designRoom_Progress_Button1_css">
	<button class="w3-button w3-blue" id="designRoom_next1" >다음</button>
</div>
</body>
</html>