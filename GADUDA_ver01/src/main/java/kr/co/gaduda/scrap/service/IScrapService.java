package kr.co.gaduda.scrap.service;

import java.util.List;

import kr.co.gaduda.scrap.vo.FurnitureScrapVO;

public interface IScrapService {

	//가구스크랩리스트에 가져갈 가구스크랩정보
	public List<FurnitureScrapVO> furScrapList(String mem_id);
	//가구스크랩 삭제
	public int furScrapDelete(int fur_scrap_no);
	
}
