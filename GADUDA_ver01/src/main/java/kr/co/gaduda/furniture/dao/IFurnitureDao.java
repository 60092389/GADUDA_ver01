package kr.co.gaduda.furniture.dao;

import java.util.List;

import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;

public interface IFurnitureDao {
	public FurnitureVO getFurniture(int fur_no);
	public FurnitureDetailVO getDetailFurniture(int fur_no);
	public int countFur();
	public List<String> fur_pic_loc_Get(int fur_no);
	public List<String> fur_pic_con_Get(int fur_no);
	public List<String> fur_pic_kind_Get(int fur_no);
}
