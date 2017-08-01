package kr.co.gaduda.furniture.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.gaduda.furniture.dto.FurnitureScrapDTO;
import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureGoodListVO;
import kr.co.gaduda.furniture.vo.FurnitureItemVO;
import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture.vo.FurnitureReplyListVO;
import kr.co.gaduda.furniture.vo.FurnitureScrapListVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;

public interface IFurnitureService {

	// 가구 상세페이지
	public List<FurnitureVO> furList();

	public FurnitureDetailVO furDetailView(int fur_no);

	public List<String> furDetailViewPic(int fur_no);

	public List<FurnitureReplyListVO> FurnitureReplList(int fur_no);
	
	public List<FurnitureGoodListVO> getFurGoodList(Map<String, Object> search);

	/////////////////////////////////////
	// 가구구경 페이지 용
	public List<FurnitureListViewVO> furnitureList(String room_kind_def_name, String concept_name,
			String fur_kind_def_name, String array_option, HttpServletRequest request);

	// 가구 좋아요
	public int furnitureGood(Map<String, Object> furnitureGoodInfo);

	// 가구 댓글 작성
	public void insertFurnitureReply(Map<String, Object> furnitureReplyInfo);

	// 가구 댓글 리스트
	public List<FurnitureReplyListVO> listFurnitureReply(Map<String, Object> furnitureReplyInfo);

	// 가구 댓글 삭제
	public void deleteFurnitureReply(Map<String, Object> furnitureReplyDeleteInfo);

	//////////////////////////////////////

	// 가구 스크랩
	public int furScrapChk(FurnitureScrapDTO furnitureScrapDTO);

	public int furScrap(FurnitureScrapDTO furnitureScrapDTO);

	public List<FurnitureScrapListVO> furScrapList(int fur_no);
	
	//가구 방 종류 가져오기
	public List<String> getRoomKind();
	
	//가구 방 컨셉 가져오기
	public List<String> getConceptKind();
	
	//가구 종류 가져오기
	public List<String> getFurDefKind();
	
	//방 종류에 따라 가구 가져오기
	public List<String> getFurNameForRoom(String room_kind_def_name);
	
}
