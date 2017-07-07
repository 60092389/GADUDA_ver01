package kr.co.gaduda.furniture.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture.vo.FurnitureReplyListVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;

public interface IFurnitureService {
	public List<FurnitureVO> furList();

	public FurnitureDetailVO furDetailView(int fur_no);

	public List<String> furDetailViewPic(int fur_no);

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
}
