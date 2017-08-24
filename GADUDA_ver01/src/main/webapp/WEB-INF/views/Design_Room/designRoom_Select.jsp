<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="kr.co.gaduda.common.URLs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

#designRoom_select_room{
	border: 1px solid; 
	width: 1158px; 
	height:800px;
}

.designRoom_select_room_line{
	height:251;
	margin-top:10px;
	margin-right:10px;
	margin-left:10px;
}
.designRoom_select_room_content{
	border: 1px solid;
	margin-left:10px;
	float:left;
	width: 32%; 
	height:100%;
}
.designRoom_select_room_img{
	width: 100%; 
	height:80%;
}
.designRoom_select_room_title{
	width: 100%; 
	height:20%;
}
.designRoom_select_room_img_src{
	width: 100%; 
	height:100%;
}
#designRoom_select_pageing{
	height:50px;
	width: 1158px; 
	text-align:center
}
#designRoom_select_pageing_num{	
 	 width:400px;
 	 height:100px;
 	 margin:0 auto;
 	 text-align:center 
	
	
}
.designRoom_select_num_pageing{
	
	float:left;
	height:50px;
	width: 50px;
}





</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	
	var designRoom_select_room_append='';
	var num=0;
	var myroom_start='';
	var myroom_size=[];
	var myroom_line_length='';
	select_myroom_img();
	
	
	function select_myroom_img(){
		$.ajax({
			url : "${URLs.URI_DESIGNROOM_SELECT_ROOM_FULL}",
			type : 'POST',
			contentType : 'application/json',
			success : function(data){
				myroom = data;
				designRoom_select_room_show();
				designRoom_select_room_pagring();
			}
		});
	}
	function designRoom_select_room_pagring(){
		
		if(2<=myroom_size.length){
			var ss0='';
			for(var i=1; i<=myroom_size.length; i++){
				ss0+="<div class='designRoom_select_num_pageing' value='"+i+"'><h2>"+i+"</h2></div>";
			}
			$("#designRoom_select_pageing_num").append(ss0);
		} 
	} 	
	function designRoom_select_room_show(){
		
		$("#designRoom_select_room").html("");
		
		select_myroom=''
		designRoom_select_room_append='';
		
		myroom_start=num*9;
		if(myroom.myroom.length%9==0){
			if(myroom.myroom.length/9!=1){
				for(var i=0; i<myroom.myroom.length/9;i++){
					myroom_size[i]=9;
				}
			}
		}else{
			var myroom_size_num=parseInt(myroom.myroom.length/9);			
			for(var i=0; i<myroom_size_num;i++){
				myroom_size[i]=9;
			}
			myroom_size[myroom_size_num]=myroom.myroom.length%9;
		}
		if(myroom_size[num]<9){
			if(myroom_size[num]%3==0){					
				myroom_line_length=myroom_size[num]/3;
				for(var i=0; i<myroom_line_length; i++){
					designRoom_select_room_append+="<div class='designRoom_select_room_line'>";
					for(var j=0; j<3; j++){
						designRoom_select_room_content();
						myroom_start++
					}
					designRoom_select_room_append+="</div>";
				}
			}else{
				myroom_line_length=parseInt(myroom_size[num]/3)+1;
				
				for(var i=0; i<myroom_line_length; i++){
					designRoom_select_room_append+="<div class='designRoom_select_room_line'>";
					if(i != myroom_line_length-1){
						for(var j=0; j<3; j++){
							designRoom_select_room_content();
							myroom_start++
						}
					}else{
						var ss7=myroom_size[num]%3;
						for(var j=0; j<myroom_size[num]%3; j++){
							designRoom_select_room_content();
							myroom_start++
						}
					}
					designRoom_select_room_append+="</div>";
				}
			}
		}else{
			for(var i=0; i<3; i++){
				designRoom_select_room_append+="<div class='designRoom_select_room_line'>";
				for(var j=0; j<3; j++){
					designRoom_select_room_content();
					myroom_start++
				}
				designRoom_select_room_append+="</div>";
			}
		}	
		$("#designRoom_select_room").append(designRoom_select_room_append);
	}
	
 	function designRoom_select_room_content(){
		designRoom_select_room_append+="<div class='designRoom_select_room_content' value='"+myroom.myroom[myroom_start].room_img_src+"'>";
			designRoom_select_room_append+="<div class='designRoom_select_room_img'>";
			designRoom_select_room_append+="<img class='designRoom_select_room_img_src' src='"+myroom.myroom[myroom_start].room_img_src+"'>;"
			designRoom_select_room_append+="</div>";
			designRoom_select_room_append+="<div class='designRoom_select_room_title'>";
			designRoom_select_room_append+=myroom.myroom[myroom_start].room_name;
			designRoom_select_room_append+="</div>";
		designRoom_select_room_append+="</div>";		
	}
	

	
	
	$(document).on('click', '.designRoom_select_room_content', function(e) {
		select_myroom = $(this).attr('value');
		$(".designRoom_select_room_content").css('border','2px solid');
		$(this).css('border','2px solid red');
	});
	$(document).on('click', '.designRoom_select_num_pageing', function(e) {
		num = $(this).attr('value')-1;
		designRoom_select_room_show();
		$(".designRoom_select_num_pageing").css('border','');
		$(this).css('border','2px solid red');
	});
});


</script>
</head>
<body>
<div id="designRoom_select_room"></div>
</br>
<diV id="designRoom_select_pageing">
	<div id="designRoom_select_pageing_num"></div>
</diV>
</body>
</html>