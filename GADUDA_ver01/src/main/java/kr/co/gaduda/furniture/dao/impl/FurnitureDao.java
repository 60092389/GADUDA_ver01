package kr.co.gaduda.furniture.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.furniture.dao.IFurnitureDao;
import kr.co.gaduda.furniture.dto.FurnitureCateDTO;
import kr.co.gaduda.furniture.dto.FurnitureScrapDTO;
import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureGoodListVO;
import kr.co.gaduda.furniture.vo.FurnitureItemVO;
import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture.vo.FurnitureReplyListVO;
import kr.co.gaduda.furniture.vo.FurnitureScrapListVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;

@Repository
public class FurnitureDao implements IFurnitureDao {
	private static final String namespace = "kr.co.gaduda.mapper.furniture.FurnitureMapper";

	@Autowired
	SqlSession sqlSession;

	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public List<FurnitureVO> getFurniture() {
		return sqlSession.selectList(namespace + ".get_fur_info");
	}

	@Override
	public FurnitureDetailVO getDetailFurniture(int fur_no) {
		return sqlSession.selectOne(namespace + ".get_fur_info_detail", fur_no);
	}

	@Override
	public int countFur() {
		return sqlSession.selectOne(namespace + ".count_fur");
	}

	@Override
	public List<String> fur_pic_loc_Get(int fur_no) {
		return sqlSession.selectList(namespace + ".fur_pic_loc", fur_no);
	}

	@Override
	public List<FurnitureReplyListVO> FurnitureReplList(int fur_no) {

		String fur_no_str = String.valueOf(fur_no);

		Query query = new Query(new Criteria().andOperator(Criteria.where("fur_no").is(fur_no_str)));

		return mongoTemplate.find(query, FurnitureReplyListVO.class, "furniture_reply");
	}

	@Override
	public List<String> fur_pic_con_Get(int fur_no) {
		return sqlSession.selectList(namespace + ".get_fur_con", fur_no);
	}

	@Override
	public List<String> fur_pic_kind_Get(int fur_no) {
		return sqlSession.selectList(namespace + ".get_fur_kind", fur_no);
	}

	@Override
	public List<FurnitureListViewVO> getFurBasicList(FurnitureCateDTO furCateDTO) {
		return sqlSession.selectList(namespace + ".furniture_list_info", furCateDTO);
	}

	@Override
	public String getFurPicLoc(int fur_no) {
		return sqlSession.selectOne(namespace + ".fur_pic_loc_one", fur_no);
	}

	@Override
	public int getFurScrapCount(int fur_no) {
		return sqlSession.selectOne(namespace + ".furniture_scrap_count", fur_no);
	}

	@Override
	public int furnitureGoodChk(Map<String, Object> furnitureGoodInfo) {

		int result = 0;

		Query query = new Query(new Criteria().andOperator(Criteria.where("fur_no").is(furnitureGoodInfo.get("fur_no")),
				Criteria.where("mem_id").is(furnitureGoodInfo.get("mem_id"))));
		result = (int) mongoTemplate.count(query, "furniture_good");

		System.out.println("furnitureGoodChk 갯수확인 : " + result);

		// System.out.println("해당 가구의 좋아요 눌렀는지 여부"+mongoTemplate.find(query,
		// Integer, "furniture_good"));

		return result;
	}

	@Override
	public void insertFurnitureGood(Map<String, Object> furnitureGoodInfo) {

		mongoTemplate.insert(furnitureGoodInfo, "furniture_good");
	}

	@Override
	public int furnitureGoodNumUp(int fur_no) {
		return sqlSession.update(namespace + ".fur_good_num_up", fur_no);
	}

	@Override
	public void deleteFurnitureGood(Map<String, Object> furnitureGoodInfo) {
		Query query = new Query(new Criteria().andOperator(Criteria.where("fur_no").is(furnitureGoodInfo.get("fur_no")),
				Criteria.where("mem_id").is(furnitureGoodInfo.get("mem_id"))));
		mongoTemplate.remove(query, "furniture_good");
		System.out.println("좋아요 삭제 성공!");

	}

	@Override
	public int furnitureGoodNumDown(int fur_no) {

		return sqlSession.update(namespace + ".fur_good_num_down", fur_no);
	}

	@Override
	public void insertFurnitureReply(Map<String, Object> furnitureReplyInfo) {

		mongoTemplate.insert(furnitureReplyInfo, "furniture_reply");

	}

	@Override
	public int furnitureReplyNumUp(int fur_no) {
		return sqlSession.update(namespace + ".fur_reply_num_up", fur_no);
	}

	@Override
	public List<FurnitureReplyListVO> listFurnitureReply(Map<String, Object> furnitureReplyInfo) {

		System.out.println("dao의 fur_no : " + furnitureReplyInfo.get("fur_no"));

		Query query = new Query(
				new Criteria().andOperator(Criteria.where("fur_no").is(furnitureReplyInfo.get("fur_no"))));

		return mongoTemplate.find(query, FurnitureReplyListVO.class, "furniture_reply");
	}

	@Override
	public void deleteFurnitureReply(Map<String, Object> furnitureReplyDeleteInfo) {
		Query query = new Query(
				new Criteria().andOperator(Criteria.where("_id").is(furnitureReplyDeleteInfo.get("_id"))));
		mongoTemplate.remove(query, "furniture_reply");
		System.out.println("댓글 삭제 완료");
	}

	@Override
	public int furnitureReplyNumDown(int fur_no) {
		return sqlSession.update(namespace + ".fur_reply_num_down", fur_no);
	}

	// 가구 좋아요 리스트 불러오기
	@Override
	public List<FurnitureGoodListVO> getFurGoodList(Map<String, Object> search) {

		Query query = new Query(new Criteria().andOperator(Criteria.where("fur_no").is(search.get("goodfurno"))));

		return mongoTemplate.find(query, FurnitureGoodListVO.class, "furniture_good");

	}

	// 가구 스크랩 하기
	@Override
	public int furScrapChk(FurnitureScrapDTO furnitureScrapDTO) {
		return sqlSession.selectOne(namespace + ".fur_scrap_chk", furnitureScrapDTO);
	}

	@Override
	public int furScrap(FurnitureScrapDTO furnitureScrapDTO) {
		int result;
		try {
			result = sqlSession.insert(namespace + ".fur_scrap", furnitureScrapDTO);
		} catch (Exception e) {
			result = 0;
		}
		return result;
	}

	@Override
	public List<FurnitureScrapListVO> furScrapList(int fur_no) {
		return sqlSession.selectList(namespace + ".fur_scrap_list", fur_no);
	}

	// 가구 방 종류 가져오기
	@Override
	public List<String> getRoomKind() {
		return sqlSession.selectList(namespace + ".get_room_kind");
	}

	// 가구 방 컨셉 가져오기
	@Override
	public List<String> getConceptKind() {
		return sqlSession.selectList(namespace + ".get_concept_kind");
	}

	// 가구 종류 가져오기
	public List<String> getFurDefKind() {
		return sqlSession.selectList(namespace + ".get_fur_def_kind");
	}
	
	//방 종류에 따라 가구 가져오기
	public List<String> getFurNameForRoom(String room_kind_def_name) {
		return sqlSession.selectList(namespace + ".get_fur_name_for_room", room_kind_def_name);
	}
	
	//가구 상세보기 페이지 가구 아이템 이름이랑 사이즈 가져오기
	public FurnitureItemVO getFurItem(int fur_no){
		return sqlSession.selectOne(namespace+".get_fur_item", fur_no);
	}
}
