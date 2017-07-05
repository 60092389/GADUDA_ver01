package kr.co.gaduda.furniture_arr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.furniture_arr.service.IFurniture_arrService;
import kr.co.gaduda.furniture_arr.service.impl.Furniture_arrService;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;

@Controller
@RequestMapping(value=URLs.URI_MAIN_TO_WATCH)
public class Furniture_arrController {
	
	@Autowired
	private IFurniture_arrService furniture_arrService;
	
	@RequestMapping(value=URLs.URI_FURNITURE_WATCH)
	public String furnifure_arr_watch(Model model){
		List<Furniture_arrVO> fur_arr_list= furniture_arrService.furArrList();
		model.addAttribute("fur_arr_list",fur_arr_list);
		
		return Pages.VIEW_FURNITURE_WATCH_VIEW;
	}
	
}
