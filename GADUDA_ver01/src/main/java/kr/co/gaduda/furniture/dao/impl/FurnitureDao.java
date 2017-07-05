package kr.co.gaduda.furniture.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.furniture.dao.IFurnitureDao;
import kr.co.gaduda.furniture.vo.FurnitureVO;

@Repository
public class FurnitureDao implements IFurnitureDao {
	private static final String namespace = "kr.co.gaduda.mapper.furniture.FurnitureMapper";

	@Autowired
	SqlSession fursqlSession;

	@Override
	public FurnitureVO getFurniture(int fur_no) {
		return fursqlSession.selectOne(namespace + ".get_fur_info", fur_no);
	}

	@Override
	public int countFur() {
		return fursqlSession.selectOne(namespace + ".count_fur");
	}

	@Override
	public List<String> fur_pic_loc_Get(int fur_no) {
		return fursqlSession.selectList(namespace + ".fur_pic_loc", fur_no);
	}

	@Override
	public List<String> fur_pic_con_Get(int fur_no) {
		return fursqlSession.selectList(namespace + ".get_fur_con", fur_no);
	}
}
