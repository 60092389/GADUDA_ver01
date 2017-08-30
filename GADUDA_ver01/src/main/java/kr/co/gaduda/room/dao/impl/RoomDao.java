package kr.co.gaduda.room.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.room.dao.IRoomDao;
import kr.co.gaduda.room.dto.DesignRoom_Concept_DTO;
import kr.co.gaduda.room.dto.DesignRoom_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Furniture_DTO;
import kr.co.gaduda.room.dto.DesignRoom_Kind_DTO;
import kr.co.gaduda.room.dto.Designroom_Tag_DTO;
import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.dto.Room_Img_Src_DTO;
import kr.co.gaduda.room.vo.Funrniture_VO;
import kr.co.gaduda.room.vo.Furniture_Basic_Img;
import kr.co.gaduda.room.vo.Furniture_Pic_VO;
import kr.co.gaduda.room.vo.RoomVO;

@Repository
public class RoomDao implements IRoomDao {
	
	private static final String namespace = "kr.co.gaduda.mapper.room.RoomMapper";
	
	@Autowired
	SqlSession roomSqlSession;
	
	@Override
	public List<RoomVO> callMyRoomList(String mem_id){
		return roomSqlSession.selectList(namespace+".call_my_room_list", mem_id);
	}
	
	public String shsh(){
		return roomSqlSession.selectOne(namespace+".getTime");
	}
	@Override
	public int insertRoom(RoomDTO roomDTO) {
		return roomSqlSession.insert(namespace+".insert_my_room",roomDTO);
	}
	@Override
	public List<RoomVO> get_Room_info_dao(String UserId) {
		return roomSqlSession.selectList(namespace + ".get_Room_info",UserId);
	}
	@Override
	public List<Funrniture_VO> get_Fur_info_dao() {
		return roomSqlSession.selectList(namespace + ".get_Fur_info");
	}

	@Override
	public List<Furniture_Pic_VO> get_fur_pic_dao() {
		return roomSqlSession.selectList(namespace + ".get_Fur_pic");
	}
	@Override
	public List<Furniture_Basic_Img> get_basic_img_dao() {
		return roomSqlSession.selectList(namespace + ".get_basic_img");
	}

	@Override
	public int insertDesignRoom_dao(DesignRoom_DTO designRoom_DTO) {
		return roomSqlSession.insert(namespace+".insertDesignRoom",designRoom_DTO);
	}
	
	@Override
	public int designRoom_max_num_dao() {
		return roomSqlSession.selectOne(namespace+".designRoom_max_num");
	}
	@Override
	public int insertDesignRoom_Tag_dao(Designroom_Tag_DTO designroom_tag_value) {
		return roomSqlSession.insert(namespace+".insertDesignRoom_Tag_dao",designroom_tag_value);
	}
	@Override
	public int insertDesignRoom_Img_dao(DesignRoom_Furniture_DTO designRoom_Furniture_DTO) {
		return roomSqlSession.insert(namespace+".insertDesignRoom_Img_dao",designRoom_Furniture_DTO);
	}
	@Override
	public int insertDesignRoom_Img_Src_dao(Room_Img_Src_DTO room_Img_Src_DTO) {
		return roomSqlSession.insert(namespace+".insertDesignRoom_Img_Src_dao",room_Img_Src_DTO);
	}

	
	
	@Override
	public int insertDesignRoom_Kind_dao(DesignRoom_Kind_DTO designRoom_Kind_DTO) {
		return roomSqlSession.insert(namespace+".insertDesignRoom_Kind_dao",designRoom_Kind_DTO);
	}

	@Override
	public int insertDesignRoom_concept_dao(DesignRoom_Concept_DTO designRoom_concept_DTO) {
		return roomSqlSession.insert(namespace+".insertDesignRoom_concept_dao",designRoom_concept_DTO);
	}

	
	
	@Override
	public int delDesignRoom_dao(int designRoomNum) {
		return roomSqlSession.delete(namespace+".delDesignRoom_dao",designRoomNum);
	}

	@Override
	public int delDesignRoom_Tag_dao(int designRoomNum) {
		return roomSqlSession.delete(namespace+".delDesignRoom_Tag_dao",designRoomNum);
	}

	@Override
	public int delDesignRoom_Img_dao(int designRoomNum) {
		return roomSqlSession.delete(namespace+".delDesignRoom_Img_dao",designRoomNum);
	}

	@Override
	public int delDesignRoom_Img_Src_dao(int designRoomNum) {
		return roomSqlSession.delete(namespace+".delDesignRoom_Img_Src_dao",designRoomNum);
	}

	@Override
	public int delDesignRoom_Kind_dao(int designRoomNum) {
		return roomSqlSession.delete(namespace+".delDesignRoom_Kind_dao",designRoomNum);
	}

	@Override
	public int delDesignRoom_concept_dao(int designRoomNum) {
		return roomSqlSession.delete(namespace+".delDesignRoom_concept_dao",designRoomNum);
	}

	


}
