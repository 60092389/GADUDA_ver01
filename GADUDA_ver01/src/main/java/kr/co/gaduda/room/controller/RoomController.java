package kr.co.gaduda.room.controller;


import java.io.FileOutputStream;
import java.util.UUID;


import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gaduda.room.dto.RoomDTO;

@Controller
public class RoomController {

	
	@RequestMapping(value = "/roomMake_Include", method = RequestMethod.GET)
	public ModelAndView  home() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomMake/roomMake_Include");

		return mav;
	}
	
	@RequestMapping(value = "/roomMake_Progress_Button1", method = RequestMethod.GET)
	public ModelAndView  roomMake_Progress_Button1() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomMake/roomMake_Progress_Button1");
		return mav;
	}
	
	@RequestMapping(value = "/roomMake_Select_Figure", method = RequestMethod.GET)
	public ModelAndView  roomMake_Select_Figure() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomMake/roomMake_Select_Figure");

		return mav;
	}
	
	@RequestMapping(value = "/roomMake_Canvas", method = RequestMethod.GET)
	public ModelAndView  roomMake_Canvas() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomMake/roomMake_Canvas");

		return mav;
	}
	@RequestMapping(value = "/roomMake_Progress_Button2", method = RequestMethod.GET)
	public ModelAndView  roomMake_Progress_Button2() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomMake/roomMake_Progress_Button2");

		return mav;
	}
	
	
	@RequestMapping(value = "/roomMake_RoomName", method = RequestMethod.GET)
	public ModelAndView roomMake_RoomName() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomMake/roomMake_RoomName");

		return mav;
	}
	@RequestMapping(value = "/roomMake_Progress_Button3", method = RequestMethod.GET)
	public ModelAndView roomMake_Progress_Button3() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("roomMake/roomMake_Progress_Button3");

		return mav;
	}
	
	
	
	@RequestMapping(value = "/roomMake" ,method = RequestMethod.POST)
	public ModelAndView roomMake(RoomDTO roomDTO) throws Exception {
		
		FileOutputStream stream = null;
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			System.out.println("binary file " + roomDTO.getRoom_Img());
			
			if (roomDTO.getRoom_Img() == null || roomDTO.getRoom_Img() == "") {
				throw new Exception();
			}
			
			String RoomMake_Canvas_Img_MyRoom = roomDTO.getRoom_Img().replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(RoomMake_Canvas_Img_MyRoom);
			
			System.out.println("file :::::::: " + file + " || " + file.length);
			
		
			String fileName = UUID.randomUUID().toString();
			
			stream = new FileOutputStream("c:\\img\\" + fileName + ".png");
			stream.write(file);
			stream.close();
			
			System.out.println("저장 완료");
			mav.addObject("msg", "ok");
		} catch (Exception e) {
			System.out.println("저장 실패");
			mav.addObject("msg", "no");
			return mav;
		} finally {
			stream.close();
		}
		return mav;
	}
	
}
