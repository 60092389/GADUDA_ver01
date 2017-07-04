package kr.co.gaduda;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.gaduda.furniture.service.IFurnitureService;
import kr.co.gaduda.furniture.vo.FurnitureVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private IFurnitureService furser;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String furListView(Model model) {
		System.out.println("Main Controller");

		List<FurnitureVO> fur_list = furser.furList();
		model.addAttribute("fur_list", fur_list);
		System.out.println(fur_list);

		return "main";

	}
	
}
