package kr.co.gaduda.room.service;

import java.util.List;

import kr.co.gaduda.room.dto.DesignRoom_Concept_DTO;
import kr.co.gaduda.room.dto.DesignRoom_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Furniture_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Kind_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Update_DTO;
import kr.co.gaduda.room.dto.Designroom_Tag_DTO;
import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.dto.Room_Img_Src_DTO;
import kr.co.gaduda.room.vo.Funrniture_VO;
import kr.co.gaduda.room.vo.Furniture_Basic_Img;
import kr.co.gaduda.room.vo.Furniture_Pic_VO;
import kr.co.gaduda.room.vo.Furniture_Up_Room_VO;
import kr.co.gaduda.room.vo.Furniture_Up_Select_Data_VO;
import kr.co.gaduda.room.vo.RoomVO;
import kr.co.gaduda.room.vo.Scrap_No;

public interface IRoomService {
	public int insertRoom(RoomDTO roomDTO);
	
	public int del_Room_ser(int del_room_no);
	
	
	
	
	public List<RoomVO> callMyRoomList(String mem_id);
	
	public List<RoomVO> get_Room_info_ser(String userId);
	public List<Funrniture_VO>get_Fur_info_ser();
	public List<Furniture_Pic_VO>get_Fur_pic_ser();
	public List<Furniture_Basic_Img>get_basic_img_ser();
	
	public int insertDesignRoom_ser(DesignRoom_DTO designRoom_DTO, List<Designroom_Tag_DTO> designroom_tag, List<DesignRoom_Furniture_DTO> DesignRoom_Furniture_List,Room_Img_Src_DTO room_Img_Src_DTO,DesignRoom_Concept_DTO designRoom_concept_DTO,DesignRoom_Kind_DTO designRoom_Kind_DTO);
	
	public int delDesignRoom_ser(int designRoomNum);
	
	
	
	public List<Furniture_Up_Select_Data_VO> Furniture_Up_Select_Data_ser(int designRoom_up_num);
	public Furniture_Up_Room_VO Furniture_Up_Room_ser(int designRoom_up_num);
	
	
	
	public int updateDesignRoom_ser(DesignRoom_Update_DTO designRoom_Update_DTO, List<Designroom_Tag_DTO> designroom_tag, List<DesignRoom_Furniture_DTO> DesignRoom_Furniture_List,Room_Img_Src_DTO room_Img_Src_DTO,DesignRoom_Concept_DTO designRoom_concept_DTO,DesignRoom_Kind_DTO designRoom_Kind_DTO);


	public List<Scrap_No> get_scrap_fur_no_ser(String userId);

}
