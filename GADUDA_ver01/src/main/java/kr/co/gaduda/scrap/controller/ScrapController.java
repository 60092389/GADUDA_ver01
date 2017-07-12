package kr.co.gaduda.scrap.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.scrap.service.impl.ScrapService;
import kr.co.gaduda.scrap.vo.FurArrangementVO;
import kr.co.gaduda.scrap.vo.FurnitureScrapVO;

@Controller
@RequestMapping(value="/mypage/scrap")
public class ScrapController {
	
	@Autowired
	private ScrapService scrapService;
	
	
	//가구스크랩리스트 뷰로
	@RequestMapping(value=URLs.URI_FURNITURE_SCRAP, method = RequestMethod.GET)
	public String funitureScrapList(@RequestParam(value="mem_id")String mem_id,
								Model model){
		
		System.out.println("스크랩컨트롤러"); 
		
		List<FurnitureScrapVO> fur_scrap_list = scrapService.furScrapList(mem_id);
		
		model.addAttribute("fur_scrap_list", fur_scrap_list);
		
		return Pages.VIEW_FURNITURE_SCRAP_LIST;
		
	}
	

	//가구스크랩 삭제
	@RequestMapping(value=URLs.URI_FURNITURE_SCRAP_DELETE, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> furnitureScrapDelete(
			@RequestBody Map<String, Object> deleteInfo){
		 
		
		System.out.println("스크랩삭제 컨트롤러" + deleteInfo.get("fur_scrap_no"));
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		int fur_scrap_no_int = Integer.parseInt((String)deleteInfo.get("fur_scrap_no"));
		
		int result = scrapService.furScrapDelete(fur_scrap_no_int);
		
		if(result == 1){
			System.out.println("삭제성공");
			retVal.put("resultNum", result);
		}else{
			System.out.println("삭제실패");
			retVal.put("resultNum", result);
		}
		
		return retVal;
	}
	
	
	
	
	//가구배치도 스크랩 리스트 뷰로
	@RequestMapping(value=URLs.URI_FURNITURE_ARR_SCRAP, method = RequestMethod.GET)
	public String furnitureArrScrapList(@RequestParam(value="mem_id")String mem_id,
							Model model){
		
		List<FurArrangementVO> fur_arr_scrap_list = scrapService.furArrScrapList(mem_id);
		model.addAttribute("fur_arr_scrap_list", fur_arr_scrap_list);
		
		return Pages.VIEW_FURNITURE_ARR_SCRAP_LIST;
	}
	
	//가구배치도 스크랩 삭제
	@RequestMapping(value=URLs.URI_FURNITURE_ARR_SCRAP_DELETE, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> furArrScrapDelete(
			@RequestBody Map<String, Object> deleteInfo){
		System.out.println("스크랩삭제 컨트롤러" + deleteInfo.get("fur_arr_scrap_no"));
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		int fur_arr_scrap_no_int = Integer.parseInt((String)deleteInfo.get("fur_arr_scrap_no"));
		
		int result = scrapService.furArrScrapDelete(fur_arr_scrap_no_int);
		
		if(result == 1){
			System.out.println("삭제성공");
			retVal.put("resultNum", result);
		}else{
			System.out.println("삭제실패");
			retVal.put("resultNum", result);
		}
		
		return retVal;
	}
	


}
