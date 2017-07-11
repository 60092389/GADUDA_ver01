package kr.co.gaduda.scrap.dao;

import java.util.List;

import kr.co.gaduda.furniture.vo.FurnitureVO;
import kr.co.gaduda.scrap.vo.FurArrBasicVO;
import kr.co.gaduda.scrap.vo.FurArrNoDateVO;
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
	
	
	//가구스크랩 삭제
	public int furnitureScrapDelete(int fur_scrap_no);
	
	
	
	//해당 회원이 갖고 있는 가구배치도스크랩의 가구배치도스크랩번호, 가구배치도번호, 가구배치도스크랩작성날짜
	public List<FurArrNoDateVO> furArrNo_furArrDate_List(String mem_id);
	
	//해당 가구배치도스크랩번호의 가구배치도 정보
	public FurArrBasicVO fur_arr_scrap_info(int fur_arr_plan_no);
	
	//해당 가구배치도의 컨셉리스트
	public List<String> furArrConceptList(int fur_arr_plan_no);
	
	//해당 가구배치도의 방종류리스트
	public List<String> furArrRoomKindList(int fur_arr_plan_no);
	
	//해당 가구배치도의 스크랩 갯수
	public int furArrScrapCount(int fur_arr_plan_no);
	
	//가구배치도 스크랩 삭제
	public int furArrScrapDelete(int fur_arr_scrap_no);
	
}
