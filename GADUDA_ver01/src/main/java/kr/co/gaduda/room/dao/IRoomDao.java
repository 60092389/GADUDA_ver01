package kr.co.gaduda.room.dao;

import java.util.List;

import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.vo.RoomVO;

public interface IRoomDao {
	public int insertRoom(RoomDTO roomDTO);
	public List<RoomVO> callMyRoomList(String mem_id);
}
