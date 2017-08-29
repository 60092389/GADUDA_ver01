<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.lenthinput {
  display: inline-block;
  width: 80px;
  text-align: center;
  margin: 10px;
  color: black;
  background: #FFFFFF;
  border:none;
  border-radius: 3px;
  outline: 0;
}

#myCanvas {
	border:  1px solid;
}

.roomMake_Figure_Pic_css{
	margin: 10px;
}

.roomMake_selectFigureName_css{
    text-align: center;
}

.roomMake_selectFigurePic_css{
	width:90%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	var canvas = document.getElementById("myCanvas");
	var context = canvas.getContext("2d");
	
	var canvasOffset=$("#myCanvas").offset();
	var offsetX=canvasOffset.left;
	var offsetY=canvasOffset.top;	
    
    
    if(figure_num != ''){
        RectDraw();
        roomDraw();
        TextPoition();
    }
    else{
    	context.font="50px Georgia";
    	context.fillText("방 모양 선택하기",300,300);
    }
    
    $(".roomMake_Figure_Pic_css").click(function(){
		figure_num = $(this).attr('value');
		$(".lengthText").remove();
		figure_length();
		
	});
    
    function RectDraw() {
		context.clearRect(0, 0, canvas.width, canvas.height);
	}
    function figure_length(){
    	
    	figure_X =[];
        figure_Y =[];
    	
	    if(figure_num==1){
    		
    		figure_X[0]=300;
    	    figure_Y[0]=150;
    	    
    	    figure_X[1]=500;
    	    figure_Y[1]=150;
    	    
    	    figure_X[2]=500;
    	    figure_Y[2]=350;
    	    
    	    figure_X[3]=300;
    	    figure_Y[3]=350;
    	    
    	    figure_size=4;
    	    
    	}
    	else if(figure_num==2){
    		
    		figure_X[0]=200;
    	    figure_Y[0]=50;
    	    
    	    figure_X[1]=600;
    	    figure_Y[1]=50;
    	    
    	    figure_X[2]=600;
    	    figure_Y[2]=450;
    	    
    	    figure_X[3]=400;
    	    figure_Y[3]=450;
    	    
    	    figure_X[4]=400;
    	    figure_Y[4]=300;
    	    
    	    figure_X[5]=200;
    	    figure_Y[5]=300;
    	    
    	    figure_size=6;
    	}
		else if(figure_num==3){
    		
    		figure_X[0]=200;
    	    figure_Y[0]=50;
    	    
    	    figure_X[1]=400;
    	    figure_Y[1]=50;
    	    
    	    figure_X[2]=400;
    	    figure_Y[2]=250;
    	    
    	    figure_X[3]=600;
    	    figure_Y[3]=250;
    	    
    	    figure_X[4]=600;
    	    figure_Y[4]=450;
    	    
    	    figure_X[5]=200;
    	    figure_Y[5]=450;
    	    
    	    figure_size=6;
    	}
		else if(figure_num==4){
    		
    		figure_X[0]=200;
    	    figure_Y[0]=50;
    	    
    	    figure_X[1]=600;
    	    figure_Y[1]=50;
    	    
    	    figure_X[2]=600;
    	    figure_Y[2]=250;
    	    
    	    figure_X[3]=400;
    	    figure_Y[3]=250;
    	    
    	    figure_X[4]=400;
    	    figure_Y[4]=450;
    	    
    	    figure_X[5]=200;
    	    figure_Y[5]=450;
    	    
    	    figure_size=6;
    	}
		else if(figure_num==5){
    		
    		figure_X[0]=400;
    	    figure_Y[0]=50;
    	    
    	    figure_X[1]=600;
    	    figure_Y[1]=50;
    	    
    	    figure_X[2]=600;
    	    figure_Y[2]=450;
    	    
    	    figure_X[3]=200;
    	    figure_Y[3]=450;
    	    
    	    figure_X[4]=200;
    	    figure_Y[4]=250;
    	    
    	    figure_X[5]=400;
    	    figure_Y[5]=250;
    	    
    	    figure_size=6;
    	}
	    RectDraw();
	    roomDraw();
	    TextPoition();
    	
    }
    
	function roomDraw() {
		
		context.beginPath();
		context.font="50px Georgia";
		context.moveTo(figure_X[0], figure_Y[0]);
		for(var i=1; i<figure_size; i++){
			context.lineTo(figure_X[i], figure_Y[i]);
		}
		context.lineTo(figure_X[0], figure_Y[0])
		
		context.strokeStyle = "black";
		context.lineWidth = 10;
		context.fillStyle = "white";
		context.fill();
		context.stroke();
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
	$("#myCanvas").mousedown(function(e) {handleMouseDown(e);});
	$("#myCanvas").mousemove(function(e){handleMouseMove(e);});
	$("#myCanvas").mouseup(function(e){handleMouseUp(e);});
    $("#myCanvas").mouseout(function(e){handleMouseOut(e);});
    
    function handleMouseDown(e) {
		
    	startX = parseInt(e.clientX-offsetX);
	    startY = parseInt(e.clientY-offsetY);
	    
	    if(figure_num==1){
	    	draggingImage = hitLine1(startX, startY);	    	
	    }
	    else if(figure_num==2){
	    	draggingImage = hitLine2(startX, startY);	    	
	    }
	    else if(figure_num==3){
	    	draggingImage = hitLine3(startX, startY);	    	
	    }
	    else if(figure_num==4){
	    	draggingImage = hitLine4(startX, startY);	    	
	    }
	    else if(figure_num==5){
	    	draggingImage = hitLine5(startX, startY);	    	
	    }


	}
	
    //�ш���
	function hitLine1(x, y) {
		
		if(figure_X[0]+10<x && x<figure_X[1]-10 && figure_Y[0]-10<y && y<figure_Y[1]+10){
			length_num=1;
			return true;
		}
		else if(x<figure_X[1]+10 && figure_X[2]-10<x && figure_Y[1]+10<y && y<figure_Y[2]-10){
			length_num=2;
			return true;
		}
		else if(x<figure_X[2]-10 && figure_X[3]+10<x && figure_Y[2]-10<y && y<figure_Y[3]+10){
			length_num=3;
			return true;
		}
		else if(figure_X[3]-10<x && x<figure_X[0]+10 && y<figure_Y[3]-10 && figure_Y[0]+10<y){
			length_num=4;
			return true;
		}
		return false;
	}
	function hitLine2(x, y) {
		
		if(figure_X[0]+10<x && x<figure_X[1]-10 && figure_Y[0]-10<y && y<figure_Y[1]+10){
			length_num=1;
			return true;
		}
		else if(x<figure_X[1]+10 && figure_X[2]-10<x && figure_Y[1]+10<y && y<figure_Y[2]-10){
			length_num=2;
			return true;
		}
		else if(x<figure_X[2]-10 && figure_X[3]+10<x && y<figure_Y[2]+10 && figure_Y[3]-10<y){
			length_num=3;
			return true;
		}
		else if(figure_X[3]-10<x && x<figure_X[4]+10 && y<figure_Y[3]-10 && figure_Y[4]+10<y){
			length_num=4;
			return true;
		}
		else if(x<figure_X[4]-10 && figure_X[5]+10<x && figure_Y[4]-10<y && y<figure_Y[5]+10){
			length_num=5;
			return true;
		}
		else if(figure_X[5]-10<x && x<figure_X[0]+10 && y<figure_Y[5]-10 && figure_Y[0]+10<y){
			length_num=6;
			return true;
		}
		return false;
	}
	//�깊��
	function hitLine3(x, y) {
		
		if(figure_X[0]+10<x && x<figure_X[1]-10 && figure_Y[0]-10<y && y<figure_Y[1]+10){
			length_num=1;
			return true;
		}
		else if(x<figure_X[1]+10 && figure_X[2]-10<x && figure_Y[1]+10<y && y<figure_Y[2]-10){
			length_num=2;
			return true;
		}
		else if(figure_X[2]+10<x && x<figure_X[3]-10 && figure_Y[2]-10<y && y<figure_Y[3]+10){
			length_num=3;
			return true;
		}
		else if(figure_X[3]-10<x && x<figure_X[4]+10 && figure_Y[3]+10<y && y<figure_Y[4]-10){
			length_num=4;
			return true;
		}
		else if(x<figure_X[4]-10 && figure_X[5]+10<x && figure_Y[4]-10<y && y<figure_Y[5]+10){
			length_num=5;
			return true;
		}
		else if(figure_X[5]-10<x && x<figure_X[0]+10 && y<figure_Y[5]-10 && figure_Y[0]+10<y){
			length_num=6;
			return true;
		}
		return false;
	}
	function hitLine4(x, y) {
		
		if(figure_X[0]+10<x && x<figure_X[1]-10 && figure_Y[0]-10<y && y<figure_Y[1]+10){
			length_num=1;
			return true;
		}
		else if(x<figure_X[1]+10 && figure_X[2]-10<x && figure_Y[1]+10<y && y<figure_Y[2]-10){
			length_num=2;
			return true;
		}
		else if(x<figure_X[2]-10 && figure_X[3]+10<x && y<figure_Y[2]+10 && figure_Y[3]-10<y){
			length_num=3;
			return true;
		}
		else if(figure_X[3]-10<x && x<figure_X[4]+10 && figure_Y[3]+10<y && y<figure_Y[4]-10){
			length_num=4;
			return true;
		}
		else if(x<figure_X[4]-10 && figure_X[5]+10<x && figure_Y[4]-10<y && y<figure_Y[5]+10){
			length_num=5;
			return true;
		}
		else if(figure_X[5]-10<x && x<figure_X[0]+10 && y<figure_Y[5]-10 && figure_Y[0]+10<y){
			length_num=6;
			return true;
		}
		return false;
	}
	function hitLine5(x, y) {
		
		if(figure_X[0]+10<x && x<figure_X[1]-10 && figure_Y[0]-10<y && y<figure_Y[1]+10){
			length_num=1;
			return true;
		}
		else if(x<figure_X[1]+10 && figure_X[2]-10<x && figure_Y[1]+10<y && y<figure_Y[2]-10){
			length_num=2;
			return true;
		}
		else if(x<figure_X[2]-10 && figure_X[3]+10<x && y<figure_Y[2]+10 && figure_Y[3]-10<y){
			length_num=3;
			return true;
		}
		else if(figure_X[3]-10<x && x<figure_X[4]+10 && y<figure_Y[3]-10 && figure_Y[4]+10<y){
			length_num=4;
			return true;
		}
		else if(figure_X[4]+10<x && x<figure_X[5]-10 && figure_Y[4]-10<y && y<figure_Y[5]+10){
			length_num=5;
			return true;
		}
		else if(figure_X[5]-10<x && x<figure_X[0]+10 && y<figure_Y[5]-10 && figure_Y[0]+10<y){
			length_num=6;
			return true;
		}
		return false;
	}
		
	function handleMouseMove(e){    	
		
		if(draggingImage){
    		
    		var mouseX=parseInt(e.clientX-offsetX);
	        var mouseY=parseInt(e.clientY-offsetY);
	        
	        if(figure_num==1){
	        	if(length_num==1){
		        	figure_Y[0]=mouseY;
		        	figure_Y[1]=mouseY;
		        }
				else if(length_num==2){
					
					figure_X[1]=mouseX;
		        	figure_X[2]=mouseX;
				}
				else if(length_num==3){
					
					figure_Y[2]=mouseY;
		        	figure_Y[3]=mouseY;
				}
				else if(length_num==4){
					figure_X[3]=mouseX;
		        	figure_X[0]=mouseX;
				}
	        }
	        
	        else if(figure_num==2 || 3 || 4 || 5){
	        	if(length_num==1){
		        	figure_Y[0]=mouseY;
		        	figure_Y[1]=mouseY;
		        }
				else if(length_num==2){
					
					figure_X[1]=mouseX;
		        	figure_X[2]=mouseX;
				}
				else if(length_num==3){
					
					figure_Y[2]=mouseY;
		        	figure_Y[3]=mouseY;
				}
				else if(length_num==4){
					figure_X[3]=mouseX;
		        	figure_X[4]=mouseX;
				}
				else if(length_num==5){
					figure_Y[4]=mouseY;
		        	figure_Y[5]=mouseY;
				}
				else if(length_num==6){
					figure_X[5]=mouseX;
		        	figure_X[0]=mouseX;
				}
	        }
	        RectDraw();
        	roomDraw();
        	$(".lengthText").remove();
        	TextPoition();
	    }
    }
	function handleMouseUp(e){
		num='';
		draggingImage=false;
	 
	}

	function handleMouseOut(e){
	      handleMouseUp(e);
	}
	
});

</script>
</head>
<body>
<div id="roomMake_Canvas_Body" class="w3-container">
	
	<canvas id="myCanvas" width="800" height="500" />


	<div class="roomMake_SelectFigure_Pic_Menu_css" >
		<table class="w3-container">
  			<tr>
		    <th class="roomMake_selectFigureName_css">사각형</th>
		    <th class="roomMake_selectFigureName_css">ㄱ자형</th>
		    <th class="roomMake_selectFigureName_css">ㄴ자형</th>
		    <th class="roomMake_selectFigureName_css">역 ㄱ자형</th>
		    <th class="roomMake_selectFigureName_css">역 ㄴ자형</th>
		  </tr>
		  <tr>
		    <th class="roomMake_Figure_Pic_css" value="1" ><img  class="roomMake_selectFigurePic_css" alt="사각형" src="/resources/Images/Room/roomMakequadrangula.png" ></th>
		    <th class="roomMake_Figure_Pic_css" value="2" ><img  class="roomMake_selectFigurePic_css" alt="ㄱ자형" src="/resources/Images/Room/roomMakeseven.png" ></th>
		    <th class="roomMake_Figure_Pic_css" value="3" ><img  class="roomMake_selectFigurePic_css" alt="ㄱ자형" src="/resources/Images/Room/roomMakeL.png" ></th>
		    <th class="roomMake_Figure_Pic_css" value="4" ><img  class="roomMake_selectFigurePic_css" alt="역 ㄱ자형"  src="/resources/Images/Room/roomMakereverseseven.png"></th>
		    <th class="roomMake_Figure_Pic_css" value="5" ><img  class="roomMake_selectFigurePic_css" alt="역 ㄴ자형" src="/resources/Images/Room/roomMakereverseL.png" ></th>
		  </tr>
		</table>
	</div>
</div>
</body>
</html>