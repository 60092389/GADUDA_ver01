package kr.co.gaduda.scrap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.scrap.service.impl.ScrapService;
import kr.co.gaduda.scrap.vo.FurArrangementVO;
import kr.co.gaduda.scrap.vo.FurnitureScrapVO;

@Controller
@RequestMapping(value="/mypage")
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
	@RequestMapping(value=URLs.URI_FURNITURE_SCRAP_DELETE, method = RequestMethod.GET)
	public String furnitureScrapDelete(@RequestParam(value="fur_scrap_no")int fur_scrap_no, 
					Model model){
		
		
		System.out.println("스크랩삭제 컨트롤러");
		
		int result = scrapService.furScrapDelete(fur_scrap_no);
		
		if(result == 1){
			System.out.println("삭제성공");
		}else{
			System.out.println("삭제실패");
		}
		
		model.addAttribute("mem_id", "user01");
		
		return null;
	}
	
	
	//가구배치도 스크랩 리스트 뷰로
	@RequestMapping(value=URLs.URI_FURNITURE_ARR_SCRAP, method = RequestMethod.GET)
	public String furnitureArrScrapList(@RequestParam(value="mem_id")String mem_id,
							Model model){
		
		List<FurArrangementVO> fur_arr_scrap_list = scrapService.furArrScrapList(mem_id);
		model.addAttribute("fur_arr_scrap_list", fur_arr_scrap_list);
		
		return Pages.VIEW_FURNITURE_ARR_SCRAP_LIST;
	}
	
	@RequestMapping(value=URLs.URI_FURNITURE_ARR_SCRAP_DELETE, method = RequestMethod.GET)
	public String furArrScrapDelete(@RequestParam(value="fur_arr_scrap_no")int fur_arr_scrap_no,
					Model model){
		int result = scrapService.furArrScrapDelete(fur_arr_scrap_no);
		
		if(result == 1){
			System.out.println("삭제 성공");
		}else{
			System.out.println("삭제 실패");
		}
		
		return null;
	}
	
	

}
