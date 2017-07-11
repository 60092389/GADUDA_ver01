package kr.co.gaduda.furniture_arr.service;

import java.util.List;
import java.util.Map;

import kr.co.gaduda.furniture_arr.vo.Arrangement_furnituresVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrGoodListVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrDetailVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;

public interface IFurniture_arrService {
	public List<Furniture_arrVO> furArrList();
	
	
	/////////////////////////////////////////////
	//가구배치도 상세페이지 - 상세정보
	public Furniture_arrDetailVO getFurArrDetailInfo(int fur_arr_plan_no);
	//가구배치도 상세페이지 - 댓글목록
	public List<FurnitureArrReplyListVO> getFurArrReplyList(int fur_arr_plan_no);
	//가구배치도 상세페이지 - 사용한 가구목록
	public List<Arrangement_furnituresVO> getFurArrFurniture(int fur_arr_plan_no);

	
	//가구배치도 좋아요
	public int furnitureArrGood(Map<String, Object> furnitureArrGoodInfo);
	//가구배치도 좋아요 목록
	public List<FurnitureArrGoodListVO> getFurArrGoodList(Map<String, Object> furArrGoodInfo);
	
	//가구배치도 댓글달기
	public int insertFurnitureArrReply(Map<String, Object> furArrReplyInfo);
	//가구배치도 댓글 삭제
	public int deleteFurnitureArrReply(Map<String, Object> furArrReplyInfo);
	
	//가구배치도 스크랩 하기
	public int insertFurnitureArrScrap(Map<String, Object> furArrScrapInfo);
	
}
