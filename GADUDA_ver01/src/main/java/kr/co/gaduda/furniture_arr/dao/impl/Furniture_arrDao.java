package kr.co.gaduda.furniture_arr.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.furniture_arr.dao.IFurniture_arrDao;
import kr.co.gaduda.furniture_arr.dto.FurnitureArrScrapDTO;
import kr.co.gaduda.furniture_arr.dto.Furniture_arrDTO;
import kr.co.gaduda.furniture_arr.dto.OtherFurnitureDTO;
import kr.co.gaduda.furniture_arr.vo.Arrangement_furnituresVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrGoodListVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrDetailVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrMemberVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrScrapListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;
import kr.co.gaduda.furniture_arr.vo.Other_Furniture_arrVO;
import kr.co.gaduda.furniture_arr.vo.crawling_furnitureVO;
import kr.co.gaduda.member.dto.FollowDTO;

@Repository
public class Furniture_arrDao implements IFurniture_arrDao {

	private static final String namespace = "kr.co.gaduda.mapper.furniture_arr.Furniture_arrMapper";

	@Autowired
	SqlSession furarrsqlSession;

	@Autowired
	MongoTemplate mongoTemplate;

	@Override
	public List<Furniture_arrVO> getFurArr() {
		return furarrsqlSession.selectList(namespace + ".get_arr_info");
	}

	@Override
	public List<String> FurArrRoomKind(int fur_arr_plan_no) {
		// TODO Auto-generated method stub
		return furarrsqlSession.selectList(namespace + ".fur_arr_room_kind_get", fur_arr_plan_no);
	}

	@Override
	public List<String> getFurCon(int fur_arr_plan_no) {
		// TODO Auto-generated method stub
		return furarrsqlSession.selectList(namespace + ".fur_arr_con", fur_arr_plan_no);
	}

	@Override
	public String getRoomKind(int fur_arr_plan_no) {
		// TODO Auto-generated method stub
		return furarrsqlSession.selectOne(namespace + ".fur_arr_room_kind", fur_arr_plan_no);
	}

	@Override
	public List<Furniture_arrVO> getFurArr_roomkind(String room_kind_def_name) {
		return furarrsqlSession.selectList(namespace + ".get_arr_fur_room_kind", room_kind_def_name);
	}

	// 2017-08-07 추가(수정)
	@Override
	public Furniture_arrMemberVO getFurArrUser(String mem_id) {
		return furarrsqlSession.selectOne(namespace + ".get_for_arrlist_user", mem_id);
	}

	@Override
	public int countFurArr_roomkind(String room_kind_def_name) {
		return furarrsqlSession.selectOne(namespace + ".count_fur_arr_roomkind", room_kind_def_name);
	}

	@Override
	public String getArrFurCon(String room_kind_def_name) {
		return furarrsqlSession.selectOne(namespace + ".get_arr_fur_con", room_kind_def_name);
	}

	@Override
	public int getCountScrap(int fur_arr_plan_no) {
		return furarrsqlSession.selectOne(namespace + ".count_scrap", fur_arr_plan_no);
	}

	@Override
	public List<Furniture_arrVO> getFurArr_concept(String concept_name) {
		return furarrsqlSession.selectList(namespace + ".get_arr_fur_concept", concept_name);
	}

	////////////////////////////////////////////////////////////////////////
	// 가구배치도 상세페이지

	@Override
	public Furniture_arrDetailVO getFurArrDetailBasic(int fur_arr_plan_no) {
		return furarrsqlSession.selectOne(namespace + ".fur_arr_detail_basic", fur_arr_plan_no);
	}

	@Override
	public List<String> getFurArrHashtags(int fur_arr_plan_no) {
		return furarrsqlSession.selectList(namespace + ".fur_arr_hashtag", fur_arr_plan_no);
	}

	@Override
	public List<String> getFurArrConcepts(int fur_arr_plan_no) {
		return furarrsqlSession.selectList(namespace + ".fur_arr_con", fur_arr_plan_no);
	}

	@Override
	public List<String> getFurArrRoomKinds(int fur_arr_plan_no) {
		return furarrsqlSession.selectList(namespace + ".fur_arr_room_kinds", fur_arr_plan_no);
	}

	@Override
	public List<Arrangement_furnituresVO> getFurArrFurniture(int fur_arr_plan_no) {
		return furarrsqlSession.selectList(namespace + ".arr_fur_info", fur_arr_plan_no);
	}

	@Override
	public String getArrFurPic(int fur_no) {
		return furarrsqlSession.selectOne(namespace + ".arr_fur_pic_loc", fur_no);
	}

	@Override
	public List<Other_Furniture_arrVO> getOtherFurArr(OtherFurnitureDTO otherFurnitureDTO) {
		return furarrsqlSession.selectList(namespace + ".other_fur_arr", otherFurnitureDTO);
	}

	// 가구배치도 댓글 관련
	@Override
	public List<FurnitureArrReplyListVO> getFurArrReplyList(int fur_arr_plan_no) {

		String fur_arr_plan_no_str = String.valueOf(fur_arr_plan_no);

		Query query = new Query(new Criteria().andOperator(Criteria.where("fur_arr_plan_no").is(fur_arr_plan_no_str)));

		List<FurnitureArrReplyListVO> list = mongoTemplate.find(query, FurnitureArrReplyListVO.class,
				"furniture_arrangement_reply");


		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getFur_arr_plan_rep_contents());
		}

		return mongoTemplate.find(query, FurnitureArrReplyListVO.class, "furniture_arrangement_reply");

	}

	@Override
	public void insertFurnitureArrReply(Map<String, Object> furArrReplyInfo) {
		mongoTemplate.insert(furArrReplyInfo, "furniture_arrangement_reply");

	}

	@Override
	public int furnitureArrReplyNumUp(int fur_arr_plan_no) {
		return furarrsqlSession.update(namespace + ".uprepl", fur_arr_plan_no);
	}

	@Override
	public void deleteFurnitureArrReply(Map<String, Object> furArrReplyInfo) {

		Query query = new Query(new Criteria().andOperator(Criteria.where("_id").is(furArrReplyInfo.get("_id"))));

		mongoTemplate.remove(query, "furniture_arrangement_reply");
	}

	@Override
	public int furnitureArrReplyNumDown(int fur_arr_plan_no) {
		return furarrsqlSession.update(namespace + ".downrepl", fur_arr_plan_no);
	}

	// 가구배치도 댓글 끝

	// 가구배치도 좋아요 기능
	@Override
	public void insertFurnitureArrGood(Map<String, Object> furnitureArrGoodInfo) {
		mongoTemplate.insert(furnitureArrGoodInfo, "furniture_arrangement_good");

	}

	@Override
	public int furnitureArrGoodNumUp(int fur_arr_plan_no) {

		return furarrsqlSession.update(namespace + ".upgood", fur_arr_plan_no);
	}

	@Override
	public int furnitureArrGoodChk(Map<String, Object> furnitureArrGoodInfo) {
		int result = 0;

		Query query = new Query(new Criteria().andOperator(
				Criteria.where("fur_arr_plan_no").is(furnitureArrGoodInfo.get("fur_arr_plan_no")),
				Criteria.where("mem_id").is(furnitureArrGoodInfo.get("mem_id"))));
		result = (int) mongoTemplate.count(query, "furniture_arrangement_good");


		return result;
	}

	@Override
	public void deleteFurnitureArrGood(Map<String, Object> furnitureArrGoodInfo) {
		Query query = new Query(new Criteria().andOperator(
				Criteria.where("fur_arr_plan_no").is(furnitureArrGoodInfo.get("fur_arr_plan_no")),
				Criteria.where("mem_id").is(furnitureArrGoodInfo.get("mem_id"))));
		mongoTemplate.remove(query, "furniture_arrangement_good");
	}

	@Override
	public int furnitureArrGoodNumDown(int fur_arr_plan_no) {
		return furarrsqlSession.update(namespace + ".downgood", fur_arr_plan_no);
	}

	@Override
	public List<FurnitureArrGoodListVO> getFurArrGoodList(Map<String, Object> furArrGoodInfo) {

		Query query = new Query(new Criteria()
				.andOperator(Criteria.where("fur_arr_plan_no").is(furArrGoodInfo.get("fur_arr_plan_no"))));

		return mongoTemplate.find(query, FurnitureArrGoodListVO.class, "furniture_arrangement_good");
	}

	// 가구배치도 좋아요 기능 끝
	//////////////////////////////////////////////////

	// 가구배치도 스크랩

	@Override
	public int furArrScrapChk(FurnitureArrScrapDTO furnitureArrScrapDTO) {
		return furarrsqlSession.selectOne(namespace + ".fur_arr_scrap_chk", furnitureArrScrapDTO);
	}

	@Override
	public int insertFurArrScrap(FurnitureArrScrapDTO furnitureArrScrapDTO) {
		return furarrsqlSession.insert(namespace + ".fur_arr_plan_scrap", furnitureArrScrapDTO);
	}

	// 가구 스크랩 리스트 가져오기 --07.26
	@Override
	public List<Furniture_arrScrapListVO> furArrScrapList(int fur_arr_plan_no) {
		return furarrsqlSession.selectList(namespace + ".fur_arr_scrap_list", fur_arr_plan_no);
	}

	// 가구 배치도 스크랩 끝

	// 가구 방 종류 가져오기
	@Override
	public List<String> getRoomKind() {
		return furarrsqlSession.selectList(namespace + ".get_room_kind");
	}

	// 가구 방 컨셉 가져오기
	@Override
	public List<String> getConceptKind() {
		return furarrsqlSession.selectList(namespace + ".get_concept_kind");
	}

	// 가구배치도 작성자를 내가 팔로우 했는지/아닌지
	@Override
	public int getFollowing(FollowDTO followdto) {
		return furarrsqlSession.selectOne(namespace + ".get_following", followdto);
	}

	// 작성자가 나를 팔로우 했는지 확인하기
	@Override
	public int memFolMe(FollowDTO followdto) {
		return furarrsqlSession.selectOne(namespace + ".mem_fol_me", followdto);
	}

	@Override
	public List<crawling_furnitureVO> getCrawling_fur(Furniture_arrDTO faDTO) {
		// String fur_kind = faDTO.getFur_concept().trim();

		String fur_kind = faDTO.getFur_kind().trim();
		String fur_concept = faDTO.getFur_concept().trim();
		
		
		System.out.println("furkind : " + fur_kind);
		System.out.println("fur_concept : " + fur_concept);
		
		int max_fur_width = faDTO.getMax_fur_width();
		int min_fur_width = faDTO.getMin_fur_width();
		int max_fur_depth = faDTO.getMax_fur_depth();
		int min_fur_depth = faDTO.getMin_fur_depth();
		int max_fur_height = faDTO.getMax_fur_height();
		int min_fur_height = faDTO.getMin_fur_height();

		Criteria cri = new Criteria("craw_fur_kind_name");
		cri.regex(fur_kind);

		cri.andOperator(new Criteria("craw_fur_size.0").gte(min_fur_width).lte(max_fur_width),
				new Criteria("craw_fur_size.1").gte(min_fur_depth).lte(max_fur_depth),
				new Criteria("craw_fur_size.2").gte(min_fur_height).lte(max_fur_height),
				new Criteria("craw_fur_size").ne(""),
				new Criteria("craw_fur_concpet_name").regex(fur_concept));
		
		Query query = new Query(cri);
		query.limit(10);
		
		return mongoTemplate.find(query, crawling_furnitureVO.class, "crawling_furniture");
	}

	// 2017.08.11 HashTagSearch Sujung
	public List<Integer> searchHashTag(String hashtag_name) {
		return furarrsqlSession.selectList(namespace + ".search_hashTag", hashtag_name);
	}

	public Furniture_arrVO getFurArrHashTag(int fur_arr_plan_no) {
		return furarrsqlSession.selectOne(namespace + ".get_arr_info_hash", fur_arr_plan_no);
	}
	
	@Override
	public String getFurArrWriter(int fur_arr_plan_no) {
		
		return furarrsqlSession.selectOne(namespace + ".get_fur_arr_writer", fur_arr_plan_no);
	}

}
