package kr.co.gaduda.furniture_arr.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.furniture.vo.FurnitureVO;
import kr.co.gaduda.furniture_arr.dao.IFurniture_arrDao;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;


@Repository
public class Furniture_arrDao implements IFurniture_arrDao{
	
	private static final String namespace = "kr.co.gaduda.mapper.furniture_arr.Furniture_arrMapper";

	@Autowired
	SqlSession furarrsqlSession;
	
	public String getTime(){
		return furarrsqlSession.selectOne(namespace+".getTime");
	}
	
	@Override
	public Furniture_arrVO getFurArr(int fur_arr_plan_no){
		return furarrsqlSession.selectOne(namespace+".get_arr_info", fur_arr_plan_no);
	}

	@Override
	public int countFurArr() {
		// TODO Auto-generated method stub
		return furarrsqlSession.selectOne(namespace+".count_fur_arr");
	}

	@Override
	public String getFurCon(int fur_arr_plan_no) {
		// TODO Auto-generated method stub
		return furarrsqlSession.selectOne(namespace+".fur_arr_con", fur_arr_plan_no);
	}

	@Override
	public String getRoomKind(int fur_arr_plan_no) {
		// TODO Auto-generated method stub
		return furarrsqlSession.selectOne(namespace+".fur_arr_room_kind", fur_arr_plan_no);
	}
	
}
