package kr.co.gaduda.room.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.member.vo.MemberVO;
import kr.co.gaduda.room.dto.DesignRoom_Concept_DTO;
import kr.co.gaduda.room.dto.DesignRoom_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Furniture_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Kind_DTO;
import kr.co.gaduda.room.dto.Designroom_Tag_DTO;
import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.dto.Room_Img_Src_DTO;
import kr.co.gaduda.room.service.impl.RoomService;
import kr.co.gaduda.room.vo.Funrniture_VO;
import kr.co.gaduda.room.vo.Furniture_Basic_Img;
import kr.co.gaduda.room.vo.Furniture_Pic_VO;
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
		System.out.println(mem_id + "마이페이지 룸룸");

		List<RoomVO> myRoomList = roomService.callMyRoomList(mem_id);
		System.out.println(myRoomList + "꺄");

		model.addAttribute("myRoomList", myRoomList);
		return Pages.VIEW_MYROOM;
	}

	@RequestMapping(value = URLs.URI_ROOMMAKE_INCLUDE, method = RequestMethod.GET)
	public ModelAndView home() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_INCLUDE);

		return mav;
	}

	@RequestMapping(value = URLs.URI_ROOMMAKE_PROGRESS_BUTTON1, method = RequestMethod.GET)
	public ModelAndView roomMake_Progress_Button1() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_PROGRESS_BUTTON1);
		return mav;
	}

	@RequestMapping(value = URLs.URI_ROOMMAKE_SELECT_FIGURE, method = RequestMethod.GET)
	public ModelAndView roomMake_Select_Figure() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_SELECT_FIGURE);

		return mav;
	}

	@RequestMapping(value = URLs.URI_ROOMMAKE_CANVAS, method = RequestMethod.GET)
	public ModelAndView roomMake_Canvas() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_CNAVAS);

		return mav;
	}

	@RequestMapping(value = URLs.URI_ROOMMAKE_PROGRESS_BUTTON2, method = RequestMethod.GET)
	public ModelAndView roomMake_Progress_Button2() {

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

	@RequestMapping(value = URLs.URI_ROOMMAKE_PROGRESS_BUTTON3, method = RequestMethod.GET)
	public ModelAndView roomMake_Progress_Button3() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_ROOMMAKE_PROGRESS_BUTTON3);

		return mav;
	}

	@RequestMapping(value = URLs.URI_ROOMMAKE, method = RequestMethod.POST, produces = { "application/json" })
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
			
			
			
			stream = new FileOutputStream(
					"D:\\gaduda\\room"
							+ fileName + ".png");

//			stream = new FileOutputStream(
//					"d:\\stsproject\\GADUDA_ver01_4\\GADUDA_ver01\\src\\main\\webapp\\resources\\Images\\User_Myroom\\"
//							+ fileName + ".png");
			
			stream.write(file);
			MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
			roomDTO.setUserId(memberVO.getMem_id());
			
			String room_img_src = "/roomimage/"
					+ fileName + ".png";
			
			roomDTO.setRoom_Img_src(room_img_src);
			if (roomService.insertRoom(roomDTO) == 1) {
				data.put("MSG", "저장완료");
			} else {
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

	@RequestMapping(value = URLs.URI_DESIGNROOM_INCLUDE, method = RequestMethod.GET)
	public ModelAndView designRoom_Include() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_DESIGNROOM_INCLUDE);

		return mav;
	}

	@RequestMapping(value = URLs.URI_DESIGNROOM_SELECT, method = RequestMethod.GET)
	public ModelAndView designRoom_Select() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_DESIGNROOM_SELECT);

		return mav;
	}

	@RequestMapping(value = URLs.URI_DESIGNROOM_CANVAS, method = RequestMethod.GET)
	public ModelAndView designRoom_Canvas() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_DESIGNROOM_CANVAS);

		return mav;
	}

	@RequestMapping(value = URLs.URI_DESIGNROOM_NAME, method = RequestMethod.GET)
	public ModelAndView designRoom_Name() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_DESIGNROOM_NAME);

		return mav;
	}
	
	
	@RequestMapping(value = URLs.URI_DESIGNROOM_NAME_SAVE, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> designRoom(
			DesignRoom_DTO designRoon_DTO,
			//해시 태그 값
			@RequestParam(value="designroom_tag_value") String designroom_tag_value,
			
			@RequestParam(value="fig_num[]") List<Integer> fig_num,
			@RequestParam(value="fig_img_X[]") List<Integer> fig_img_X,
			@RequestParam(value="fig_img_Y[]") List<Integer> fig_img_Y,
			@RequestParam(value="fig_img_state[]") List<String> fig_img_state,
			
			@RequestParam(value="designRoom_Img") String designRoom_Img,
			
			@RequestParam(value="designRoom_kind") int designRoom_kind,
			@RequestParam(value="designRoom_concept") int designRoom_concept,
			HttpServletRequest request) throws Exception{
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		String room_img_src =null;
		System.out.println("tkqkf");
		List<Designroom_Tag_DTO>designroom_tag = new ArrayList<Designroom_Tag_DTO>();
		String temp[] = designroom_tag_value.split("#");
		for(int i=1; i<temp.length;i++){
			Designroom_Tag_DTO designroom_Tag_DTO = new Designroom_Tag_DTO();
			
			designroom_Tag_DTO.setDesignroom_tag("#"+temp[i]);
			System.out.println(designroom_Tag_DTO.getDesignroom_tag());
			designroom_tag.add(designroom_Tag_DTO);
		}
		
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		designRoon_DTO.setUserId(memberVO.getMem_id());
		
		
		//배치도 그림 좌표
		List<DesignRoom_Furniture_DTO> DesignRoom_Furniture_List = new ArrayList<DesignRoom_Furniture_DTO>();
		for(int i=0;i<fig_num.size();i++){
			DesignRoom_Furniture_DTO designRoon_Furniture_DTO = new DesignRoom_Furniture_DTO();
			designRoon_Furniture_DTO.setFig_num(fig_num.get(i));
			designRoon_Furniture_DTO.setFig_img_X(fig_img_X.get(i));
			designRoon_Furniture_DTO.setFig_img_Y(fig_img_Y.get(i));
			designRoon_Furniture_DTO.setFig_img_state(fig_img_state.get(i));
			DesignRoom_Furniture_List.add(designRoon_Furniture_DTO);
		}
		
		
		//배치도 이미지 생성
		FileOutputStream stream = null;
		try {
			if (designRoom_Img == null || designRoom_Img == "") {
				throw new Exception();
			}
			String RoomMake_Canvas_Img_MyRoom = designRoom_Img.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(RoomMake_Canvas_Img_MyRoom);
			String fileName = UUID.randomUUID().toString();
			
			stream = new FileOutputStream(
					"D:\\gaduda\\furniturearr\\"
							+ fileName + ".png");
			
			room_img_src = "/furarrimage/"+ fileName + ".png";
			stream.write(file);
		} catch (Exception e) {
			System.out.println("실패");
		} finally {
			stream.close();
		}
		Room_Img_Src_DTO room_Img_Src_DTO = new Room_Img_Src_DTO();
		room_Img_Src_DTO.setRoom_img_src(room_img_src);
		
		DesignRoom_Kind_DTO designRoom_Kind_DTO =  new DesignRoom_Kind_DTO();
		designRoom_Kind_DTO.setDesignRoom_kind(designRoom_kind);
		
		DesignRoom_Concept_DTO designRoom_concept_DTO  =  new DesignRoom_Concept_DTO();
		designRoom_concept_DTO.setDesignRoom_concept(designRoom_concept);
		
		
		int num= roomService.insertDesignRoom_ser(designRoon_DTO,designroom_tag,DesignRoom_Furniture_List, room_Img_Src_DTO,designRoom_concept_DTO ,designRoom_Kind_DTO);		
		if(num==1){
			 data.put("MSG", "저장완료");
		}else if(num==2){
			data.put("MSG", "저장실패");
		}
		data.put("URL", URLs.URI_MYPAGE_MEMBER_FULL);
		return data;
	}
	
	
	@RequestMapping(value = URLs.URI_DESIGNROOM_DEL, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> ss(@RequestParam(value="designRoomNum") int designRoomNum) throws Exception{
		Map<String, Object> data = new HashMap<String, Object>();
		int sss=roomService.delDesignRoom_ser(designRoomNum);
		if(sss==0){
			data.put("MSG", "1");
			data.put("URL", URLs.URI_MYPAGE_MEMBER_FULL);
		}else{
			data.put("MSG", "0");
		}
		return data;
	}
	
	
	
	@RequestMapping(value = URLs.URI_DESIGNROOM_BUTTON1, method = RequestMethod.GET)
	public  ModelAndView designRoom_Button1() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_DESIGNROOM_BUTTON1);

		return mav;
	}

	@RequestMapping(value = URLs.URI_DESIGNROOM_BUTTON2, method = RequestMethod.GET)
	public ModelAndView designRoom_Button2() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_DESIGNROOM_BUTTON2);

		return mav;
	}

	@RequestMapping(value = URLs.URI_DESIGNROOM_BUTTON3, method = RequestMethod.GET)
	public ModelAndView designRoom_Button3() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(Pages.VIEW_DESIGNROOM_BUTTON3);

		return mav;
	}

	@RequestMapping(value = URLs.URI_DESIGNROOM_SELECT_ROOM, method = RequestMethod.POST, produces = {
			"application/json" })
	public @ResponseBody Map<String, Object> designRoom_Select_Room(HttpServletRequest request) {

		Map<String, Object> myroom = new HashMap<String, Object>();
		
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		List<RoomVO> list = roomService.get_Room_info_ser(memberVO.getMem_id());
		
		myroom.put("myroom", list);
		return myroom;
	}

	@RequestMapping(value = URLs.URI_DESIGNROOM_CANVAS_FURNITURE_DATA, method = RequestMethod.POST, produces = {
			"application/json" })
	public @ResponseBody Map<String, Object> designRoom_Canvas_Furniture_Data() {

		Map<String, Object> furniture = new HashMap<String, Object>();

		List<Funrniture_VO> list = roomService.get_Fur_info_ser();
		List<Furniture_Pic_VO> list2 = roomService.get_Fur_pic_ser();
		List<Furniture_Basic_Img> list3 = roomService.get_basic_img_ser();

		furniture.put("furniture", list);
		furniture.put("furniture_pic", list2);
		furniture.put("furniture_basic_img", list3);

		return furniture;
	}

}
