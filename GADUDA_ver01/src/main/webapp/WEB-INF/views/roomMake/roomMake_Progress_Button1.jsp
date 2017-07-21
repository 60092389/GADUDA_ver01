<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.roomMake_Progress_Button1_css{
	border: 1px solid; 
	width: 1030px; 
	height: 150px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#roomMake_Progress_Button_js").click(function(){
		if(figure_num==''){
			alert('Select Figure');
		}
		else{
			$(".roomMak_Progress_state1").css("background","yellow");
			$(".roomMak_Progress_state2").css("background","pink");
			$(".roomMak_Progress_state3").css("background","yellow");
			$.ajax({      
				  url : "roomMake_Canvas",
			 		success:function(data){
			 			$("#roomMake_Progress_Position").html(data);
			 		}
		    });
			$.ajax({      
		        url : "roomMake_Progress_Button2",
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
<div class="roomMake_Progress_Button1_css">
	<button id="roomMake_Progress_Button_js" >다음</button>
</div>
</body>
</html>