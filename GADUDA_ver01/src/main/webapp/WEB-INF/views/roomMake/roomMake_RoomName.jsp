<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: ivory;
	padding: 10px;
}

#myCanvas {
	border: 1px solid red;
}

.roomMake_Canvas_Menu_css {
	display: inline-block;
	position:absolute;
	top:18px;
	left:708px;
	width: 340px;
	height: 300px;
	text-align: center;
	filter:alpha(opacity=50);
}


.roomMake_Canvas_Menu_WallPaper_css {
	margin-top: 10px;
	height: 50px;
}




.roomMake_Canvas_Menu_Linoleum_css {
	margin-top: 10px;
}
.roomMake_Canvas_Menu_Size_css{
	margin-top: 10px;
}

.roomMake_Canvas_Menu_Img_Menu_css {
	margin-top: 10px;
}
.roomMake_Canvas_Menu_Img_css{
	display:inline-table;
  	vertical-align:middle;
    width: 100px;
    height: 100px;

}


.roomMake_RoomName_Menu_css {
	display: inline-block;
	position:absolute;
	top:825px;
	left:700px;
	margin-left: 10px;
	border: 1px solid;
	width: 340px;
	height: 115px;
	text-align: center;
}

.roommake_RoomName_Menu_Title_css {
	border: 1px solid;
}

.roomMake_RoomName_Menu_Name_css {
	border: 1px solid;
	height: 50px;
}



</style>
<script src="resources/script/html2canvas.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var canvas = document.getElementById("myCanvas");
	var context = canvas.getContext("2d");

	var canvasOffset=$("#roomMake_Canvas_Body").offset();
	var offsetX=canvasOffset.left;
	var offsetY=canvasOffset.top;
	
    
	//이미지 시작점
	var roomMake_canvas_img_X = 150;
	var roomMake_canvas_img_Y = 150;
	
	
	var select_img_num = '';
	var turn_img_num = '';
	
	//창문 이미지
	var roomMake_canvas_window_one_img  = new Image();
	roomMake_canvas_window_one_img.src = "https://i.ytimg.com/vi/ZE_dO1wCipE/hqdefault.jpg";
	
	//문이미지
	var roomMake_canvas_door_one_img =  new Image();
	roomMake_canvas_door_one_img.src = "https://i.ytimg.com/vi/jLxD6cxLA1A/hqdefault.jpg";
	
	//액스표 이미지
	var roomMake_canvas_Ximg =  new Image();
	roomMake_canvas_Ximg.src = "https://static4.depositphotos.com/1001003/355/i/450/depositphotos_3552603-stock-photo-3d-rejected-or-rated-x.jpg";
    
	var roomMake_canvas_Turnimg =  new Image();
	roomMake_canvas_Turnimg.src = "https://st2.depositphotos.com/4441075/12231/v/950/depositphotos_122316444-stock-illustration-rotation-arrow-in-a-circle.jpg";
	
	var size_img = new Image();
	size_img.src="http://cfile29.uf.tistory.com/image/224DC14F530F35C5292D53";
	
	var roomMake_canvas_XImg_X ='';
	var roomMake_canvas_XImg_Y = '';
	
	var roomMake_canvas_TurnImg_X ='';
	var roomMake_canvas_TurnImg_Y = '';
	
	var roomMake_canvas_SizeImg_X=[];
	var roomMake_canvas_SizeImg_Y=[];
	
	var roomMake_canvas_draggingImage = false;
	var roomMake_canvas_size = false;
	
    RectDraw();
    roomDraw();
    TextPoition();
    roomMake_Canvas_DrawImg();
    
    
   
    function RectDraw() {
		context.clearRect(0, 0, canvas.width, canvas.height);
	}
    
	function roomDraw() {
		context.beginPath();
		
		context.moveTo(figure_X[0], figure_Y[0]);
		
		for(var i=1; i<figure_size; i++){
			context.lineTo(figure_X[i], figure_Y[i]);
		}
		context.lineTo(figure_X[0], figure_Y[0])
		
		context.strokeStyle = roomMake_canvas_wallPaper_color;
		context.lineWidth = 10;
		context.fillStyle = roomMake_canvas_linoleum_color;
		context.fill();
		context.stroke();
	}
	
	function roomMake_Canvas_DrawImg(){
		
		var i=0;
		while(i<roomMake_canvas_img_arr_size){
			context.drawImage(roomMake_canvas_img_kind_arr[i], 0, 0, 
					roomMake_canvas_img_kind_arr[i].width, roomMake_canvas_img_kind_arr[i].height, 
					roomMake_canvas_img_X_arr[i], roomMake_canvas_img_Y_arr[i],
					roomMake_canvas_img_width_arr[i],roomMake_canvas_img_height_arr[i]);	
			i++;
		}
	}
	
	function TextPoition(){
		if(figure_num==1){
			$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input type='text' id='lengthText1Val1' readonly>CM<div>");
			$("#lengthText1").css("position","absolute").css("top",figure_Y[0]-10).css("left", (figure_X[1]+figure_X[0])/2);
			$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input type='text' id='lengthText1Val2' readonly>CM<div>");
			$("#lengthText2").css("position","absolute").css("top",(figure_Y[2]+figure_Y[1])/2).css("left", figure_X[1]+30);
			$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
    	}
    	else if(figure_num==2){
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input type='text' id='lengthText1Val1'readonly>CM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]-10).css("left", (figure_X[0]+figure_X[1])/2);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input type='text' id='lengthText1Val2'readonly>CM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2).css("left", figure_X[1]+30);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input type='text' id='lengthText1Val3'readonly>CM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+30).css("left", (figure_X[2]+figure_X[3])/2);
    		$("#lengthText1Val3").val((figure_X[2]-figure_X[3])*10);
    		
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input type='text' id='lengthText1Val4'readonly>CM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2).css("left", figure_X[3]-180);
			$("#lengthText1Val4").val((figure_Y[3]-figure_Y[4])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input type='text' id='lengthText1Val5'readonly>CM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+30).css("left", (figure_X[4]+figure_X[5])/2);
			$("#lengthText1Val5").val((figure_X[4]-figure_X[5])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input type='text' id='lengthText1Val6'readonly>CM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2).css("left", figure_X[5]-180);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
    	}
    	else if(figure_num==3){
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input type='text' id='lengthText1Val1'readonly>CM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]-10).css("left", (figure_X[0]+figure_X[1])/2);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
			
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input type='text' id='lengthText1Val2'readonly>CM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2).css("left", figure_X[1]+30);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
			
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input type='text' id='lengthText1Val3'readonly>CM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]-15).css("left", (figure_X[2]+figure_X[3])/2);
    		$("#lengthText1Val3").val((figure_X[3]-figure_X[2])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input type='text' id='lengthText1Val4'readonly>CM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2).css("left", figure_X[3]+30);
			$("#lengthText1Val4").val((figure_Y[4]-figure_Y[3])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input type='text' id='lengthText1Val5'readonly>CM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+30).css("left", (figure_X[4]+figure_X[5])/2);
			$("#lengthText1Val5").val((figure_X[4]-figure_X[5])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input type='text' id='lengthText1Val6'readonly>CM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2).css("left", figure_X[5]-180);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
    	}
		else if(figure_num==4){
			$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input type='text' id='lengthText1Val1'readonly>CM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]-10).css("left", (figure_X[0]+figure_X[1])/2);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input type='text' id='lengthText1Val2'readonly>CM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2).css("left", figure_X[1]+30);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input type='text' id='lengthText1Val3'readonly>CM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+30).css("left", (figure_X[2]+figure_X[3])/2);
    		$("#lengthText1Val3").val((figure_X[2]-figure_X[3])*10);
    		
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input type='text' id='lengthText1Val4'readonly>CM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2).css("left", figure_X[3]+30);
			$("#lengthText1Val4").val((figure_Y[4]-figure_Y[3])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input type='text' id='lengthText1Val5'readonly>CM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+30).css("left", (figure_X[4]+figure_X[5])/2);
			$("#lengthText1Val5").val((figure_X[4]-figure_X[5])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input type='text' id='lengthText1Val6'readonly>CM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2).css("left", figure_X[5]-180);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
		}
		else if(figure_num==5){
			$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input type='text' id='lengthText1Val1'readonly>CM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]-10).css("left", (figure_X[0]+figure_X[1])/2);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input type='text' id='lengthText1Val2'readonly>CM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2).css("left", figure_X[1]+30);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
			
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input type='text' id='lengthText1Val3'readonly>CM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+30).css("left", (figure_X[2]+figure_X[3])/2);
    		$("#lengthText1Val3").val((figure_X[2]-figure_X[3])*10);
    		
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input type='text' id='lengthText1Val4'readonly>CM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2).css("left", figure_X[3]-180);
			$("#lengthText1Val4").val((figure_Y[3]-figure_Y[4])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input type='text' id='lengthText1Val5'readonly>CM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]-15).css("left", (figure_X[4]+figure_X[5])/2);
			$("#lengthText1Val5").val((figure_X[5]-figure_X[4])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input type='text' id='lengthText1Val6'readonly>CM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2).css("left", figure_X[5]-180);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
			
		}
	}
	
	$("#roomMake_Progress_Next3_Button_js").click(function(){
		var myroom_name = $("#roomMake_RoomName_Menu_Name_js").val();
		html2canvas(
				$("#roomMake_Canvas_Body"),
				{
					onrendered : function(canvas) {
						var myroom_Img=canvas.toDataURL("image/png");
						var myroom_data = { "myroom_Name": myroom_name, "room_Img": myroom_Img  };

						$.ajax({
							type : "post",
							data :myroom_data,
							url : "roomMake",
							success : function(data) {
								alert(data.msg);
								try {
								} catch (e) {
									alert('server Error!!');
								}
							}
						});
					}
				});
	});
	
});
</script>
</head>
<body>
<div id="roomMake_Canvas_Body" width="850" height="800">
	<canvas id="myCanvas" width="1030" height="800" />
</div>

<div class="roomMake_RoomName_Menu_css">

		<div class="roommake_RoomName_Menu_Title_css">
			<h3>방 이름 정하기</h3>
		</div>

		<div class="roomMake_RoomName_Menu_Name_css">

			<div>방이름</div>
			방이름:<input type="text" id="roomMake_RoomName_Menu_Name_js"name="roomMake_RoomName_Menu_Name">
		</div>

</div>


</body>
</html>