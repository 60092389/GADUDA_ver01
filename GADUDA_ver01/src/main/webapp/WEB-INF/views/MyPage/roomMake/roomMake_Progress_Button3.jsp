<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.roomMake_Progress_Button3_css{
	width: 90%; 
	text-align: right;
	padding-bottom: 50px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#roomMake_Progress_After2_Button_js").click(function(){
		
		$(".roomMak_Progress_state1").css("background","pink");
		$(".roomMak_Progress_state2").css("background","yellow");
		$(".roomMak_Progress_state3").css("background","yellow");
		
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
	});
	
});
</script>
</head>
<body>
<div class="w3-container roomMake_Progress_Button3_css">
	<button class="w3-button w3-red" id="roomMake_Progress_After2_Button_js">이전</button>
	<button class="w3-button w3-blue" id="roomMake_Progress_Next3_Button_js" >다음</button>
</div>

</body>
</html>