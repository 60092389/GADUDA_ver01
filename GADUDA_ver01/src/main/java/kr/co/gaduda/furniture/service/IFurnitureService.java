package kr.co.gaduda.furniture.service;

import java.util.List;

import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;

public interface IFurnitureService {
	public List<FurnitureVO> furList();
	public FurnitureDetailVO furDetailView(int fur_no);
	public List<String> furDetailViewPic(int fur_no);
}
