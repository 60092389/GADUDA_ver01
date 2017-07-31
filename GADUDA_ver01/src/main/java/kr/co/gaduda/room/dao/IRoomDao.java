package kr.co.gaduda.room.dao;

import java.util.List;

import kr.co.gaduda.room.vo.RoomVO;

public interface IRoomDao {
	public List<RoomVO> callMyRoomList(String mem_id);
}
