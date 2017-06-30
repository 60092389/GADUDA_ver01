package kr.co.gaduda.scrap.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.scrap.dao.impl.ScrapDao;
import kr.co.gaduda.scrap.service.IScrapService;
import kr.co.gaduda.scrap.vo.FurnitureBasicVO;
import kr.co.gaduda.scrap.vo.FurnitureNoDateVO;
import kr.co.gaduda.scrap.vo.FurnitureScrapVO;

@Service
public class ScrapService implements IScrapService {

	@Autowired
	private ScrapDao scrapDao;
	
	@Override
	public List<FurnitureScrapVO> furScrapList(String mem_id) {
		
		List<FurnitureScrapVO> fur_scrapList = new ArrayList<FurnitureScrapVO>();
		
		List<FurnitureNoDateVO> fur_no_dateList = new ArrayList<FurnitureNoDateVO>();


			
		fur_no_dateList = scrapDao.furNo_furDate_List(mem_id);
		
		for(int i=0; i < fur_no_dateList.size(); i++){
			FurnitureBasicVO furBasicVO = new FurnitureBasicVO();
			
			FurnitureScrapVO furScrapVO = new FurnitureScrapVO();
			
			int fur_scrap_no = fur_no_dateList.get(i).getFur_scrap_no();
			int fur_no = fur_no_dateList.get(i).getFur_no();
			String fur_scrap_date = fur_no_dateList.get(i).getFur_scrap_date();
			
			
			//가구사진 경로 가져오기
			String fur_pic_loc = scrapDao.fur_pic_loc_Get(fur_no);
			
			furBasicVO = scrapDao.furniture_basic_info(fur_no);
			
			String fur_name = furBasicVO.getFur_name();
			int fur_price = furBasicVO.getFur_price();
			String fur_brand_name = furBasicVO.getFur_brand_name();
			
			int fur_good_count = scrapDao.furnitureGoodCount(fur_no);
			int fur_scrap_count = scrapDao.furnitureScrapCount(fur_no);
			int fur_reply_count = scrapDao.furnitureReplyCount(fur_no);
			
			furScrapVO.setFur_scrap_no(fur_scrap_no);
			furScrapVO.setFur_brand_name(fur_brand_name);
			furScrapVO.setFur_good_count(fur_good_count);
			furScrapVO.setFur_name(fur_name);
			furScrapVO.setFur_pic_loc(fur_pic_loc);
			furScrapVO.setFur_price(fur_price);
			furScrapVO.setFur_reply_count(fur_reply_count);
			furScrapVO.setFur_scrap_count(fur_scrap_count);
			furScrapVO.setFur_scrap_date(fur_scrap_date);
			
			fur_scrapList.add(furScrapVO);
			
		}
		
		return fur_scrapList;
	}
	
	
	@Override
	public int furScrapDelete(int fur_scrap_no) {
		
		return scrapDao.furnitureScrapDelete(fur_scrap_no);
	}

}
