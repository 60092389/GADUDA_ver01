package kr.co.gaduda.furniture.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.furniture.service.IFurnitureService;
import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;

@Controller
@RequestMapping(value="/furniture")
public class FurnitureController {
	@Autowired
	private IFurnitureService furnitureService;

	@RequestMapping(value = URLs.URI_FURNITURE_DETAIL, method = RequestMethod.GET)
	public String furListView(@RequestParam(value="fur_no") int fur_no, Model model) {
		

		FurnitureDetailVO furdeVO = furnitureService.furDetailView(fur_no);
		List<String> furdepic_list = furnitureService.furDetailViewPic(fur_no);
		
		model.addAttribute("furdeVO",furdeVO);
		model.addAttribute("furdepic_list",furdepic_list);
		
		

		return Pages.VIEW_FURNITURE_DETAIL_VIEW;

	}
}
