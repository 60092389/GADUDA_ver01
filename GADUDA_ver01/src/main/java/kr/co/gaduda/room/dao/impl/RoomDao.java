package kr.co.gaduda.room.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.room.dao.IRoomDao;
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

}
