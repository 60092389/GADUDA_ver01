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
		System.out.println("dao 들어옴");
		return fursqlSession.selectOne(namespace+".getTime");
	}
	public int priceFur(){
		System.out.println("가구가격");
		return fursqlSession.selectOne(namespace+".example");
	}
	
	@Override
	public FurnitureVO getFurniture(int fur_no){
		System.out.println("furniture불러오기");
		return fursqlSession.selectOne(namespace+".get_fur_info", fur_no);
	}
	@Override
	public int countFur() {
		System.out.println("가구 갯수");
		return fursqlSession.selectOne(namespace+".count_fur");
	}
	
	@Override
	public String fur_pic_loc_Get(int fur_no) {
		return fursqlSession.selectOne(namespace + ".fur_pic_loc", fur_no);
	}
}
