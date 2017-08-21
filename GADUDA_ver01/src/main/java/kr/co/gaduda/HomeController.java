package kr.co.gaduda;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.furniture.service.IFurnitureService;
import kr.co.gaduda.furniture.vo.FurnitureVO;
import kr.co.gaduda.furniture_arr.service.IFurniture_arrService;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;
import kr.co.gaduda.member.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private IFurnitureService furnitureService;
	
	@Autowired
	private IFurniture_arrService furniture_arrService;

	//HomePage에 인기 가구와 배치도 가져오기
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String furListView(Model model) {

		List<FurnitureVO> fur_list = furnitureService.furList();
		model.addAttribute("fur_list", fur_list);
		
		List<Furniture_arrVO> fur_arr_list = furniture_arrService.furArrList();
		model.addAttribute("fur_arr_list", fur_arr_list);
		

		return Pages.VIEW_HOME;

	}
	
	//400, 404, 500 error 처리
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String errorView(Model model, HttpServletRequest request) {
		
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		
		if (memVO == null) {
			return Pages.VIEW_NULL_ERROR;
		}
		
		return Pages.VIEW_ERROR;

	}
	
	@RequestMapping(value = "/404error", method = RequestMethod.GET)
	public String error404View(Model model) {
		
		return Pages.VIEW_ERROR_404;

	}
	
}
