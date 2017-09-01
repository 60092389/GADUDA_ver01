<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GADUDA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_commons.css">
<link rel="stylesheet" href="/resources/Css/Commons/gaduda_font.css">
<style type="text/css">


#design_Include_hadder{
	border: 1px solid; 
	width: 1158px; 
	height: 100px;
}
#design_Include_body{
	width: 1158px;
	height: 100% 
}
 
#design_Include_body1{
	float:left;
	border: 1px solid;
	width:1158px; 
	height:800px;
}

#design_Include_body2{
	display:inline-block;  
	margin-left:10px;  
	border: 1px solid;
	width:295px; 
	height:800px;
}

#design_Include_button{
    width: 100%; 
 	height:100%;
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

var furniture_kind= ''
var designRoom_kind='';		
var designroom_tag_value='';
var designRoom_name='';
var designroom_info_value='';
var designRoom_concept='';

var furniture_data='';
var furniture_basic_img='';
var furniture_scrap_no='';

var fig_img_arr=[];
var fig_num_arr=[];
var fig_img_X_arr=[];
var fig_img_Y_arr=[];
var fig_img_width_length_arr=[];
var fig_img_height_length_arr=[];
var fig_img_state_arr=[];
var select_myroom='';

var fig_arr_length=0;

var myroom ='';

var select_myroom='';
var select_myroom_num='';
var select_width='';
var select_height='';

$(document).ready(function(){
	$("#myBar").css("width","25%");
	$("#ing").append("25%");
	
	$.ajax({
		url:"${URLs.URI_DESIGNROOM_SELECT_FULL}",
		success:function(data){
			$("#design_Include_body").html(data);
		}
	});
	
	$.ajax({
		url:"${URLs.URI_DESIGNROOM_BUTTON1_FULL}",
		success:function(data){
			$("#design_Include_button").html(data);
		}
	});
});


</script>
</head>
<body>
<div class="w3-container">
	
	<div class="w3-container" id="myProgress">
  		<div id="myBar"><b id="ing"></b></div>
	</div>
	
	<br>
	<br>

	<div id="design_Include_body">

	</div>
	</br>

	<div id="design_Include_button"></div>
</div>
</body>
</html>