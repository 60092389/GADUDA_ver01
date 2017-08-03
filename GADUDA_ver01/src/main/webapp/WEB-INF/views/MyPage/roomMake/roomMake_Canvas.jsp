<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

.roomMake_selectColorName_css{
    text-align: center;
    size: 30px;
    margin: 10px;
}

.roomMake_selectColor_css{
    text-align: center;
    size: 30px;
    margin: 10px;
}


.lenthinput {
  display: inline-block;
  width: 80px;
  text-align: center;
  margin: 10px;
  color: black;
  background: #FFFFFF;
  border: 1px solid #999999;
  border-radius: 3px;
  outline: 0;
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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	
	var canvas = document.getElementById("myCanvas");
	var context = canvas.getContext("2d");

	var canvasOffset=$("#roomMake_Canvas_Body").offset();
	var offsetX=canvasOffset.left;
	var offsetY=canvasOffset.top;
	
    
	//�대�몄� ������
	var roomMake_canvas_img_X = 150;
	var roomMake_canvas_img_Y = 150;
	
	
	var select_img_num = '';
	var turn_img_num = '';
	
	//李쎈Ц �대�몄�
	var roomMake_canvas_window_one_img  = new Image();
	roomMake_canvas_window_one_img.src = "/resources/Images/Room/roomMake_window_one.png";
	
	//臾몄�대�몄�
	var roomMake_canvas_door_one_img =  new Image();
	roomMake_canvas_door_one_img.src = "/resources/Images/Room/roomMake_door_one.png";
	
	//�≪�ㅽ�� �대�몄�
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
    
    if(roomMake_canvas_img_kind_num_arr[0]!=''){
    	roomMake_Canvas_DrawCanvas();
    }
    
    //�닿구 �ㅽ����硫� ��援�
    function roomMake_Canvas_DrawCanvas(){
		RectDraw();
		roomDraw();
		roomMake_Canvas_DrawImg();
	}
   
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
	//x�대�몄� 洹몃━湲�
	function roomMake_Draw_X_Img() {
			
		roomMake_canvas_XImg_X = roomMake_canvas_img_X_arr[select_img_num]+roomMake_canvas_img_width_arr[select_img_num];
		roomMake_canvas_XImg_Y = roomMake_canvas_img_Y_arr[select_img_num];
		
		context.drawImage(roomMake_canvas_Ximg, 0, 0, roomMake_canvas_Ximg.width, roomMake_canvas_Ximg.height, roomMake_canvas_XImg_X, roomMake_canvas_XImg_Y, 20,20);
	}
	
	function roomMake_Draw_Turn_Img() {
		
		roomMake_canvas_TurnImg_X = 
			roomMake_canvas_img_X_arr[select_img_num]+(roomMake_canvas_img_width_arr[select_img_num]/2)-(40/2);
		
		roomMake_canvas_TurnImg_Y = roomMake_canvas_img_Y_arr[select_img_num] + roomMake_canvas_img_height_arr[select_img_num] + 20;
		
		context.drawImage(roomMake_canvas_Turnimg, 0, 0, 
				roomMake_canvas_Turnimg.width, roomMake_canvas_Turnimg.height, 
				roomMake_canvas_TurnImg_X, roomMake_canvas_TurnImg_Y, 
				40,40);
	}
	function roomMake_Draw_Size_Img(){
		
				
		roomMake_canvas_SizeImg_X[0]=roomMake_canvas_img_X_arr[select_img_num]-40;
		roomMake_canvas_SizeImg_Y[0]=roomMake_canvas_img_Y_arr[select_img_num]-40;
		
		roomMake_canvas_SizeImg_X[1]=roomMake_canvas_img_X_arr[select_img_num]+roomMake_canvas_img_width_arr[select_img_num];
		roomMake_canvas_SizeImg_Y[1]=roomMake_canvas_img_Y_arr[select_img_num]-40;
		
		roomMake_canvas_SizeImg_X[2]=roomMake_canvas_img_X_arr[select_img_num]-40;
		roomMake_canvas_SizeImg_Y[2]=roomMake_canvas_img_Y_arr[select_img_num]+roomMake_canvas_img_height_arr[select_img_num];
		
		roomMake_canvas_SizeImg_X[3]=roomMake_canvas_img_X_arr[select_img_num]+roomMake_canvas_img_width_arr[select_img_num];
		roomMake_canvas_SizeImg_Y[3]=roomMake_canvas_img_Y_arr[select_img_num]+roomMake_canvas_img_height_arr[select_img_num];
		
		for(var i =0; i<4; i++){
			context.drawImage(size_img, 0, 0, 
					size_img.width, size_img.height, 
					roomMake_canvas_SizeImg_X[i], roomMake_canvas_SizeImg_Y[i], 
					40,40);
		}
		
	}
	
	
	$('#roomMake_Canvas_Menu_Window_One_js').click(function() {
		
		roomMake_canvas_img_kind_num_arr[roomMake_canvas_img_arr_size]=1;
		roomMake_canvas_img_kind_arr[roomMake_canvas_img_arr_size]=roomMake_canvas_window_one_img;
			
		roomMake_canvas_img_X_arr[roomMake_canvas_img_arr_size]=roomMake_canvas_img_X;
		roomMake_canvas_img_Y_arr[roomMake_canvas_img_arr_size]=roomMake_canvas_img_Y;
		
		roomMake_canvas_img_width_arr[roomMake_canvas_img_arr_size]=100;
		roomMake_canvas_img_height_arr[roomMake_canvas_img_arr_size]=30;
		
		roomMake_canvas_img_state_arr[roomMake_canvas_img_arr_size]=1;
		
		roomMake_canvas_img_arr_size++;
		
		roomMake_Canvas_DrawCanvas();
		
	});
	
	$('#roomMake_Canvas_Menu_Door_One_js').click(function() {
		
		roomMake_canvas_img_kind_num_arr[roomMake_canvas_img_arr_size]=2;
		roomMake_canvas_img_kind_arr[roomMake_canvas_img_arr_size]=roomMake_canvas_door_one_img;
		
		roomMake_canvas_img_X_arr[roomMake_canvas_img_arr_size]=roomMake_canvas_img_X;
		roomMake_canvas_img_Y_arr[roomMake_canvas_img_arr_size]=roomMake_canvas_img_Y;
		
		roomMake_canvas_img_width_arr[roomMake_canvas_img_arr_size]=100;
		roomMake_canvas_img_height_arr[roomMake_canvas_img_arr_size]=100;
		
		roomMake_canvas_img_state_arr[roomMake_canvas_img_arr_size]=1;
		
		roomMake_canvas_img_arr_size++;
		
		roomMake_Canvas_DrawCanvas();
		
	});
	//벽색 바꿈
	$(".WallPaper_Color").click(function(){
		roomMake_canvas_wallPaper_color =$(this).attr('value');
		roomMake_Canvas_DrawCanvas();
	});
	
	//바닥 색 바꿈
	$(".Linoleum_Color").click(function(){
		roomMake_canvas_linoleum_color =$(this).attr('value');
		roomMake_Canvas_DrawCanvas();
	});	
	
	
	
	$("#myCanvas").mousedown(function(e) {handleMouseDown(e);});
	$("#myCanvas").mousemove(function(e){handleMouseMove(e);});
	$("#myCanvas").mouseup(function(e){handleMouseUp(e);});
    $("#myCanvas").mouseout(function(e){handleMouseOut(e);});
    
    function handleMouseDown(e) {
		
    	startX = parseInt(e.clientX-offsetX);
	    startY = parseInt(e.clientY-offsetY);
		
	    var roomMake_Canvas_HitNum=hitImg(startX, startY);
	    
	    if(roomMake_Canvas_HitNum==1){
	    	roomMake_Draw_Ser_Img();
	    	roomMake_Img_TextPosition();
	    	roomMake_canvas_draggingImage=true;
	    }
	    else if(roomMake_Canvas_HitNum==2){
	    	roomMake_canvas_size=true;
	    }
	    else if(roomMake_Canvas_HitNum==3){
	    	roomMake_Canvas_Delete_Img();
	    	roomMake_canvas_XImg_X = '';
			roomMake_canvas_XImg_Y = '';
	    }
	    else if(roomMake_Canvas_HitNum==4){
	    	roomMake_Canvas_Turn_Img();
	    	roomMake_Canvas_DrawCanvas();
	    }
	    
	}
	
	function hitImg(x, y) {
		
		
		for(var i =0; i<roomMake_canvas_img_arr_size; i++){
			if(roomMake_canvas_img_X_arr[i]<x && 
					x<roomMake_canvas_img_X_arr[i]+roomMake_canvas_img_width_arr[i]&&
					roomMake_canvas_img_Y_arr[i]<y 
					&& y<roomMake_canvas_img_Y_arr[i]+roomMake_canvas_img_height_arr[i] ){
				
				select_img_num=i;
				return 1;
			}
		}
		for(var i=0; i<4; i++){
			if(x >roomMake_canvas_SizeImg_X[i] && x<roomMake_canvas_SizeImg_X[i]+40 && 
					y>roomMake_canvas_SizeImg_Y[i] && y < roomMake_canvas_SizeImg_Y[i]+40){
				turn_img_num=i;
				return 2;
			}
		}
		
		if(x > roomMake_canvas_XImg_X && x<roomMake_canvas_XImg_X+20 && y>roomMake_canvas_XImg_Y && y < roomMake_canvas_XImg_Y+20){
			return 3;
		}
		
		if(x > roomMake_canvas_TurnImg_X && x<roomMake_canvas_TurnImg_X+40 && y>roomMake_canvas_TurnImg_Y && y < roomMake_canvas_TurnImg_Y+40){
			return 4;
		}
		
		$(".Img_lengthText").remove();
		roomMake_canvas_TurnImg_X ='';
		roomMake_canvas_TurnImg_Y = '';
		roomMake_canvas_SizeImg_X=[]  
		roomMake_canvas_SizeImg_Y=[]
		select_img_num='';
		roomMake_Canvas_DrawCanvas()
		
		
		return -1;
	}
	function roomMake_Draw_Ser_Img(){
		roomMake_Draw_X_Img();
		roomMake_Draw_Turn_Img();
		roomMake_Draw_Size_Img();
	}
	
	function roomMake_Canvas_Delete_Img(){
		
		roomMake_canvas_img_kind_num_arr.splice(select_img_num, 1);
		roomMake_canvas_img_kind_arr.splice(select_img_num, 1);
		roomMake_canvas_img_X_arr.splice(select_img_num, 1);
		roomMake_canvas_img_Y_arr.splice(select_img_num, 1);
		roomMake_canvas_img_height_arr.splice(select_img_num, 1);
		roomMake_canvas_img_width_arr.splice(select_img_num, 1);
		roomMake_canvas_img_state_arr.splice(select_img_num, 1);
		
		roomMake_canvas_img_arr_size--;
		$(".Img_lengthText").remove();
		roomMake_Canvas_DrawCanvas();
	}
	
	function roomMake_Canvas_Turn_Img(){
		var img_turn = new Image();
		var temp = '';
		
		if(roomMake_canvas_img_kind_num_arr[select_img_num]==1){
			
			if(roomMake_canvas_img_state_arr[select_img_num]==1){
				img_turn.src="/resources/Images/Room/roomMake_window_two.png";
				roomMake_canvas_img_kind_arr[select_img_num]=img_turn;
				temp=roomMake_canvas_img_height_arr[select_img_num];
				roomMake_canvas_img_height_arr[select_img_num]=roomMake_canvas_img_width_arr[select_img_num];
				roomMake_canvas_img_width_arr[select_img_num]=temp;
				roomMake_canvas_img_state_arr[select_img_num]=2;
			}
			else if(roomMake_canvas_img_state_arr[select_img_num]==2){
				img_turn.src="/resources/Images/Room/roomMake_window_three.png";
				roomMake_canvas_img_kind_arr[select_img_num]=img_turn;
				temp=roomMake_canvas_img_height_arr[select_img_num];
				roomMake_canvas_img_height_arr[select_img_num]=roomMake_canvas_img_width_arr[select_img_num];
				roomMake_canvas_img_width_arr[select_img_num]=temp;
				roomMake_canvas_img_state_arr[select_img_num]=3;
				
			}
			else if(roomMake_canvas_img_state_arr[select_img_num]==3){
				img_turn.src="/resources/Images/Room/roomMake_window_four.png";
				roomMake_canvas_img_kind_arr[select_img_num]=img_turn;
				temp=roomMake_canvas_img_height_arr[select_img_num];
				roomMake_canvas_img_height_arr[select_img_num]=roomMake_canvas_img_width_arr[select_img_num];
				roomMake_canvas_img_width_arr[select_img_num]=temp;
				roomMake_canvas_img_state_arr[select_img_num]=4;
				
			}
			else if(roomMake_canvas_img_state_arr[select_img_num]==4){
				img_turn.src="/resources/Images/Room/roomMake_window_one.png";
				roomMake_canvas_img_kind_arr[select_img_num]=img_turn;
				temp=roomMake_canvas_img_height_arr[select_img_num];
				roomMake_canvas_img_height_arr[select_img_num]=roomMake_canvas_img_width_arr[select_img_num];
				roomMake_canvas_img_width_arr[select_img_num]=temp;
				roomMake_canvas_img_state_arr[select_img_num]=1;
				
			}
			
		}
		
		else if(roomMake_canvas_img_kind_num_arr[select_img_num]==2){
			
			if(roomMake_canvas_img_state_arr[select_img_num]==1){
				img_turn.src="/resources/Images/Room/roomMake_door_two.png";
				roomMake_canvas_img_kind_arr[select_img_num]=img_turn;
				temp=roomMake_canvas_img_height_arr[select_img_num];
				roomMake_canvas_img_height_arr[select_img_num]=roomMake_canvas_img_width_arr[select_img_num];
				roomMake_canvas_img_width_arr[select_img_num]=temp;
				roomMake_canvas_img_state_arr[select_img_num]=2;
			}
			else if(roomMake_canvas_img_state_arr[select_img_num]==2){
				img_turn.src="/resources/Images/Room/roomMake_door_three.png";
				roomMake_canvas_img_kind_arr[select_img_num]=img_turn;
				temp=roomMake_canvas_img_height_arr[select_img_num];
				roomMake_canvas_img_height_arr[select_img_num]=roomMake_canvas_img_width_arr[select_img_num];
				roomMake_canvas_img_width_arr[select_img_num]=temp;
				roomMake_canvas_img_state_arr[select_img_num]=3;
				
			}
			else if(roomMake_canvas_img_state_arr[select_img_num]==3){
				img_turn.src="/resources/Images/Room/roomMake_door_four.png";
				roomMake_canvas_img_kind_arr[select_img_num]=img_turn;
				temp=roomMake_canvas_img_height_arr[select_img_num];
				roomMake_canvas_img_height_arr[select_img_num]=roomMake_canvas_img_width_arr[select_img_num];
				roomMake_canvas_img_width_arr[select_img_num]=temp;
				roomMake_canvas_img_state_arr[select_img_num]=4;
				
			}
			else if(roomMake_canvas_img_state_arr[select_img_num]==4){
				img_turn.src="/resources/Images/Room/roomMake_door_one.png";
				roomMake_canvas_img_kind_arr[select_img_num]=img_turn;
				temp=roomMake_canvas_img_height_arr[select_img_num];
				roomMake_canvas_img_height_arr[select_img_num]=roomMake_canvas_img_width_arr[select_img_num];
				roomMake_canvas_img_width_arr[select_img_num]=temp;
				roomMake_canvas_img_state_arr[select_img_num]=1;
				
			}
			
		}
		roomMake_Canvas_DrawCanvas();
		roomMake_Draw_Ser_Img();
	}
		
	function handleMouseMove(e){    	
		
		if(roomMake_canvas_draggingImage){
    		var mouseX=parseInt(e.clientX-offsetX);
	        var mouseY=parseInt(e.clientY-offsetY);
	        roomMake_canvas_img_X_arr[select_img_num]=mouseX;
			roomMake_canvas_img_Y_arr[select_img_num]=mouseY;
			
			roomMake_Canvas_DrawCanvas();
			roomMake_Draw_X_Img();
			roomMake_Draw_Turn_Img();
			roomMake_Draw_Size_Img();
			$(".Img_lengthText").remove();
			roomMake_Img_TextPosition();
	    }
		if(roomMake_canvas_size){
			var mouseX=parseInt(e.clientX-offsetX);
	        var mouseY=parseInt(e.clientY-offsetY);
	        
			if(turn_img_num==0){
				
				var temp_width=roomMake_canvas_img_X_arr[select_img_num]-mouseX;
		        var temp_height=roomMake_canvas_img_Y_arr[select_img_num]-mouseY;
		        
		        roomMake_canvas_img_X_arr[select_img_num]=mouseX;
				roomMake_canvas_img_Y_arr[select_img_num]=mouseY;
				
				roomMake_canvas_img_width_arr[select_img_num]=roomMake_canvas_img_width_arr[select_img_num]+temp_width;
				roomMake_canvas_img_height_arr[select_img_num]=roomMake_canvas_img_height_arr[select_img_num]+temp_height;
			}
			else if(turn_img_num==1){
				
				var temp_width=mouseX-roomMake_canvas_img_X_arr[select_img_num];
		        var temp_height=roomMake_canvas_img_height_arr[select_img_num]+roomMake_canvas_img_Y_arr[select_img_num]-mouseY;
		        
		        roomMake_canvas_img_width_arr[select_img_num]=temp_width;
				roomMake_canvas_img_height_arr[select_img_num]=temp_height;
				roomMake_canvas_img_Y_arr[select_img_num]=mouseY;
				
			}
			else if(turn_img_num==2){
				var temp_width=roomMake_canvas_img_width_arr[select_img_num]+roomMake_canvas_img_X_arr[select_img_num]-mouseX;
		        var temp_height=mouseY-roomMake_canvas_img_Y_arr[select_img_num];
		        
		        roomMake_canvas_img_width_arr[select_img_num]=temp_width;
				roomMake_canvas_img_height_arr[select_img_num]=temp_height;
				roomMake_canvas_img_X_arr[select_img_num]=mouseX;
			}
			else if(turn_img_num==3){
				var temp_width=mouseX-roomMake_canvas_img_X_arr[select_img_num];
		        var temp_height=mouseY-roomMake_canvas_img_Y_arr[select_img_num];
		        
		        roomMake_canvas_img_width_arr[select_img_num]=temp_width;
				roomMake_canvas_img_height_arr[select_img_num]=temp_height;
			}
			$(".Img_lengthText").remove();
			roomMake_Img_TextPosition();
			roomMake_Canvas_DrawCanvas();
			roomMake_Draw_Ser_Img();
		}
		
	     
    }
	function handleMouseUp(e){
		roomMake_canvas_draggingImage=false;
		roomMake_canvas_size=false;
	 
	}

	function handleMouseOut(e){
	      handleMouseUp(e);
	}
	
	function roomMake_Img_TextPosition(){
    	
    	$("#roomMake_Canvas_Body").append("<div id='Img_lengthText1' class='Img_lengthText'><input class='lenthinput' type='text' id='Img_lengthText1Val1' readonly>MM<div>");
		$("#Img_lengthText1").css("position","absolute").css("top",roomMake_canvas_img_Y_arr[select_img_num]+250).css("left",roomMake_canvas_img_X_arr[select_img_num]+(roomMake_canvas_img_width_arr[select_img_num]/2)+500);
		$("#Img_lengthText1Val1").val(roomMake_canvas_img_width_arr[select_img_num]*10);
		
		$("#roomMake_Canvas_Body").append("<div id='Img_lengthText2' class='Img_lengthText'><input class='lenthinput' type='text' id='Img_lengthText1Val2' readonly>MM<div>");
		$("#Img_lengthText2").css("position","absolute").css("top",roomMake_canvas_img_Y_arr[select_img_num]+(roomMake_canvas_img_height_arr[select_img_num]/2)+300).css("left", roomMake_canvas_img_X_arr[select_img_num]+roomMake_canvas_img_width_arr[select_img_num]+550);
		$("#Img_lengthText1Val2").val(roomMake_canvas_img_height_arr[select_img_num]*10);
    }
	function TextPoition(){
		if(figure_num==1){
			$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1' readonly>MM<div>");
			$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+280).css("left", (figure_X[1]+figure_X[0])/2+500);
			$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2' readonly>MM<div>");
			$("#lengthText2").css("position","absolute").css("top",(figure_Y[2]+figure_Y[1])/2+280).css("left", figure_X[1]+500);
			$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
    	}
    	else if(figure_num==2){
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1'readonly>MM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+280).css("left", (figure_X[0]+figure_X[1])/2+500);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2'readonly>MM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2+280).css("left", figure_X[1]+500);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val3'readonly>MM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+50+280).css("left", (figure_X[2]+figure_X[3])/2+500);
    		$("#lengthText1Val3").val((figure_X[2]-figure_X[3])*10);
    		
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val4'readonly>MM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2+350).css("left", figure_X[3]+280);
			$("#lengthText1Val4").val((figure_Y[3]-figure_Y[4])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val5'readonly>MM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+50+280).css("left", (figure_X[4]+figure_X[5])/2+380);
			$("#lengthText1Val5").val((figure_X[4]-figure_X[5])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val6'readonly>MM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2+280).css("left", figure_X[5]+280);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
    	}
    	else if(figure_num==3){
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1'readonly>MM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+280).css("left", (figure_X[0]+figure_X[1])/2+500);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
			
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2'readonly>MM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2+280).css("left", figure_X[1]+500);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
			
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val3'readonly>MM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+280).css("left", (figure_X[2]+figure_X[3])/2+500);
    		$("#lengthText1Val3").val((figure_X[3]-figure_X[2])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val4'readonly>MM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2+300).css("left", figure_X[3]+500);
			$("#lengthText1Val4").val((figure_Y[4]-figure_Y[3])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val5'readonly>MM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+50+280).css("left", (figure_X[4]+figure_X[5])/2+380);
			$("#lengthText1Val5").val((figure_X[4]-figure_X[5])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val6'readonly>MM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2+280).css("left", figure_X[5]+280);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
    	}
		else if(figure_num==4){
			$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1'readonly>MM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+280).css("left", (figure_X[0]+figure_X[1])/2+500);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2'readonly>MM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2+300).css("left", figure_X[1]+500);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val3'readonly>MM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+330).css("left", (figure_X[2]+figure_X[3])/2+500);
    		$("#lengthText1Val3").val((figure_X[2]-figure_X[3])*10);
    		
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val4'readonly>MM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2+300).css("left", figure_X[3]+500);
			$("#lengthText1Val4").val((figure_Y[4]-figure_Y[3])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val5'readonly>MM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+330).css("left", (figure_X[4]+figure_X[5])/2+500);
			$("#lengthText1Val5").val((figure_X[4]-figure_X[5])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val6'readonly>MM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2+280).css("left", figure_X[5]+280);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
		}
		else if(figure_num==5){
			$("#roomMake_Canvas_Body").append("<div id='lengthText1' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val1'readonly>MM<div>");
    		$("#lengthText1").css("position","absolute").css("top",figure_Y[0]+280).css("left", (figure_X[0]+figure_X[1])/2+500);
    		$("#lengthText1Val1").val((figure_X[1]-figure_X[0])*10);
    		
    		$("#roomMake_Canvas_Body").append("<div id='lengthText2' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val2'readonly>MM<div>");
    		$("#lengthText2").css("position","absolute").css("top",(figure_Y[1]+figure_Y[2])/2+300).css("left", figure_X[1]+500);
    		$("#lengthText1Val2").val((figure_Y[2]-figure_Y[1])*10);
			
    		$("#roomMake_Canvas_Body").append("<div id='lengthText3' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val3'readonly>MM<div>");
    		$("#lengthText3").css("position","absolute").css("top",figure_Y[2]+330).css("left", (figure_X[2]+figure_X[3])/2+500);
    		$("#lengthText1Val3").val((figure_X[2]-figure_X[3])*10);
    		
			$("#roomMake_Canvas_Body").append("<div id='lengthText4' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val4'readonly>MM<div>");
			$("#lengthText4").css("position","absolute").css("top",(figure_Y[3]+figure_Y[4])/2+300).css("left", figure_X[3]+280);
			$("#lengthText1Val4").val((figure_Y[3]-figure_Y[4])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText5' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val5'readonly>MM<div>");
			$("#lengthText5").css("position","absolute").css("top",figure_Y[4]+280).css("left", (figure_X[4]+figure_X[5])/2+450);
			$("#lengthText1Val5").val((figure_X[5]-figure_X[4])*10);
			
			$("#roomMake_Canvas_Body").append("<div id='lengthText6' class='lengthText'><input class='lenthinput' type='text' id='lengthText1Val6'readonly>MM<div>");
			$("#lengthText6").css("position","absolute").css("top",(figure_Y[5]+figure_Y[0])/2+280).css("left", figure_X[5]+280);
			$("#lengthText1Val6").val((figure_Y[5]-figure_Y[0])*10);
			
		}
	}
	
});
	
</script>
</head>
<body>
<div id="roomMake_Canvas_Body" class="w3-container">
	
	<canvas id="myCanvas" width="1030" height="800" />

	<div>
		<table class="w3-container">
			<tr>
		    	<td class="roomMake_selectColorName_css"><b>벽지 색</b></td>
		  	</tr>
		  	<tr>
		    	<td class="roomMake_selectColor_css">
					<div id="roomMake_Canvas_Menu_WallPaper_Color_ChekboxArea">
						<table>
							<tr>
								<td><div class="WallPaper_Color" value="#ffddd6" style="background: #ffddd6; height: 50px; width: 50px" ></div></td>
								<td><div class="WallPaper_Color" value="#fce4c7" style="background: #fce4c7; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#fffdcc" style="background: #fffdcc; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#d8ffda" style="background: #d8ffda; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#d8fff3" style="background: #d8fff3; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#c1e8ff" style="background: #c1e8ff; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#c1c1ff" style="background: #c1c1ff; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#f1ceff" style="background: #f1ceff; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#ffc1e5" style="background: #ffc1e5; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#fafafa" style="background: #fafafa; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#d9d9d9" style="background: #d9d9d9; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#686868" style="background: #686868; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#222222" style="background: #222222; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#d8b572" style="background: #d8b572; height: 50px; width: 50px"></div></td>
								<td><div class="WallPaper_Color" value="#a55d00" style="background: #a55d00; height: 50px; width: 50px"></div></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		  	<tr>
		    	<td class="roomMake_selectColorName_css"><b>바닥 색</b></td>
		  	</tr>
		  	<tr>
		    	<td class="roomMake_selectColor_css">
					<div id="roomMake_Canvas_Menu_Linoleum_Color_ChekboxArea">
						<table>
							<tr>
								<td><div class="Linoleum_Color" value="#ffddd6" style="background: #ffddd6; height: 50px; width: 50px" ></div></td>
								<td><div class="Linoleum_Color" value="#fce4c7" style="background: #fce4c7; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#fffdcc" style="background: #fffdcc; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#d8ffda" style="background: #d8ffda; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#d8fff3" style="background: #d8fff3; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#c1e8ff" style="background: #c1e8ff; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#c1c1ff" style="background: #c1c1ff; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#f1ceff" style="background: #f1ceff; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#ffc1e5" style="background: #ffc1e5; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#fafafa" style="background: #fafafa; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#d9d9d9" style="background: #d9d9d9; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#686868" style="background: #686868; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#222222" style="background: #222222; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#d8b572" style="background: #d8b572; height: 50px; width: 50px"></div></td>
								<td><div class="Linoleum_Color" value="#a55d00" style="background: #a55d00; height: 50px; width: 50px"></div></td>
							</tr>
						</table>
					</div>
				</td>
		  </tr>

		  <tr>
		    <td class="roomMake_selectColor_css">
		    <button class="w3-button w3-green" id="roomMake_Canvas_Menu_Window_One_js">창문 추가</button>
		    <button class="w3-button w3-green" id="roomMake_Canvas_Menu_Door_One_js">문 추가</button>
		    </td>
		  </tr>
		</table>
		
		
	</div>
</div>

</body>
</html>