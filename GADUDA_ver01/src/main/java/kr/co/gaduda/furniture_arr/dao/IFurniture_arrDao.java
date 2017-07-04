package kr.co.gaduda.furniture_arr.dao;

import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;

public interface IFurniture_arrDao {
	public Furniture_arrVO getFurArr(int fur_arr_plan_no);
	public int countFurArr();
	public String getFurCon(int fur_arr_plan_no);
	public String getRoomKind(int fur_arr_plan_no);
}
