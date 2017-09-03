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

<style>

#myCanvas {
	border:  1px solid;
}

.roomMake_Canvas_Menu_css {
	display: inline-block;
	position:absolute;
	text-align: center;
	filter:alpha(opacity=50);
}


.roomMake_Canvas_Menu_WallPaper_css {
	margin-top: 10px;
	height: 50px;
}

.lenthinput {
  display: inline-block;
  width: 80px;
  text-align: center;
  margin: 10px;
  color: black;
   background:transparent;
  border:none;
  border-radius: 3px;
  outline: 0;
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

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

</style>
<script src="/resources/script/html2canvas.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#myBar").css("width","75%");
	$("#ing").html("");
	$("#ing").append("75%");
	
	var canvas = document.getElementById("myCanvas");
	var context = canvas.getContext("2d");

	var canvasOffset=$("#roomMake_Canvas_Body").offset();
	var offsetX=canvasOffset.left;
	var offsetY=canvasOffset.top;
	
	
	
    RectDraw();
    roomDraw();
    roomMake_Canvas_DrawImg();
    TextPoition();
    
   
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
			$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1' readonly>MM<div>");
			$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+200).css("left", (figure_X[1]+figure_X[0])/2+500);
			$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2' readonly>MM<div>");
			$("#lengthText2").css("position","absolute").css("top",(figure_Y[2]+figure_Y[1])/2+230).css("left", figure_X[1]+570);
			$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
    	}
    	else if(figure_num==2){
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1'readonly>MM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+210).css("left", (figure_X[0]+figure_X[1])/2+500);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2'readonly>MM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2+220).css("left", figure_X[1]+570);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val3'readonly>MM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+250).css("left", (figure_X[2]+figure_X[3])/2+520);
    		$("#lengthText1Val3").val((figure_X[2]-figure_X[3])*10);
    		
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val4'readonly>MM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2+240).css("left", figure_X[3]+410);
			$("#lengthText1Val4").val((figure_Y[3]-figure_Y[4])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val5'readonly>MM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+250).css("left", (figure_X[4]+figure_X[5])/2+500);
			$("#lengthText1Val5").val((figure_X[4]-figure_X[5])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val6'readonly>MM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2+250).css("left", figure_X[5]+400);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
    	}
    	else if(figure_num==3){
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1'readonly>MM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+210).css("left", (figure_X[0]+figure_X[1])/2+520);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
			
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2'readonly>MM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2+220).css("left", figure_X[1]+560);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
			
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val3'readonly>MM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+210).css("left", (figure_X[2]+figure_X[3])/2+530);
    		$("#lengthText1Val3").val((figure_X[3]-figure_X[2])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val4'readonly>MM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2+230).css("left", figure_X[3]+560);
			$("#lengthText1Val4").val((figure_Y[4]-figure_Y[3])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val5'readonly>MM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+260).css("left", (figure_X[4]+figure_X[5])/2+500);
			$("#lengthText1Val5").val((figure_X[4]-figure_X[5])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val6'readonly>MM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2+200).css("left", figure_X[5]+400);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
    	}
		else if(figure_num==4){
			$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1'readonly>MM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+210).css("left", (figure_X[0]+figure_X[1])/2+500);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2'readonly>MM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2+240).css("left", figure_X[1]+560);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val3'readonly>MM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+260).css("left", (figure_X[2]+figure_X[3])/2+540);
    		$("#lengthText1Val3").val((figure_X[2]-figure_X[3])*10);
    		
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val4'readonly>MM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2+240).css("left", figure_X[3]+560);
			$("#lengthText1Val4").val((figure_Y[4]-figure_Y[3])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val5'readonly>MM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+250).css("left", (figure_X[4]+figure_X[5])/2+500);
			$("#lengthText1Val5").val((figure_X[4]-figure_X[5])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val6'readonly>MM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2+230).css("left", figure_X[5]+400);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
		}
		else if(figure_num==5){
			$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1'readonly>MM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+210).css("left", (figure_X[0]+figure_X[1])/2+500);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2'readonly>MM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2+250).css("left", figure_X[1]+570);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
			
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val3'readonly>MM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+250).css("left", (figure_X[2]+figure_X[3])/2+530);
    		$("#lengthText1Val3").val((figure_X[2]-figure_X[3])*10);
    		
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val4'readonly>MM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2+260).css("left", figure_X[3]+400);
			$("#lengthText1Val4").val((figure_Y[3]-figure_Y[4])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val5'readonly>MM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+200).css("left", (figure_X[4]+figure_X[5])/2+510);
			$("#lengthText1Val5").val((figure_X[5]-figure_X[4])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val6'readonly>MM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2+220).css("left", figure_X[5]+400);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
			
		}
	}
	
	$("#roomMake_Progress_Next3_Button_js").click(function(){
		var myroom_name = $("#roomMake_RoomName_Menu_Name_js").val();
		if(myroom_name==''){
			alert('방이름 입력하시오');
		}else{
			html2canvas(
					$("#roomMake_Canvas_Body"),
					{
						onrendered : function(canvas) {
							var myroom_Img=canvas.toDataURL("image/png");
							var myroom_data = { "myroom_Name": myroom_name, "room_Img": myroom_Img  };

							$.ajax({
								type : "POST",
								data :myroom_data,
								url : "${URLs.URI_ROOMMAKE_FULL}",
								success : function(data) {
									alert(data.MSG);
									location.href=data.URL;
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
<div id="roomMake_Canvas_Body" class="w3-container">

	<canvas id="myCanvas" width="800" height="500" />

</div>
<div class="roomMake_RoomName_Menu_css">
	<table class="w3-container">
		<tr>
			<th class="roommake_RoomName_Menu_Title_css"><b>방 이름 정하기</b></th>
		</tr>
		<tr>
			<td class="roomMake_RoomName_Menu_Name_css">
				<input class="w3-input" type="text" placeholder="방 이름을 입력하세요." id="roomMake_RoomName_Menu_Name_js"name="roomMake_RoomName_Menu_Name">
			</td>
		</tr>
	</table>

</div>
</body>
</html>