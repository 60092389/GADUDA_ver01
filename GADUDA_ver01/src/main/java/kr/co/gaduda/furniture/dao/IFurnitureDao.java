package kr.co.gaduda.furniture.dao;

import kr.co.gaduda.furniture.vo.FurnitureVO;

public interface IFurnitureDao {
	public FurnitureVO getFurniture(int fur_no);
	public int countFur();
	public String fur_pic_loc_Get(int fur_no);
}
