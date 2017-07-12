package kr.co.gaduda.furniture.dao;

import java.util.List;
import java.util.Map;

import kr.co.gaduda.furniture.dto.FurnitureCateDTO;
import kr.co.gaduda.furniture.dto.FurnitureScrapDTO;
import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture.vo.FurnitureReplyListVO;
import kr.co.gaduda.furniture.vo.FurnitureScrapListVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;
import kr.co.gaduda.furniture.vo.FurnitureGoodListVO;

public interface IFurnitureDao {
	
	public List<FurnitureVO> getFurniture();

	public FurnitureDetailVO getDetailFurniture(int fur_no);

	public int countFur();

	public List<String> fur_pic_loc_Get(int fur_no);

	public List<String> fur_pic_con_Get(int fur_no);

	public List<String> fur_pic_kind_Get(int fur_no);

	// 좋아요 리스트 가져오기
	public List<FurnitureGoodListVO> getFurGoodList(Map<String, Object> search);

	////////////////////////////////////////////////////////////////////////
	// 가구 구경 페이지
	// 아래 세개는 가구리스트뷰로 가져가기 위해 필요한 DAO들
	public List<FurnitureListViewVO> getFurBasicList(FurnitureCateDTO furCateDTO);

	public String getFurPicLoc(int fur_no);

	public int getFurScrapCount(int fur_no);

	// 가구 좋아요 업
	public void insertFurnitureGood(Map<String, Object> furnitureGoodInfo);

	// 가구 좋아요 갯수 업
	public int furnitureGoodNumUp(int fur_no);

	// 해당 회원이 해당 사진 좋아요 눌렀는지 확인
	public int furnitureGoodChk(Map<String, Object> furnitureGoodInfo);

	// 가구 좋아요 삭제
	public void deleteFurnitureGood(Map<String, Object> furnitureGoodInfo);

	// 가구 좋아요 갯수 내리기
	public int furnitureGoodNumDown(int fur_no);

	// 가구 댓글 작성
	public void insertFurnitureReply(Map<String, Object> furnitureReplyInfo);

	// 가구 댓글 작성후 가구 댓글 갯수 올리기
	public int furnitureReplyNumUp(int fur_no);

	// 가구 댓글 리스트
	public List<FurnitureReplyListVO> listFurnitureReply(Map<String, Object> furnitureReplyInfo);

	// 가구 댓글 삭제
	public void deleteFurnitureReply(Map<String, Object> furnitureReplyDeleteInfo);

	// 가구 댓글 삭제후 가구 댓글 갯수 내리기
	public int furnitureReplyNumDown(int fur_no);
	// 가구 구경 페이지 끝
	////////////////////////////////////////////////////////////////////////////

	// 가구 스크랩~~~~~~~~~~~~~~~~~~
	public int furScrapChk(FurnitureScrapDTO furnitureScrapDTO);

	public int furScrap(FurnitureScrapDTO furnitureScrapDTO);

	public List<FurnitureScrapListVO> furScrapList(int fur_no);

}
