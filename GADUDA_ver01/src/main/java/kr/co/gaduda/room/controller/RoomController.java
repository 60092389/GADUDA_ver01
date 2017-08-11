package kr.co.gaduda.room.controller;


import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.member.vo.MemberVO;
import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.service.impl.RoomService;
import kr.co.gaduda.room.vo.RoomVO;

@Controller
@RequestMapping(value = "/room")
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	// 마이페이지 내 방 가져오기
	@RequestMapping(value = URLs.URI_MYPAGE_MYROOM)
	public String callMyRoom(HttpServletRequest request, Model model) {
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id = memVO.getMem_id();
		System.out.println(mem_id+"마이페이지 룸룸");
		
		List<RoomVO> myRoomList = roomService.callMyRoomList(mem_id);
		System.out.println(myRoomList+"꺄");
		
		model.addAttribute("myRoomList", myRoomList);
		return Pages.VIEW_MYROOM;
	}

	
	@RequestMapping(value = URLs.URI_ROOMMAKE_INCLUDE, method = RequestMethod.GET)
	public ModelAndView  home() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_INCLUDE);

		return mav;
	}
	
	@RequestMapping(value = URLs.URI_ROOMMAKE_PROGRESS_BUTTON1, method = RequestMethod.GET)
	public ModelAndView  roomMake_Progress_Button1() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_PROGRESS_BUTTON1);
		return mav;
	}
	
	@RequestMapping(value = URLs.URI_ROOMMAKE_SELECT_FIGURE , method = RequestMethod.GET)
	public ModelAndView  roomMake_Select_Figure() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_SELECT_FIGURE);

		return mav;
	}
	
	@RequestMapping(value = URLs.URI_ROOMMAKE_CANVAS, method = RequestMethod.GET)
	public ModelAndView  roomMake_Canvas() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_CNAVAS);

		return mav;
	}
	@RequestMapping(value = URLs.URI_ROOMMAKE_PROGRESS_BUTTON2, method = RequestMethod.GET)
	public ModelAndView  roomMake_Progress_Button2() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_PROGRESS_BUTTON2);

		return mav;
	}
	
	
	@RequestMapping(value = URLs.URI_ROOMMAKE_ROOMNAME, method = RequestMethod.GET)
	public ModelAndView roomMake_RoomName() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_ROOMNAME);

		return mav;
	}
	@RequestMapping(value = URLs.URI_ROOMMAKE_PROGRESS_BUTTON3 , method = RequestMethod.GET)
	public ModelAndView roomMake_Progress_Button3() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_PROGRESS_BUTTON3);

		return mav;
	}
	
	
	
	@RequestMapping(value = URLs.URI_ROOMMAKE , method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> roomMake(RoomDTO roomDTO, HttpServletRequest request) throws Exception {
		
		FileOutputStream stream = null;
		Map<String, Object> data = new HashMap<String, Object>();
		
		try {
			
			if (roomDTO.getRoom_Img() == null || roomDTO.getRoom_Img() == "") {
				throw new Exception();
			}
			
			String RoomMake_Canvas_Img_MyRoom = roomDTO.getRoom_Img().replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(RoomMake_Canvas_Img_MyRoom);
			
			String fileName = UUID.randomUUID().toString();
			stream = new FileOutputStream("c:\\Users\\shama\\git\\GADUDA_ver01\\GADUDA_ver01\\src\\main\\webapp\\resources\\Images\\User_Myroom\\" + fileName + ".png");
			stream.write(file);
			
			MemberVO memberVO= (MemberVO)request.getSession().getAttribute("member");
			roomDTO.setUserId(memberVO.getMem_id());
			
			String room_img_src="c:/Users/shama/git/GADUDA_ver01/GADUDA_ver01/src/main/webapp/resources/Images/User_Myroom/" + fileName + ".png";
			roomDTO.setRoom_Img_src(room_img_src);
			if(roomService.insertRoom(roomDTO)==1){
				data.put("MSG", "저장완료");
			}else{
				throw new Exception();
			}
		} catch (Exception e) {
			data.put("MSG", "저장실패");
		} finally {
			stream.close();
		}
		data.put("URL", URLs.URI_MYPAGE_MEMBER_FULL);
		return data;
	}
	
}
