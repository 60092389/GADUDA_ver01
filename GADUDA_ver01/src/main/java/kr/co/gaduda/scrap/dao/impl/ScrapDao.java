package kr.co.gaduda.scrap.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.furniture.vo.FurnitureVO;
import kr.co.gaduda.scrap.dao.IScrapDao;
import kr.co.gaduda.scrap.vo.FurArrBasicVO;
import kr.co.gaduda.scrap.vo.FurArrNoDateVO;
import kr.co.gaduda.scrap.vo.FurnitureBasicVO;
import kr.co.gaduda.scrap.vo.FurnitureNoDateVO;

@Repository
public class ScrapDao implements IScrapDao{
	
	private static final String namespace = "kr.co.gaduda.mapper.scrap.ScrapMapper";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<FurnitureNoDateVO> furNo_furDate_List(String mem_id) {

		System.out.println("scrapdao 들어옴");
		return sqlSession.selectList(namespace + ".furniture_scrap_furniture_no", mem_id);
	}

	@Override
	public FurnitureBasicVO furniture_basic_info(int fur_no) {
		return sqlSession.selectOne(namespace + ".furniture_basic_info", fur_no);
	}
	
	@Override
	public String fur_pic_loc_Get(int fur_no) {
		return sqlSession.selectOne(namespace + ".fur_pic_loc", fur_no);
	}

	@Override
	public int furnitureScrapCount(int fur_no) {
		return sqlSession.selectOne(namespace + ".furniture_scrap_count", fur_no);
	}


	@Override
	public int furnitureScrapDelete(int fur_scrap_no) {
		return sqlSession.delete(namespace + ".furniture_scrap_delete", fur_scrap_no);
	}

	
	@Override
	public List<FurArrNoDateVO> furArrNo_furArrDate_List(String mem_id) {
		return sqlSession.selectList(namespace + ".fur_arr_scrap_list", mem_id);
	}

	
	@Override
	public FurArrBasicVO fur_arr_scrap_info(int fur_arr_plan_no) {
		return sqlSession.selectOne(namespace + ".fur_arr_scrap_info", fur_arr_plan_no);
	}

	@Override
	public List<String> furArrConceptList(int fur_arr_plan_no) {
		return sqlSession.selectList(namespace + ".fur_arr_concept", fur_arr_plan_no);
	}

	@Override
	public List<String> furArrRoomKindList(int fur_arr_plan_no) {
		return sqlSession.selectList(namespace + ".fur_arr_room_kind", fur_arr_plan_no);
	}

	@Override
	public int furArrScrapCount(int fur_arr_plan_no) {
		return sqlSession.selectOne(namespace + ".fur_arr_scrap_count", fur_arr_plan_no);
	}

	
	@Override
	public int furArrScrapDelete(int fur_arr_scrap_no) {
			return sqlSession.delete(namespace + ".furniture_arr_scrap_delete", fur_arr_scrap_no);
	}

}
