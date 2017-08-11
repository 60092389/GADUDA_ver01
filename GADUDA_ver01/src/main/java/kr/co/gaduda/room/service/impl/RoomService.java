package kr.co.gaduda.room.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.room.dao.IRoomDao;
import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.service.IRoomService;
import kr.co.gaduda.room.vo.RoomVO;

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
}
