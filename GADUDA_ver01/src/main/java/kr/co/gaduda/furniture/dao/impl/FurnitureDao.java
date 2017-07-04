package kr.co.gaduda.furniture.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.furniture.dao.IFurnitureDao;
import kr.co.gaduda.furniture.vo.FurnitureVO;

@Repository
public class FurnitureDao implements IFurnitureDao{
private static final String namespace = "kr.co.gaduda.mapper.furniture.FurnitureMapper";
	
	@Autowired
	SqlSession fursqlSession;
	
	public String getTime(){
		return fursqlSession.selectOne(namespace+".getTime");
	}
	public int priceFur(){
		return fursqlSession.selectOne(namespace+".example");
	}
	
	@Override
	public FurnitureVO getFurniture(int fur_no){
		return fursqlSession.selectOne(namespace+".get_fur_info", fur_no);
	}
	@Override
	public int countFur() {
		return fursqlSession.selectOne(namespace+".count_fur");
	}
	
	@Override
	public String fur_pic_loc_Get(int fur_no) {
		return fursqlSession.selectOne(namespace + ".fur_pic_loc", fur_no);
	}
}
