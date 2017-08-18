<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#myCanvas_div{
	border:1px solid;
	float:left;
	width:850;
	height:800;
	margin-right:5px;
}
#designroom_menu{
	border:1px solid;
	float:left;
	width:291;
	height:800;
}

.fig_coommend_Text{
	background:white;
	OVERFLOW-Y:auto;
	width:400;
	height:500;
	border: 5px solid black;
}
.fig_commend_lsit{
	margin-right: 0px;
	height:100;
	border: 1px solid black;
}
.fig_commend_img{
	float: left;
	width:100;
	height:100;
	border: 1px solid black;
}
.fig_commend_img_pic{
	width:100;
	height:100;
}
.fig_commend_content{
    float: left;
	width:250;
	height:100;
}
.fig_commend_name{
	margin-right: 0px;
	height:33;
}
.fig_commend_length{
	margin-right: 0px;
	height:33;
}

#designRoom_menu1{
	border: 1px solid;
	width:291px; 
	height:800px;
	display:block;
	
}
.designRoom_menu_css{
	margin-top:15px;
}

.designRoom_menu_text{
	display:table-cell; 
	text-align:center; 
	vertical-align:middle;
	font-size:20px;
}
.designRoom_menu_furniture{
	border: 1px solid;
	float:left;
	margin-left:10px;
	display:table;
}

#designRoom_menu_1{
	width:100%;
	height:8%;
}
#designRoom_menu_sofa{
	width:25%;
	height:100%
}
#designRoom_menu_dressing_table{
	width:60%;
	height:100%
}

#designRoom_menu_2{
	width:100%;
	height:10%;
}
#designRoom_menu_bookcase{
	width:28%;
	height:100%
}
#designRoom_menu_chair{
	width:28%;
	height:100%
}
#designRoom_menu_drawer{
	width:28%;
	height:100%
}


#designRoom_menu_3{
	width:100%;
	height:15%;
}
#designRoom_menu_desk_workstation{
	width:91%;
	height:100%
}

#designRoom_menu_4{
	width:100%;
	height:12%;
}

#designRoom_menu_table{
	width:60%;
	height:100%
}

#designRoom_menu_wardrobe{
	width:25%;
	height:100%
}

#designRoom_menu_5{
	width:100%;
	height:15%;
	
}

#designRoom_menu_support{
	width:80%;
	height:100%;
	margin-left:22px;
}
 
#designRoom_menu_6{
	width:100%;
	height:10%;
	
}

#designRoom_menu_display_cupboard{
	width:42%;
	height:100%;
}
#designRoom_menu_storage_closet{
	width:43%;
	height:100%;
}

#designRoom_menu_7{
	width:100%;
	height:15%;
}
#designRoom_menu_bed{
	width:92%;
	height:100%;
}

#designRoom_menu2{
	background:white;
	OVERFLOW-Y:auto;
	border: 1px solid;
	width:291px; 
	height:800px;
	display:none;
}
#designRoom_menu2_back{
	border: 1px solid;
	width:100%; 
	height:30;
}
.designRoom_menu2_content{
	margin-top:20px;
	border: 1px solid;
	width:100%; 
	height:120;
}
.designRoom_menu2_content_img{
	border: 1px solid;
	float:left;
	width:36%; 
	height:100%;
}
.designRoom_menu2_content_data{
	border: 1px solid;
	float:left;
	width:62%; 
	height:100%;
}
.designRoom_menu2_content_pic{
	width:100%; 
	height:100%;
}
.designRoom_menu2_content_data_name{
	border:1px solid;
	width:100%; 
	height:28%;
}
.designRoom_menu2_content_data_size{
	border: 1px solid;
	width:100%; 
	height:38%;
}
.designRoom_menu2_content_data_button{
	border: 1px solid;
	width:100%; 
	height:30%;
}
#deta_lengthText1{
	border:2px solid;	
	width:500;
	height:800;
	background-color: ivory;

}

#deta_lengthText1_close{
	border:2px solid;
	width:100%;
	height:5%;
}

#deta_lengthText1_content1{
	border:2px solid;
	width:100%;
	height:30%;

}
#deta_lengthText1_text1{
 	overflow-y:scroll;
	border:2px solid;
	width:100%;
	height:65%;
}


#deta_lengthText1_content_img{
	border: 1px solid;
	width:40%;
	height:100%;
	float:left;
}
#deta_lengthText1_content_img_src{
	width:100%;
	height:100%;
}
#deta_lengthText1_content_data{
	border: 1px solid;
	width:58%;
	height:100%;
	float:left;
}
#deta_lengthText1_content_data_name{
	border: 1px solid;
	width:100%;
	height:30%;
}
#deta_lengthText1_content_data_size{
	border: 1px solid;
	width:100%;
	height:30%;
}
#deta_lengthText1_content_data_pay{
	border: 1px solid;
	width:100%;
	height:30%;
}
#deta_lengthText1_text1_text{
	border: 1px solid;
	width:100%;
}
.deta_lengthText1_text1_img{
	margin-top:30px;
	width:100%;
	height:300;
	
}
.deta_lengthText1_text1_img_src{
	width:100%;
	height:100%;
}




</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var furniture_kind= ''
	
	var canvas = document.getElementById("myCanvas");
	var context = canvas.getContext("2d");
	
	var canvasOffset=$("#design_Include_body").offset();
	var offsetX=canvasOffset.left;
	var offsetY=canvasOffset.top;
	
	var roomMake_canvas_Ximg =  new Image();
	roomMake_canvas_Ximg.src = "https://static4.depositphotos.com/1001003/355/i/450/depositphotos_3552603-stock-photo-3d-rejected-or-rated-x.jpg";
	
	var roomMake_canvas_Recommend_img =  new Image();
	roomMake_canvas_Recommend_img.src = "http://cfile23.uf.tistory.com/image/27494B4E51BA8D6B089339";
	
	var roomMake_canvas_Turnimg =  new Image();
	roomMake_canvas_Turnimg.src = "https://st2.depositphotos.com/4441075/12231/v/950/depositphotos_122316444-stock-illustration-rotation-arrow-in-a-circle.jpg";
	
	var fig_img_X =20;
	var fig_img_Y =20;
	
	var fig_width_length =200;
	var fig_height_length =200;
	
	var moveImg = false;
	var moveDiv = false;
	
	
	var fig_arr_length=0;
	
	var select_fig_num='';
	
	var x_img_X='';
	var x_img_Y='';
	
	var roomMake_canvas_TurnImg_X = '';
	var roomMake_canvas_TurnImg_Y='';
	
	var deta_textPosition_num='';
	
	var move_deta_textPosition_X=130;
	var move_deta_textPosition_Y=1500;
	

	
	var roomMake_canvas_window_one_img  = new Image();
	roomMake_canvas_window_one_img.src = select_myroom;
	
	designRoom_furniture_data();
	
	
	
	//모든 가구의 데이터를  다 가져오기
	function designRoom_furniture_data(){
		$.ajax({
			url: "${URLs.URI_DESIGNROOM_CANVAS_FURNITURE_DATA_FULL}",
			type:"POST",
			contentType:'allplication/json',
			success:function(data){
				
				furniture_data=data.furniture;
				furniture_pic=data.furniture_pic;
				furniture_basic_img=data.furniture_basic_img;
				
			}
		});
	}
	   
	roomMake_canvas_window_one_img.onload = function(){ 
		RectDraw();
		drawRoom();
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
	
	//그림 선택시 'x' 이미지 그리기
	//엑스 그리기
	function drawXImg(){
		x_img_X=fig_img_X_arr[select_fig_num]+fig_img_width_length_arr[select_fig_num];
		x_img_Y=fig_img_Y_arr[select_fig_num];
		
		context.drawImage(roomMake_canvas_Ximg, 0, 0, 
				roomMake_canvas_Ximg.width, roomMake_canvas_Ximg.height, 
				x_img_X,x_img_Y, 
				30,30);
	}
	//그림 선택시 '턴' 이미지 그리기
	//턴이미지 그리기
	function drawTrunImg(){
		
		roomMake_canvas_TurnImg_X = fig_img_X_arr[select_fig_num]+(fig_img_width_length_arr[select_fig_num]/2-(40/2));
		roomMake_canvas_TurnImg_Y = fig_img_Y_arr[select_fig_num]+fig_img_height_length_arr[select_fig_num]+20;
		
		context.drawImage(roomMake_canvas_Turnimg, 0, 0, 
				roomMake_canvas_Turnimg.width, roomMake_canvas_Turnimg.height, 
				roomMake_canvas_TurnImg_X, roomMake_canvas_TurnImg_Y, 
				40,40);
	}
	
	//배치도의 마우스 핸들거
	$("#myCanvas").mousedown(function(e) {handleMouseDown(e);});
	$("#myCanvas").mousemove(function(e){handleMouseMove(e);});
	$("#myCanvas").mouseup(function(e){handleMouseUp(e);});
    $("#myCanvas").mouseout(function(e){handleMouseOut(e);});
    
    
    //마수스 다음
	function handleMouseDown(e) {
    	//가구의 가로 세로 길이를 text삭제
    	
		$(".Img_lengthText").remove();
    	startX = parseInt(e.clientX-offsetX);
	    startY = parseInt(e.clientY-offsetY);

	    var hit_num=hitImg(startX, startY); 
	    if(hit_num==1){
	    	drawXImg();
			drawTrunImg();
			Img_TextPosition();
	    	moveImg=true;
	    }
	    else if(hit_num==2){
	    	
	    	del_fig_img();
	    	RectDraw();
	    	drawRoom();
	    	drawFigImg();
	    	
	    }else if(hit_num==3){
	    	
	    	turn_Img();
	    	RectDraw();
			drawRoom();
			drawFigImg();
			drawXImg();
			drawTrunImg();
	    }
	}
    
	function hitImg(x, y) {
		
		for(var i=0; i<fig_arr_length; i++){
			if( fig_img_X_arr[i]<x && x<fig_img_X_arr[i]+fig_img_width_length_arr[i] 
					&& fig_img_Y_arr[i]<y&& y<fig_img_Y_arr[i]+fig_img_height_length_arr[i]){
				select_fig_num=i;
				return 1;
			}
		}
		if( x_img_X<x &&x<x_img_X+30 && x_img_Y<y && y<x_img_Y+30 ){
			return 2;
		}
		if(roomMake_canvas_TurnImg_X<x && x<roomMake_canvas_TurnImg_X+40 && roomMake_canvas_TurnImg_Y<y && y<roomMake_canvas_TurnImg_Y+40){
			return 3;
		}
		$(".Img_lengthText").remove();
		
		x_img_X='';
		x_img_Y='';
		roomMake_canvas_TurnImg_X ='';
		roomMake_canvas_TurnImg_Y =''
		
		RectDraw();
    	drawRoom();
    	drawFigImg();
	}
	//그림 선택시 
	//'x'이밎 선택시 
	//가구 베치도 삭제하기
	function del_fig_img(){
		fig_img_X_arr.splice(select_fig_num, 1);
		fig_img_Y_arr.splice(select_fig_num, 1);
		fig_img_width_length_arr.splice(select_fig_num, 1);
		fig_img_height_length_arr.splice(select_fig_num, 1);
		fig_img_state_arr.splice(select_fig_num, 1);
		fig_arr_length--;
	}
    
    
	//그림 선택시 
	//'turn'이 선택시 
	//가구 베치도 회전하기
	function turn_Img(){
		var turn_img= new Image();		
		var temp='';
		
		
		for(var i=0; i<furniture_data.furniture.length; i++){
			
			if(fig_img_kind[select_fig_num]==furniture_data.furniture[i].furniture_num){
				
				if(fig_img_state_arr[select_fig_num]==1){
					
					turn_img.src=furniture_data.furniture[i].furniture_arrangement_plan_img_src_2;
					
					fig_img_arr[select_fig_num]=turn_img;
					temp=fig_img_width_length_arr[select_fig_num];
					fig_img_width_length_arr[select_fig_num]=fig_img_height_length_arr[select_fig_num];
					fig_img_height_length_arr[select_fig_num]=temp;
					
					fig_img_state_arr[select_fig_num]=2;
					
				}else if(fig_img_state_arr[select_fig_num]==2){
					turn_img.src=furniture_data.furniture[i].furniture_arrangement_plan_img_src_3;
					fig_img_arr[select_fig_num]=turn_img;
					temp=fig_img_width_length_arr[select_fig_num];
					fig_img_width_length_arr[select_fig_num]=fig_img_height_length_arr[select_fig_num];
					fig_img_height_length_arr[select_fig_num]=temp;
					fig_img_state_arr[select_fig_num]=3;
					
				}else if(fig_img_state_arr[select_fig_num]==3){
					turn_img.src=furniture_data.furniture[i].furniture_arrangement_plan_img_src_4;
					fig_img_arr[select_fig_num]=turn_img;
					temp=fig_img_width_length_arr[select_fig_num];
					fig_img_width_length_arr[select_fig_num]=fig_img_height_length_arr[select_fig_num];
					fig_img_height_length_arr[select_fig_num]=temp;
					fig_img_state_arr[select_fig_num]=4;
					
				}else if(fig_img_state_arr[select_fig_num]==4){
					turn_img.src=furniture_data.furniture[i].furniture_arrangement_plan_img_src_1;
					fig_img_arr[select_fig_num]=turn_img;
					temp=fig_img_width_length_arr[select_fig_num];
					fig_img_width_length_arr[select_fig_num]=fig_img_height_length_arr[select_fig_num];
					fig_img_height_length_arr[select_fig_num]=temp;
					fig_img_state_arr[select_fig_num]=1;
					
				}
			}
		}
		
	}
	
	function handleMouseMove(e){  
		
		var mouseX=parseInt(e.clientX-offsetX);
        var mouseY=parseInt(e.clientY-offsetY);
		if(moveImg){
			
			$(".Img_lengthText").remove();
			
			fig_img_X_arr[select_fig_num]=mouseX;
			fig_img_Y_arr[select_fig_num]=mouseY;
			
			Img_TextPosition();
			RectDraw();
			drawRoom();
			drawFigImg();
			drawXImg();
			drawTrunImg();
		}
    }
	function handleMouseUp(e){
		moveImg=false;
	}
	function handleMouseOut(e){
	      handleMouseUp(e);
	}
	
	//가구 선택 메뉴
	$(".designRoom_menu_furniture").click(function(){
		furniture_kind=$(this).attr('value2');
		$("#designRoom_menu1").css("display","none");
		$("#designRoom_menu2").css("display","block");
		designRoom_menu2_content();
	});
	
	//가기고 있는 가구 메뉴 만들어주기
	function designRoom_menu2_content(){
		var designRoom_menu2_content_append='';
		designRoom_menu2_content_append+="<div id='designRoom_menu2_back'>뒤돌아가기</div>";
		
		
		
		for(var i=0; i<furniture_data.length;i++){
			var fur_pic_kind = '';
			if(furniture_data[i].fur_kind_def_name==furniture_kind){
				for(var j=0; j<furniture_pic.length;j++){
					
					if(furniture_data[i].fur_no==furniture_pic[j].fur_no){
						
						if(furniture_pic[j].fur_pic_kind=='앞'){
							fur_pic_kind = furniture_pic[j].fur_pic_loc;
						}
					}
				}
				
				designRoom_menu2_content_append+="<div class='designRoom_menu2_content'>";
				
						designRoom_menu2_content_append+="<div class='designRoom_menu2_content_img'>";
							designRoom_menu2_content_append+="<img  class='designRoom_menu2_content_pic' src='"+fur_pic_kind+"'>";
						designRoom_menu2_content_append+="</div>";					
				
					designRoom_menu2_content_append+="<div class='designRoom_menu2_content_data'>";
				
						designRoom_menu2_content_append+="<div class='designRoom_menu2_content_data_name'>"+furniture_data[i].fur_name+"/"+furniture_data[i].fur_brand_name+"</div>";
						designRoom_menu2_content_append+="<div class='designRoom_menu2_content_data_size'>W:"+furniture_data[i].fur_width+"CM V:"+furniture_data[i].fur_depth+"CM H:"+furniture_data[i].fur_height+"CM W:"+furniture_data[i].fur_weight+"kg</div>";
				
						designRoom_menu2_content_append+="<div class='designRoom_menu2_content_data_button'>";
							designRoom_menu2_content_append+="<button class='designRoom_menu2_content_data_button_img' num='"+furniture_data[i].fur_no+"'>배치도추가</button>";
							designRoom_menu2_content_append+="<button class='designRoom_menu2_content_data_button_dita' num='"+furniture_data[i].fur_no+"'>상세보기</button>";
						designRoom_menu2_content_append+="</div>";
					designRoom_menu2_content_append+="</div>";
			}
		}
		
		$('#designRoom_menu2').append(designRoom_menu2_content_append);
	}
	//뒤돌아가기 누르기
	$(document).on('click','#designRoom_menu2_back',function(e){
		$('#designRoom_menu2').html('');
		$("#designRoom_menu2").css("display","none");
		$("#designRoom_menu1").css("display","block");
	});
	
	//배치 버튼 번호 클릭
	$(document).on('click', '.designRoom_menu2_content_data_button_img', function(e) {
		for( var i =0; i<furniture_basic_img.length; i++){
			if($(this).attr('num')==furniture_basic_img[i].fur_no){
				if(furniture_basic_img[i].fur_arr_basic_img_kind=='상단'){
					draw_fig_data(i);
				}
			}
		}
		drawFigImg();
	});
	
	//베치 이미지 데이터 입력하기
	function draw_fig_data(num){
		
		var fig_img = new Image();
		fig_img.src = furniture_basic_img[num].fur_arr_basic_img_loc;
		fig_num_arr[fig_arr_length]=furniture_basic_img[num].fur_no;
		fig_img_arr[fig_arr_length]=fig_img;
		
		fig_img_X_arr[fig_arr_length]=fig_img_X;
		fig_img_Y_arr[fig_arr_length]=fig_img_Y;
		
		
		for(var i=0; i<furniture_data.length;i++){
			if(furniture_basic_img[num].fur_no==furniture_data[i].fur_no){
				fig_img_width_length_arr[fig_arr_length]=furniture_data[i].fur_width/10;
				fig_img_height_length_arr[fig_arr_length]=furniture_data[i].fur_depth/10;
			}
		}
		fig_img_state_arr[fig_arr_length]='상단';
		
		fig_arr_length++;
		
	}
	
	//디테일 버튼 누르기	
	$(document).on('click', '.designRoom_menu2_content_data_button_dita', function(e) {
		move_deta_textPosition_X=1500;
		move_deta_textPosition_Y=130;
		
		for(var i=0; i<furniture_data.length;i++){
			if($(this).attr('num')==furniture_data[i].fur_no){
				deta_textPosition_num=i
			}
		}
		deta_textPosition();
		move_deta_textPosition();
	});
	
	
	function Img_TextPosition(){
		
    	$("#myCanvas_div").append("<div id='Img_lengthText1' class='Img_lengthText'><input type='text' id='Img_lengthText1Val1' readonly>CM<div>");
		$("#Img_lengthText1").css("position","absolute").css("top",fig_img_Y_arr[select_fig_num]+80).css("left",fig_img_X_arr[select_fig_num]+(fig_img_width_length_arr[select_fig_num]/2));
		$("#Img_lengthText1Val1").val(fig_img_width_length_arr[select_fig_num]*10);
		
		$("#myCanvas_div").append("<div id='Img_lengthText2' class='Img_lengthText'><input type='text' id='Img_lengthText1Val2' readonly>CM<div>");
		$("#Img_lengthText2").css("position","absolute").css("top",fig_img_Y_arr[select_fig_num]+(fig_img_height_length_arr[select_fig_num]/2)+130).css("left", fig_img_X_arr[select_fig_num]+fig_img_width_length_arr[select_fig_num]+50);
		$("#Img_lengthText1Val2").val(fig_img_height_length_arr[select_fig_num]*10);
    }
	
	
	
	
	function deta_textPosition(){
		
		var deta_pic_front='';
		var deta_pic=[];
		var deta_num=0;
		
		for(var i=0;i<furniture_pic.length;i++){
			
			if(furniture_data[deta_textPosition_num].fur_no==furniture_pic[i].fur_no){
				if(furniture_pic[i].fur_pic_kind=='앞'){
					deta_pic_front= furniture_pic[i].fur_pic_loc;
				}else{
					deta_pic[deta_num]=furniture_pic[i].fur_pic_loc;
					deta_num++;
				}
			}
		}
		
		var deta_textPosition_append='';
		deta_textPosition_append+="<div id='deta_lengthText1'>";
		
		deta_textPosition_append+="<div id='deta_lengthText1_close'>닫기</div>";
		deta_textPosition_append+="<div id='deta_lengthText1_content1'>";
			
			deta_textPosition_append+="<div id='deta_lengthText1_content_img'>";
				deta_textPosition_append+="<img id='deta_lengthText1_content_img_src' src='"+deta_pic_front+"'>";
			deta_textPosition_append+="</div>";
			deta_textPosition_append+="<div id='deta_lengthText1_content_data'>";
				deta_textPosition_append+="<div id='deta_lengthText1_content_data_name'>"+furniture_data[deta_textPosition_num].fur_name+"/"+furniture_data[deta_textPosition_num].fur_brand_name+"</div>";
				deta_textPosition_append+="<div id='deta_lengthText1_content_data_size'>W:"+furniture_data[deta_textPosition_num].fur_width+"CM V:"+furniture_data[deta_textPosition_num].fur_depth+"CM H:"+furniture_data[deta_textPosition_num].fur_height+"CM W:"+furniture_data[deta_textPosition_num].fur_weight+"kg</div>";
				deta_textPosition_append+="<div id='deta_lengthText1_content_data_pay'>가격:"+furniture_data[deta_textPosition_num].fur_price+"원</div>";
			deta_textPosition_append+="</div>";
		deta_textPosition_append+="</div>";
			
		deta_textPosition_append+="<div id='deta_lengthText1_text1'>";
			deta_textPosition_append+="<div id='deta_lengthText1_text1_text'>"+furniture_data[deta_textPosition_num].fur_info+"</div>";
			
			deta_textPosition_append+="<div class='deta_lengthText1_text1_img'>";
				deta_textPosition_append+="<img class='deta_lengthText1_text1_img_src' src='"+deta_pic_front+"'>";
			deta_textPosition_append+="</div>";
			
			
			for(var i=0; i<deta_pic.length; i++){
				deta_textPosition_append+="<div class='deta_lengthText1_text1_img'>";
					deta_textPosition_append+="<img class='deta_lengthText1_text1_img_src' src='"+deta_pic[i]+"'>";
				deta_textPosition_append+="</div>";
			}
			
		deta_textPosition_append+="</div>";
			
		deta_textPosition_append+="</div>";
		$('body').append(deta_textPosition_append);
		
	}
	function move_deta_textPosition(){
		$("#deta_lengthText1").css("position","absolute").css("top",move_deta_textPosition_Y).css("left",move_deta_textPosition_X);
	}
	$(document).on('click','#deta_lengthText1_close',function(e){
		$("#deta_lengthText1").remove();
	});
	
	
	//상세정보의 바우스 핸들거
    $("body").mousedown(function(e) {bodyMouseDown(e);});
    $("body").mousemove(function(e) {bodyMouseMove(e);});
    $("body").mouseup(function(e) {bodymouseup(e);});
    
    
    function bodyMouseDown(e){
    	
    	
    	var startX = parseInt(e.clientX);
	    var startY = parseInt(e.clientY);
	    
	    moveDiv=hit_deta_textPosition(startX,startY);
	   
    }
    function hit_deta_textPosition(startX,startY){
    	if( move_deta_textPosition_X<startX && startX <move_deta_textPosition_X+500 && move_deta_textPosition_Y<startY && startY<move_deta_textPosition_Y+800){
			return true;
		}    	
    	$("#deta_lengthText1").remove();
    	return false;
    }
    
    function bodyMouseMove(e){
    	var startX = parseInt(e.clientX);
	    var startY = parseInt(e.clientY);
	    if(moveDiv){
	    	move_deta_textPosition_X=startX;
	    	move_deta_textPosition_Y=startY;
	    	move_deta_textPosition();
	    }
    }
    function bodymouseup(e){
    	moveDiv=false;
    }
	
	
	
});



</script>
</head>
<body>
<div id="myCanvas_div">
	<canvas id="myCanvas" width="850" height="800" />
</div>
<div id="designroom_menu">
	<div id="designRoom_menu1">
		<div id="designRoom_menu_1" class="designRoom_menu_css">
			<div id="designRoom_menu_sofa" class="designRoom_menu_furniture" value="sofa" value2="소파"><p class="designRoom_menu_text">#소파</p></div> 
			<div id="designRoom_menu_dressing_table" class="designRoom_menu_furniture" value="dressing_table" value2="화장재"><p class="designRoom_menu_text">#화장대</p></div>
		</div>
		
		<div id="designRoom_menu_2" class="designRoom_menu_css">
			<div id="designRoom_menu_bookcase" class="designRoom_menu_furniture" value="bookcase" value2="책장"><p class="designRoom_menu_text">#책장</p></div> 
			<div id="designRoom_menu_chair" class="designRoom_menu_furniture" value="chair" value2="의자"><p class="designRoom_menu_text">#의자 </p></div>
			<div id="designRoom_menu_drawer" class="designRoom_menu_furniture" value="drawer" value2="서랍"><p class="designRoom_menu_text">#서랍</p></div>
		</div>
		
		<div id="designRoom_menu_3" class="designRoom_menu_css">
			<div id="designRoom_menu_desk_workstation" class="designRoom_menu_furniture" value="desk_workstation" value2="책상"><p class="designRoom_menu_text">#책생#워크스테이션</p></div> 
		</div>
		
		<div id="designRoom_menu_4" class="designRoom_menu_css">
			<div id="designRoom_menu_table" class="designRoom_menu_furniture" value="table" value2="데이블"><p class="designRoom_menu_text">#데이블</p></div> 
			<div id="designRoom_menu_wardrobe" class="designRoom_menu_furniture" value="wardrobe" value2="옷장"><p class="designRoom_menu_text">#옷장</p></div> 
		</div>
		
		<div id="designRoom_menu_5" class="designRoom_menu_css">
			<div id="designRoom_menu_support" class="designRoom_menu_furniture" value="support" value2="받침대 장식"><p class="designRoom_menu_text">#받침대#장식</p></div> 
		</div>
		
		<div id="designRoom_menu_6" class="designRoom_menu_css">
			<div id="designRoom_menu_display_cupboard" class="designRoom_menu_furniture" value2="display_supboard" value2="장식장"><p class="designRoom_menu_text">#장식장</p></div>
			<div id="designRoom_menu_storage_closet" class="designRoom_menu_furniture" value2="storage_closet" value2="수납장"><p class="designRoom_menu_text">#수납장</p></div> 
		</div>
		
		<div id="designRoom_menu_7" class="designRoom_menu_css">
			<div id="designRoom_menu_bed" class="designRoom_menu_furniture" value="bed" value2="침대"><p class="designRoom_menu_text">#침대</p></div>
		</div>
	</div>
	
	<div id="designRoom_menu2">
	</div>
</div>
</body>
</html>