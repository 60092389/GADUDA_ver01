<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style type="text/css">

.roomMake_Progress_Button1_css{
	width: 90%; 
	text-align: right;
	padding-bottom: 50px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#roomMake_Progress_Button_js").click(function(){
		if(figure_num==''){
			alert('모양을 선택하세요!');
		}
		else{
			//$(".roomMak_Progress_state1").css("background","yellow");
			//$(".roomMak_Progress_state2").css("background","pink");
			//$(".roomMak_Progress_state3").css("background","yellow");
				$("#myBar").css("width","50%");
				$("#ing").html("");
				$("#ing").append("50%");
			$.ajax({      
				  url : "${URLs.URI_ROOMMAKE_CANVAS_FULL}",
			 		success:function(data){
			 			$("#roomMake_Progress_Position").html(data);
			 		}
		    });
			$.ajax({      
		        url : "${URLs.URI_ROOMMAKE_PROGRESS_BUTTON2_FULL}",
		 		success:function(data){
		 			$("#roomMake_Progress_Button_Position").html(data);
		 		}
		    });
		}
	});
	
});
</script>
	
</head>
<body>
<div class="w3-container roomMake_Progress_Button1_css">
	<button class="w3-button w3-blue" id="roomMake_Progress_Button_js" >다음</button>
</div>
</body>
</html>