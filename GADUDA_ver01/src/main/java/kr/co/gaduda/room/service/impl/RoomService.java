package kr.co.gaduda.room.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.room.dao.IRoomDao;
import kr.co.gaduda.room.dto.DesignRoom_Concept_DTO;
import kr.co.gaduda.room.dto.DesignRoom_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Furniture_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Kind_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Update_DTO;
import kr.co.gaduda.room.dto.Designroom_Tag_DTO;
import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.dto.Room_Img_Src_DTO;
import kr.co.gaduda.room.service.IRoomService;
import kr.co.gaduda.room.vo.Funrniture_VO;
import kr.co.gaduda.room.vo.Furniture_Basic_Img;
import kr.co.gaduda.room.vo.Furniture_Pic_VO;
import kr.co.gaduda.room.vo.Furniture_Up_Room_VO;
import kr.co.gaduda.room.vo.Furniture_Up_Select_Data_VO;
import kr.co.gaduda.room.vo.RoomVO;
import kr.co.gaduda.room.vo.Scrap_No;

@Service
public class RoomService implements IRoomService {
	
	@Autowired
	private IRoomDao roomDao;
	
	@Override
	public List<RoomVO> callMyRoomList(String mem_id){
		return roomDao.callMyRoomList(mem_id);
	}
	

	@Override
	public int insertRoom(RoomDTO roomDTO) {
		return roomDao.insertRoom(roomDTO);
	}
	@Override
	public int del_Room_ser(int del_room_no) {
		return roomDao.del_Room_dao(del_room_no);
	}

	@Override
	public List<RoomVO> get_Room_info_ser(String userId) {
		return roomDao.get_Room_info_dao(userId);
	}
	@Override
	public List<Funrniture_VO> get_Fur_info_ser() {
		return roomDao.get_Fur_info_dao();
	}

	@Override
	public List<Furniture_Pic_VO> get_Fur_pic_ser() {
		return roomDao.get_fur_pic_dao();
	}
	@Override
	public List<Furniture_Basic_Img> get_basic_img_ser() {
		return roomDao.get_basic_img_dao();
	}

	@Override
	public int insertDesignRoom_ser(DesignRoom_DTO designRoom_DTO, List<Designroom_Tag_DTO> designroom_tag, List<DesignRoom_Furniture_DTO> DesignRoom_Furniture_List,Room_Img_Src_DTO room_Img_Src_DTO,DesignRoom_Concept_DTO designRoom_concept_DTO,DesignRoom_Kind_DTO designRoom_Kind_DTO) {
		
		int num =roomDao.insertDesignRoom_dao(designRoom_DTO);
		
		int designRoom_max_num=roomDao.designRoom_max_num_dao();
		
		for(int i=0;i<designroom_tag.size();i++){
			Designroom_Tag_DTO designroom_tag_value=designroom_tag.get(i);
			designroom_tag_value.setDesignRoom_max_num(designRoom_max_num);
			System.out.println(designroom_tag_value.getDesignroom_tag());
			System.out.println(designroom_tag_value.getDesignRoom_max_num());
			roomDao.insertDesignRoom_Tag_dao(designroom_tag_value);
		}
		
		for(int i=0;i<DesignRoom_Furniture_List.size();i++){
			DesignRoom_Furniture_DTO designRoom_Furniture_DTO=DesignRoom_Furniture_List.get(i);
			designRoom_Furniture_DTO.setDesignRoom_max_num(designRoom_max_num);
			roomDao.insertDesignRoom_Img_dao(designRoom_Furniture_DTO);
		}
		
		room_Img_Src_DTO.setDesignRoom_max_num(designRoom_max_num);
		roomDao.insertDesignRoom_Img_Src_dao(room_Img_Src_DTO);
		
		
		designRoom_concept_DTO.setDesignRoom_max_num(designRoom_max_num);
		roomDao.insertDesignRoom_concept_dao(designRoom_concept_DTO);

		
		designRoom_Kind_DTO.setDesignRoom_max_num(designRoom_max_num);
		roomDao.insertDesignRoom_Kind_dao(designRoom_Kind_DTO);
		
		
		return  num;
	}

	@Override
	public int delDesignRoom_ser(int designRoomNum) {
		
		roomDao.delDesignRoom_Tag_dao(designRoomNum);
		roomDao.delDesignRoom_Img_dao(designRoomNum);
		roomDao.delDesignRoom_Img_Src_dao(designRoomNum);
		
		roomDao.delDesignRoom_Kind_dao(designRoomNum);
		roomDao.delDesignRoom_concept_dao(designRoomNum);
		
		
		
		return roomDao.delDesignRoom_dao(designRoomNum);
	}
	
	@Override
	public List<Furniture_Up_Select_Data_VO> Furniture_Up_Select_Data_ser(int designRoom_up_num) {
		return roomDao.Furniture_Up_Select_Data_dao(designRoom_up_num);
	}

	@Override
	public Furniture_Up_Room_VO Furniture_Up_Room_ser(int designRoom_up_num) {
		return roomDao.Furniture_Up_Room_dao(designRoom_up_num);
	}
	
	
	
	@Override
	public int updateDesignRoom_ser(DesignRoom_Update_DTO designRoom_Update_DTO, List<Designroom_Tag_DTO> designroom_tag, List<DesignRoom_Furniture_DTO> DesignRoom_Furniture_List,Room_Img_Src_DTO room_Img_Src_DTO,DesignRoom_Concept_DTO designRoom_concept_DTO,DesignRoom_Kind_DTO designRoom_Kind_DTO) {
		
		int num =roomDao.updateDesignRoom_dao(designRoom_Update_DTO);
		
		
		
		roomDao.delDesignRoom_Tag_dao(designRoom_Update_DTO.getUpdata_num());
		roomDao.delDesignRoom_Img_dao(designRoom_Update_DTO.getUpdata_num());
		roomDao.delDesignRoom_Img_Src_dao(designRoom_Update_DTO.getUpdata_num());
		roomDao.delDesignRoom_Kind_dao(designRoom_Update_DTO.getUpdata_num());
		roomDao.delDesignRoom_concept_dao(designRoom_Update_DTO.getUpdata_num());
		
		
		for(int i=0;i<designroom_tag.size();i++){
			Designroom_Tag_DTO designroom_tag_value=designroom_tag.get(i);
			designroom_tag_value.setDesignRoom_max_num(designRoom_Update_DTO.getUpdata_num());
			System.out.println(designroom_tag_value.getDesignroom_tag());
			System.out.println(designroom_tag_value.getDesignRoom_max_num());
			roomDao.insertDesignRoom_Tag_dao(designroom_tag_value);
		}
		
		for(int i=0;i<DesignRoom_Furniture_List.size();i++){
			DesignRoom_Furniture_DTO designRoom_Furniture_DTO=DesignRoom_Furniture_List.get(i);
			designRoom_Furniture_DTO.setDesignRoom_max_num(designRoom_Update_DTO.getUpdata_num());
			roomDao.insertDesignRoom_Img_dao(designRoom_Furniture_DTO);
		}
		return num;
	}

	@Override
	public List<Scrap_No> get_scrap_fur_no_ser(String userId) {
		return roomDao.get_scrap_fur_no_dao(userId);
	}

	

	
}
