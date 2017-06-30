package kr.co.gaduda.scrap.dao;

import java.util.List;

import kr.co.gaduda.furniture.vo.FurnitureVO;
import kr.co.gaduda.scrap.vo.FurnitureBasicVO;
import kr.co.gaduda.scrap.vo.FurnitureNoDateVO;

public interface IScrapDao {


	//가구스크랩 테이블에서 회원이 가지고 있는 가구번호랑 스크랩한날짜 가져오기
	public List<FurnitureNoDateVO> furNo_furDate_List(String mem_id);	
	
	//해당 가구의 사진경로 하나 가져오기
	public String fur_pic_loc_Get(int fur_no);
	
	
	//해당하는 가구번호의 가구이름, 가구가격, 가구 브랜드이름 가져오기
	public FurnitureBasicVO furniture_basic_info(int fur_no);
	
	//가구의 스크랩 수
	public int furnitureScrapCount(int fur_no);
	
	//가구의 좋아요 수
	public int furnitureGoodCount(int fur_no);
	
	//가구의 댓글 수
	public int furnitureReplyCount(int fur_no);
	
	//가구스크랩 삭제
	public int furnitureScrapDelete(int fur_scrap_no);
	
}
