package kr.co.gaduda.room.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.room.dao.IRoomDao;
import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.service.IRoomService;
import kr.co.gaduda.room.vo.Funrniture_VO;
import kr.co.gaduda.room.vo.Furniture_Basic_Img;
import kr.co.gaduda.room.vo.Furniture_Pic_VO;
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

	
}
