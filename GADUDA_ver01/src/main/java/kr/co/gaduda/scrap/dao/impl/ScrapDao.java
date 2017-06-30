package kr.co.gaduda.scrap.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.furniture.vo.FurnitureVO;
import kr.co.gaduda.scrap.dao.IScrapDao;
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
	public int furnitureGoodCount(int fur_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int furnitureReplyCount(int fur_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int furnitureScrapDelete(int fur_scrap_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + ".furniture_scrap_delete", fur_scrap_no);
	}	

}
