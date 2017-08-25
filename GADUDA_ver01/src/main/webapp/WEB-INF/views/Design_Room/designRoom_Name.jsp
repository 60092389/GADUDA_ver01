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
	margin-right:10px;
}
#designroom_name{
	border:1px solid;
	float:left;
	width:291;
	height:800;
}
.designroom_name_value{
	border:1px solid;
	width:100%;
	height:200;
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
    text-align: center;
}


#myProgress {
  width: 100%;
  background-color: #ddd;
}
.designRoom_kind_class{
display:inline-table;
}
.designRoom_concept_class{
display:inline-table;
}
 .p {display:table-cell; text-align:center; vertical-align:middle;}


</style>
<script src="/resources/script/html2canvas.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
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
			for(var i=0; i<fig_img_arr.length;i++){
				context.drawImage(fig_img_arr[i], 0, 0, 
						fig_img_arr[i].width, fig_img_arr[i].height, 
						fig_img_X_arr[i],fig_img_Y_arr[i],
						fig_img_width_length_arr[i],fig_img_height_length_arr[i]);
			}
		}
		$(".designRoom_kind_class").click(function(){
			$('.designRoom_kind_class').css("border","1px solid");
			designRoom_kind= $(this).attr("value");
			$(this).css("border","5px solid red");
		})
		$(".designRoom_concept_class").click(function(){
			$('.designRoom_concept_class').css("border","1px solid");
			designRoom_concept= $(this).attr("value");
			$(this).css("border","5px solid red");
		})
		
		
		$("#designRoom_next3").click(function(){
			designRoom_name=$("#designroom_name_text_value").val();
			designroom_tag_value=$("#designroom_name_tag_value").val();
			designroom_info_value=$("#designroom_name_info_value").val();
			
			if(designRoom_name == ''){
				alert("이름을 입력해주세요")
			}
			else if(designroom_tag_value == ''){
				alert("해시태그를 설정해주세요");
			}
			else if(designRoom_kind==''){
				alert("방종류를 입력하시오");		
			}
			else if(designRoom_concept == ''){
				alert("컨셉을 설정 해주세요");
			}
			else if(designroom_info_value == ''){
				alert("INFO를 입력해주새요");
			}
			else{
				html2canvas(
						$("#myCanvas_div"),
						{
							onrendered : function(canvas) {
								
								var designRoom_Img=canvas.toDataURL("image/png");
								var design_data = {"designRoom_concept":designRoom_concept,"select_myroom_num":select_myroom_num,'designroom_info':designroom_info_value,'designRoom_kind':designRoom_kind,'designroom_tag_value':designroom_tag_value,'designRoom_name':designRoom_name,"designRoom_Img":designRoom_Img,"fig_num":fig_num_arr,"fig_img_X":fig_img_X_arr,"fig_img_Y":fig_img_Y_arr,"fig_img_state":fig_img_state_arr};
								$.ajax({
									type : "POST",
									data:design_data,
									url : "${URLs.URI_DESIGNROOM_NAME_SAVE_FULL}",
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
<div id="myCanvas_div">
	<canvas id="myCanvas" width="1158" height="800" />
</div>
<div>
		<table class="w3-container">
			
			<tr>
		    	<td ><b>방이름 </b></td>
		  	</tr>
		  	<tr>
		    	<td><input class="w3-input" type="text" placeholder="방 이름을 입력하세요." id="designroom_name_text_value"></td>
		  	</tr>
		  	
		  	
		  	<tr>
		    	<td ><b>#태그를 설정해주세요 </b></td>
		  	</tr>
		  	<tr>
		    	<td><input class="w3-input" type="text" placeholder="(#xxx)로 입력해주세요" id="designroom_name_tag_value"></td>
		  	</tr>
		  	
			<tr>
		    	<td ><b>방 종류 선택</b></td>
		  	</tr>
		  	<tr>
		    	<td >
						<table>
							<tr>
								<td><div class='designRoom_kind_class' value="1" style="background: #ffddd6; height: 50px; width: 50px"><p class="p">침실</p></div></td>
								<td><div class='designRoom_kind_class' value="2" style="background: #fce4c7; height: 50px; width: 50px"><p class="p">거실</p></div></td>
								<td><div class='designRoom_kind_class' value="3" style="background: #fffdcc; height: 50px; width: 50px"><p class="p">홈오피스</p></div></td>
							</tr>
						</table>
				</td>
			</tr>
		  	
		  	<tr>
		    	<td ><b>방 컨샙 색</b></td>
		  	</tr>
		  	
		  	<tr>
		    	<td >
						<table>
							<tr>
								<td><div class='designRoom_concept_class' value="1" style="background: #ffddd6; height: 50px; width: 50px"><p class="p">내추럴</p></div></td>
								<td><div class='designRoom_concept_class' value="2" style="background: #fce4c7; height: 50px; width: 50px"><p class="p">모던</p></div></td>
								<td><div class='designRoom_concept_class' value="3" style="background: #fffdcc; height: 50px; width: 50px"><p class="p">심플</p></div></td>
							</tr>
						</table>
				</td>
		  </tr>
		  
		   	<tr>
		    	<td ><b>INFO</b></td>
		  	</tr>
		  	<tr>
		    	<td><input class="w3-input" type="text" placeholder="INFO를 입력해주세요" id="designroom_name_info_value"  style='height:200px;'></td>
		  	</tr>
		</table>
	</div>

</body>
</html>