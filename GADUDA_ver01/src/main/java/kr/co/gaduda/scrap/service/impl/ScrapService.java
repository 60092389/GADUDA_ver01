package kr.co.gaduda.scrap.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.scrap.dao.impl.ScrapDao;
import kr.co.gaduda.scrap.service.IScrapService;
import kr.co.gaduda.scrap.vo.FurArrBasicVO;
import kr.co.gaduda.scrap.vo.FurArrNoDateVO;
import kr.co.gaduda.scrap.vo.FurArrangementVO;
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
			
			int fur_good_count = furBasicVO.getFur_good_num();
			int fur_reply_count = furBasicVO.getFur_repl_num();
			int fur_scrap_count = scrapDao.furnitureScrapCount(fur_no);
			
			
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


	@Override
	public List<FurArrangementVO> furArrScrapList(String mem_id) {
		
		List<FurArrNoDateVO> fur_arr_no_dateList = new ArrayList<FurArrNoDateVO>();
		
		List<FurArrangementVO> furArrangementList = new ArrayList<FurArrangementVO>();
		
		fur_arr_no_dateList = scrapDao.furArrNo_furArrDate_List(mem_id);
		
		for(int i = 0; i < fur_arr_no_dateList.size(); i++){
			
			FurArrangementVO furArrVO = new FurArrangementVO();
			
			int fur_arr_plan_scrap_no = fur_arr_no_dateList.get(i).getFur_arr_plan_scrap_no();
			int fur_arr_plan_no = fur_arr_no_dateList.get(i).getFur_arr_plan_no();
			String fur_arr_plan_scrap_date = fur_arr_no_dateList.get(i).getFur_arr_plan_scrap_date();
			
			FurArrBasicVO fabVO = scrapDao.fur_arr_scrap_info(fur_arr_plan_no);
			
			String fur_arr_plan_name = fabVO.getFur_arr_name();
			String fur_arr_plan_mem_nickname = fabVO.getMem_nickname();
			String fur_arr_plan_mem_id = fabVO.getMem_id();
			String fur_arr_plan_img_loc = fabVO.getFur_arr_plan_img_loc();
			int fur_arr_plan_good_count = fabVO.getFur_arr_plan_good_num();
			int fur_arr_plan_reply_count = fabVO.getFur_arr_plan_repl_num();
			
			String fur_arr_plan_concepts = "";
			
			List<String> fur_arr_plan_concept = scrapDao.furArrConceptList(fur_arr_plan_no);
			
			for(int j = 0; j < fur_arr_plan_concept.size(); j++){
				fur_arr_plan_concepts = fur_arr_plan_concept.get(j) + " " + fur_arr_plan_concepts;
			}
			
			String fur_arr_plan_room_kind_names = "";
			
			List<String> fur_arr_plan_room_kind_name = scrapDao.furArrRoomKindList(fur_arr_plan_no);
			
			for(int k = 0; k < fur_arr_plan_room_kind_name.size(); k++){
				fur_arr_plan_room_kind_names = 
						fur_arr_plan_room_kind_name.get(k) + " " + fur_arr_plan_room_kind_names;
			}
			
			
			int fur_arr_plan_scrap_count = scrapDao.furArrScrapCount(fur_arr_plan_no);
		
			
			furArrVO.setFur_arr_plan_concepts(fur_arr_plan_concepts);
			furArrVO.setFur_arr_plan_good_count(fur_arr_plan_good_count);
			furArrVO.setFur_arr_plan_img_loc(fur_arr_plan_img_loc);
			furArrVO.setFur_arr_plan_mem_id(fur_arr_plan_mem_id);
			furArrVO.setFur_arr_plan_mem_nickname(fur_arr_plan_mem_nickname);
			furArrVO.setFur_arr_plan_name(fur_arr_plan_name);
			furArrVO.setFur_arr_plan_no(fur_arr_plan_no);
			furArrVO.setFur_arr_plan_reply_count(fur_arr_plan_reply_count);
			furArrVO.setFur_arr_plan_room_kind_names(fur_arr_plan_room_kind_names);
			furArrVO.setFur_arr_plan_scrap_count(fur_arr_plan_scrap_count);
			furArrVO.setFur_arr_plan_scrap_date(fur_arr_plan_scrap_date);
			furArrVO.setFur_arr_plan_scrap_no(fur_arr_plan_scrap_no);
			
			
			furArrangementList.add(furArrVO);
			
		}
		
		
		return furArrangementList;
	}
	
	
	@Override
	public int furArrScrapDelete(int fur_arr_scrap_no) {
		
		return scrapDao.furArrScrapDelete(fur_arr_scrap_no);
	}

}
