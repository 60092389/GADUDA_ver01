<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#designRoom_next2").click(function() {
			
			if(fig_img_arr.length==0){
				alert("가구를 배치해주세요")
			}else{
				$("#myBar").css("width","75%");
				$("#ing").html("");
				$("#ing").append("75%");
				
				$.ajax({
					url : "${URLs.URI_DESIGNROOM_NAME_FULL}",
					success : function(data) {
						$("#design_Include_body").html(data);
					}
				});
				$.ajax({
					url : "${URLs.URI_DESIGNROOM_BUTTON3_FULL}",
					success : function(data) {
						$("#design_Include_button").html(data);
					}
				});
			}
		});
		
		
		$("#designRoom_after2").click(function(){
			$("#myBar").css("width","25%");
			$("#ing").html("");
			$("#ing").append("25%");
			
			fig_img_arr=[];
			fig_num_arr=[];
			fig_img_X_arr=[];
			fig_img_Y_arr=[];
			fig_img_width_length_arr=[];
			fig_img_height_length_arr=[];
			fig_img_state_arr=[];
			select_myroom='';
			
			fig_arr_length=0;
			
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
	});
</script>
</head>
<body>
<div class="w3-container roomMake_Progress_Button2_css">
	<button  class="w3-button w3-red" id="designRoom_after2">이전</button>
	<button  class="w3-button w3-blue"id="designRoom_next2">다음</button>
</div>
</body>
</html>