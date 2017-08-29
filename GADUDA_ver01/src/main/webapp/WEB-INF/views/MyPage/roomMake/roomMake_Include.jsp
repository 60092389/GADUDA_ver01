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

.roomMak_Progress_state_css{
	border: 1px solid; 
	width: 1030px; 
	height: 100px;
}
.roomMak_Progress_state_Ing{
    display:inline-table;
    float: center;
    width: 100px;
    height: 50px;
    border: 1px solid blue;
}
.content {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
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

var startX='';
var startY='';

var figure_X =[];
var figure_Y =[];

var figure_size=0;
var figure_num='';

var draggingImage = false;
var length_num='';

//벽지 생상 설정
var roomMake_canvas_linoleum_color =  "white";
//바닥 색상설정
var roomMake_canvas_wallPaper_color = "black";

//사진을 여러자 넣기 위해 사용한다
//배열의 크기
var roomMake_canvas_img_arr_size=0;
//사진 종류 번호
var roomMake_canvas_img_kind_num_arr=[];

var roomMake_canvas_img_kind_arr=[];

//사진 x좌표
var roomMake_canvas_img_X_arr=[];
//사진 y좌표
var roomMake_canvas_img_Y_arr=[];

var roomMake_canvas_img_height_arr=[];
var roomMake_canvas_img_width_arr=[];

var roomMake_canvas_img_state_arr=[];



$(document).ready(function() {
	$("#myBar").css("width","25%");
	$("#ing").append("25%");
	aaa();
	
	function aaa(){
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
	}
});


</script>
</head>
<body>
<div class="w3-container">

	<div class="w3-container" id="myProgress">
  		<div id="myBar"><b id="ing"></b></div>
	</div>
	</br>
	<div id="roomMake_Progress_Position"></div>
	<br>
	
	<div id="roomMake_Progress_Button_Position"></div>
</div>
</body>
</html>