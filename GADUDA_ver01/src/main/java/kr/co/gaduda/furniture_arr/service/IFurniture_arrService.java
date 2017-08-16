package kr.co.gaduda.furniture_arr.service;

import java.util.List;
import java.util.Map;

import kr.co.gaduda.furniture_arr.vo.Arrangement_furnituresVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrGoodListVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrDetailVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrScrapListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;
import kr.co.gaduda.furniture_arr.vo.crawling_furnitureVO;
import kr.co.gaduda.member.dto.FollowDTO;

public interface IFurniture_arrService {
	public List<Furniture_arrVO> furArrList();
	
	public List<Furniture_arrVO> furArrList_roomkind(String room_kind_def_name);
	public List<Furniture_arrVO> furArrList_concept(String concept_name);
	public List<Furniture_arrVO> furArrList_roomkind_concept(String room_kind_def_name,String concept_name);
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
	
	//가구배치도 스크랩 리스트 --07.26
	public List<Furniture_arrScrapListVO> furArrScrapList(int fur_arr_plan_no);
	
	//가구 방 종류 가져오기
	public List<String> getRoomKind();
	
	//가구 방 컨셉 가져오기
	public List<String> getConceptKind();
	
	//가구배치도 작성자를 내가 팔로우 했는지/아닌지
	public int getFollowing(FollowDTO followdto);
	
	//작성자가 나를 팔로우 했는지 확인하기
	public int memFolMe(FollowDTO followdto);
	
	public List<crawling_furnitureVO> craw_fur_list(int fur_no);
	
	//2017.08.11 HashTagSearch Sujung
	public List<Integer> searchHashTag(String hashtag_name);
	public Furniture_arrVO getFurArrHashTag(int fur_arr_plan_no);
	
}
