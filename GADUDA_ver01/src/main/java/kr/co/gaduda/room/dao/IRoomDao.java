package kr.co.gaduda.room.dao;

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

public interface IRoomDao {
	public int insertRoom(RoomDTO roomDTO);
	public int del_Room_dao(int del_room_no);
	
	public List<RoomVO> callMyRoomList(String mem_id);
	public List<RoomVO> get_Room_info_dao(String userId);
	
	public List<Funrniture_VO>get_Fur_info_dao();
	public List<Furniture_Pic_VO>get_fur_pic_dao();
	public List<Furniture_Basic_Img>get_basic_img_dao();
	
	public int insertDesignRoom_dao(DesignRoom_DTO designRoom_DTO);
	public int designRoom_max_num_dao();
	
	public int insertDesignRoom_Tag_dao(Designroom_Tag_DTO designroom_tag_value);
	public int insertDesignRoom_Img_dao(DesignRoom_Furniture_DTO designRoom_Furniture_DTO);
	public int insertDesignRoom_Img_Src_dao(Room_Img_Src_DTO room_Img_Src_DTO);
	
	public int insertDesignRoom_Kind_dao(DesignRoom_Kind_DTO designRoom_Kind_DTO);
	public int insertDesignRoom_concept_dao(DesignRoom_Concept_DTO designRoom_concept_DTO);
	
	
	
	public int delDesignRoom_dao(int designRoomNum);
	
	public int delDesignRoom_Tag_dao(int designRoomNum);
	public int delDesignRoom_Img_dao(int designRoomNum);
	public int delDesignRoom_Img_Src_dao(int designRoomNum);
	
	public int delDesignRoom_Kind_dao(int designRoomNum);
	public int delDesignRoom_concept_dao(int designRoomNum);
	
	public List<Furniture_Up_Select_Data_VO> Furniture_Up_Select_Data_dao(int designRoom_up_num);
	public Furniture_Up_Room_VO Furniture_Up_Room_dao(int designRoom_up_num);
	
	public int updateDesignRoom_dao(DesignRoom_Update_DTO designRoom_Update_DTO);
	
	
	
	public List<Scrap_No> get_scrap_fur_no_dao(String userId);
	
}
