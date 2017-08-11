package kr.co.gaduda.furniture_arr.dao;

import java.util.List;
import java.util.Map;

import kr.co.gaduda.furniture_arr.dto.FurnitureArrScrapDTO;
import kr.co.gaduda.furniture_arr.dto.OtherFurnitureDTO;
import kr.co.gaduda.furniture_arr.vo.Arrangement_furnituresVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrGoodListVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrDetailVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrMemberVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrScrapListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;
import kr.co.gaduda.furniture_arr.vo.Other_Furniture_arrVO;
import kr.co.gaduda.member.dto.FollowDTO;

public interface IFurniture_arrDao {
	public List<Furniture_arrVO> getFurArr();

	public List<String> FurArrRoomKind(int fur_arr_plan_no);

	public List<String> getFurCon(int fur_arr_plan_no);

	public String getRoomKind(int fur_arr_plan_no);
//-----------------------------------------------------------------------------//
	public List<Furniture_arrVO> getFurArr_roomkind(String room_kind_def_name);
	public int countFurArr_roomkind(String room_kind_def_name);
	public String getArrFurCon(String room_kind_def_name);
	public int getCountScrap(int fur_arr_plan_no);
	public List<Furniture_arrVO> getFurArr_concept(String concept_name);
	//2017-08-07 추가(수정)
	public Furniture_arrMemberVO getFurArrUser(String mem_id);
//	-----------------------------------------------------------------------------//	
	
	/////////////////////////////////////////////////////////
	// 가구배치도 상세페이지

	// 가구배치도 기본정보 가져오기
	public Furniture_arrDetailVO getFurArrDetailBasic(int fur_arr_plan_no);

	// 배치도의 해시태그
	public List<String> getFurArrHashtags(int fur_arr_plan_no);

	// 배치도의 컨셉
	public List<String> getFurArrConcepts(int fur_arr_plan_no);

	// 배치도의 방 종류
	public List<String> getFurArrRoomKinds(int fur_arr_plan_no);

	// 해당 배치도에 사용된 가구들
	public List<Arrangement_furnituresVO> getFurArrFurniture(int fur_arr_plan_no);

	// 해당 배치도에 사용된 가구의 이미지
	public String getArrFurPic(int fur_no);

	// 해당 배치도 작성자의 다른 배치도들
	public List<Other_Furniture_arrVO> getOtherFurArr(OtherFurnitureDTO otherFurnitureDTO);

	// 배치도의 댓글 내용들
	public List<FurnitureArrReplyListVO> getFurArrReplyList(int fur_arr_plan_no);

	// 가구배치도 댓글 달기
	public void insertFurnitureArrReply(Map<String, Object> furArrReplyInfo);

	// 가구배치도 댓글 횟수 업
	public int furnitureArrReplyNumUp(int fur_arr_plan_no);

	// 가구배치도 댓글 삭제
	public void deleteFurnitureArrReply(Map<String, Object> furArrReplyInfo);

	// 가구배치도 댓글 횟수 다운
	public int furnitureArrReplyNumDown(int fur_arr_plan_no);

	/////////////////////////////////////////////////////////

	// 가구배치도 좋아요 업
	public void insertFurnitureArrGood(Map<String, Object> furnitureArrGoodInfo);

	// 가구배치도 좋아요 횟수 업
	public int furnitureArrGoodNumUp(int fur_arr_plan_no);

	// 해당 회원의 가구배치도 좋아요 유무
	public int furnitureArrGoodChk(Map<String, Object> furnitureArrGoodInfo);

	// 가구배치도 좋아요 삭제
	public void deleteFurnitureArrGood(Map<String, Object> furnitureArrGoodInfo);

	// 가구배치도 좋아요 횟수 다운
	public int furnitureArrGoodNumDown(int fur_arr_plan_no);

	// 가구배치도 좋아요 회원 목록
	public List<FurnitureArrGoodListVO> getFurArrGoodList(Map<String, Object> furArrGoodInfo);

	// 가구배치도 스크랩 유무 검사
	public int furArrScrapChk(FurnitureArrScrapDTO furnitureArrScrapDTO);

	// 가구배치도 스크랩 하기
	public int insertFurArrScrap(FurnitureArrScrapDTO furnitureArrScrapDTO);
	
	// 가구배치도 스크랩 리스트 --07.26 추가
	public List<Furniture_arrScrapListVO> furArrScrapList(int fur_arr_plan_no);
	
	//가구배치도 상세페이지 끝
	/////////////////////////////////////////////////////////////////////////
	
	//방 종류 가져오기
	public List<String> getRoomKind();
	
	//컨셉 종류 가져오기
	public List<String> getConceptKind();
	
	//가구배치도 작성자를 내가 팔로우 했는지/아닌지
	public int getFollowing(FollowDTO followdto);
	
	//작성자가 나를 팔로우 했는지 확인하기
	public int memFolMe(FollowDTO followdto);
	
}
