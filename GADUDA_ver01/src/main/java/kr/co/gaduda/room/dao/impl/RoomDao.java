package kr.co.gaduda.room.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.room.dao.IRoomDao;
import kr.co.gaduda.room.dto.RoomDTO;
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
}
