package kr.co.gaduda.room.service;

import java.util.List;

import kr.co.gaduda.room.dto.RoomDTO;
import kr.co.gaduda.room.vo.Funrniture_VO;
import kr.co.gaduda.room.vo.Furniture_Basic_Img;
import kr.co.gaduda.room.vo.Furniture_Pic_VO;
import kr.co.gaduda.room.vo.RoomVO;

public interface IRoomService {
	public int insertRoom(RoomDTO roomDTO);
	public List<RoomVO> callMyRoomList(String mem_id);
	
	public List<RoomVO> get_Room_info_ser(String userId);
	public List<Funrniture_VO>get_Fur_info_ser();
	public List<Furniture_Pic_VO>get_Fur_pic_ser();
	public List<Furniture_Basic_Img>get_basic_img_ser();

}
