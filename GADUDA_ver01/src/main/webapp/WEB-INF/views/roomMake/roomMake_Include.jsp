<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
    height: 100px;
    border: 1px solid blue;
}
.content {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
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

//벽시 생상 설정
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
	$(".roomMak_Progress_state1").css("background","pink");
	$(".roomMak_Progress_state2").css("background","yellow");
	$(".roomMak_Progress_state3").css("background","yellow");
	aaa();
	
	function aaa(){
		$.ajax({      
			url : "roomMake_Select_Figure",
	 		success:function(data){
	 			$("#roomMake_Progress_Position").html(data);
	 		}
	    }); 
		$.ajax({      
			url : "roomMake_Progress_Button1",
	 		success:function(data){
	 			$("#roomMake_Progress_Button_Position").html(data);
	 		}
	    });
	}
});


</script>
</head>
<body>
	
	<div class="roomMak_Progress_state_css"> 
	
		<div class="roomMak_Progress_state1 roomMak_Progress_state_Ing" >
			<p class="content">방 모야 선택</p>
		</div>
		
		<div class=" roomMak_Progress_state_Ing">
			<p class="content">--></p>
		</div>
		
		<div class="roomMak_Progress_state2 roomMak_Progress_state_Ing">
			<p class="content">방 구조 생성</p>
		</div > 
		
		<div class=" roomMak_Progress_state_Ing">
			<p class="content">--></p>
		</div>
		
		<div class="roomMak_Progress_state3 roomMak_Progress_state_Ing">
			<p class="content">제목 정하기</p>
		</div> 
	</div>
	</br>
	
	<div id="roomMake_Progress_Position"></div>
	</br>
	
	<div id="roomMake_Progress_Button_Position"></div>

</body>
</html>