<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#myCanvas_div{
	float:left;
	width:850;
	height:800;
	margin-right:10px;
}
#designroom_name{
	float:left;
	width:90%;
	height:100%;
}
#designroom_name_title{

	width:100%;
	height:200;
}
#designroom_name_text{

	width:100%;
	height:200;
}

#myProgress {
  width: 100%;
  background-color: #ddd;
}

#myBar {
  width: 0%;
  height: 30px;
  background-color: #4CAF50;
  text-align: center;
  line-height: 30px;
  color: white;
}

</style>
<script src="/resources/script/html2canvas.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#myBar").css("width","75%");
	$("#ing").html("");
	$("#ing").append("75%");
	
	var furniture_kind= ''
		
		var canvas = document.getElementById("myCanvas");
		var context = canvas.getContext("2d");
		
		var canvasOffset=$("#design_Include_body").offset();
		var offsetX=canvasOffset.left;
		var offsetY=canvasOffset.top;
		
		
		var roomMake_canvas_window_one_img  = new Image();
		roomMake_canvas_window_one_img.src = select_myroom;
		
		roomMake_canvas_window_one_img.onload = function(){ 
			RectDraw();
			drawRoom();
			drawFigImg();
		}
		
		
		function RectDraw() {
			context.clearRect(0, 0, canvas.width, canvas.height);
		}
		function drawRoom(){
			context.drawImage(roomMake_canvas_window_one_img, 0, 0);		
		}
		function drawFigImg(){
			for(var i=0; i<fig_arr_length;i++){
				context.drawImage(fig_img_arr[i], 0, 0, 
						fig_img_arr[i].width, fig_img_arr[i].height, 
						fig_img_X_arr[i],fig_img_Y_arr[i],
						fig_img_width_length_arr[i],fig_img_height_length_arr[i]);
			}
		}
		
		
		
		$("#designRoom_next3").click(function(){
			var designRoom_name=$("#designroom_name_text_value").val();
			if(designRoom_name == ''){
				alert("이름을 입력해주세요")
			}else{
				
				var fig_img_src_arr = [];
				for(var i =0; i<fig_img_arr.length;i++){
					fig_img_src_arr[i]=fig_img_arr[i].src;
				}
				
				html2canvas(
						$("#myCanvas_div"),
						{
							onrendered : function(canvas) {
								var designRoom_Img=canvas.toDataURL("image/png");
								var design_data = { "fig_img_src":fig_img_src_arr,"fig_num":fig_num_arr,"fig_img_X":fig_img_X_arr,"fig_img_Y":fig_img_Y_arr,"fig_img_width_length":fig_img_width_length_arr,"fig_img_height_length":fig_img_height_length_arr,"fig_img_state":fig_img_state_arr};      
								$.ajax({
									type : "POST",
									data :design_data,
									url : "/room/ss7",
									success : function() {
										
									}
								});
							}
				});
			}
			
		});
});
		
</script>
</head>
<body>
<div id="myCanvas_div" class="w3-container">
	<canvas id="myCanvas" width="1030" height="800" />
	
	<div id="designroom_name">
		<table class="w3-container">
			<tr>
				<th class="w3-border" id="designroom_name_title"><b>방 이름 정하기</b></th>
			</tr>
			<tr>
				<td class="w3-border" id="designroom_name_text">
					<input class="w3-input" type="text" placeholder="방 이름을 입력하세요." id="designroom_name_text_value" name="designroom_ArrName_Menu_Name">
				</td>
			</tr>
		</table>

	</div>
	
</div>

</body>
</html>