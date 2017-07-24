<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.roomMake_Progress_Button2_css{
	border: 1px solid; 
	width: 1080px; 
	height: 150px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#roomMake_Progress_After_Button_js").click(function(){
		$(".roomMak_Progress_state1").css("background","pink");
		$(".roomMak_Progress_state2").css("background","yellow");
		$(".roomMak_Progress_state3").css("background","yellow");
		
		roomMake_canvas_img_kind_num_arr=[];
		roomMake_canvas_img_kind_arr=[];
		roomMake_canvas_img_X_arr=[];
		roomMake_canvas_img_Y_arr=[];
		roomMake_canvas_img_height_arr=[];
		roomMake_canvas_img_width_arr=[];
		roomMake_canvas_img_state_arr=[];
		roomMake_canvas_img_arr_size=0;
		roomMake_canvas_linoleum_color = "white";
		roomMake_canvas_wallPaper_color = "black";
		
		$.ajax({      
	        url : "${URLs.URI_ROOMMAKE_SELECT_FIGURE_FULL}",
	 		success:function(data){
	 			$("#roomMake_Progress_Position").html(data);
	 		}
	    }); 
		$.ajax({      
	        url : "${URLs.URI_ROOMMAKE_PROGRESS_BUTTON1_FULL}",
	 		success:function(data){
	 			$("#roomMake_Progress_Button_Position").html(data);
	 		}
	    });
	});
	$("#roomMake_Progress_Next_Button_js").click(function(){
		$(".roomMak_Progress_state1").css("background","yellow");
		$(".roomMak_Progress_state2").css("background","yellow");
		$(".roomMak_Progress_state3").css("background","pink");
		
		
		$.ajax({      
	        url : "${URLs.URI_ROOMMAKEROOMNAE_FULL }",
	 		success:function(data){
	 			$("#roomMake_Progress_Position").html(data);
	 		}
	    }); 
		$.ajax({      
	        url : "${URLs.URI_ROOMMAKE_PROGRESS_BUTTON3_FULL}",
	 		success:function(data){
	 			$("#roomMake_Progress_Button_Position").html(data);
	 		}
	    });
	});
	
});
</script>
</head>
<body>
<div class="roomMake_Progress_Button2_css">
<button id="roomMake_Progress_After_Button_js">이전</button>
<button id="roomMake_Progress_Next_Button_js">다음</button>
</div>
</body>
</html>