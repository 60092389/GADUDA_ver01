package kr.co.gaduda.room.service;

import java.util.List;

import kr.co.gaduda.room.vo.RoomVO;

public interface IRoomService {
	public List<RoomVO> callMyRoomList(String mem_id);
}
