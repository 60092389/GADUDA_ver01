package kr.co.gaduda.room.dao;

import java.util.List;

import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.vo.Funrniture_VO;
import kr.co.gaduda.room.vo.Furniture_Basic_Img;
import kr.co.gaduda.room.vo.Furniture_Pic_VO;
import kr.co.gaduda.room.vo.RoomVO;

public interface IRoomDao {
	public int insertRoom(RoomDTO roomDTO);
	public List<RoomVO> callMyRoomList(String mem_id);
	public List<RoomVO> get_Room_info_dao(String userId);
	
	public List<Funrniture_VO>get_Fur_info_dao();
	public List<Furniture_Pic_VO>get_fur_pic_dao();
	public List<Furniture_Basic_Img>get_basic_img_dao();
}
