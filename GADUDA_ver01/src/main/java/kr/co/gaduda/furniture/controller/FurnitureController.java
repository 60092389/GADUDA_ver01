package kr.co.gaduda.furniture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import kr.co.gaduda.furniture.service.IFurnitureService;
import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture.vo.FurnitureReplyListVO;
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
	
	////////////////////////////////////////////////////////////
	//가구 구경 페이지 컨트롤러
	
	@RequestMapping(value=URLs.URI_FURNITURE_LIST_LOOKAROUND_GET, method = RequestMethod.GET)
	public String furLookAroundListView(@RequestParam(value="room_kind_def_name", required=false)String room_kind_def_name, 
			@RequestParam(value="concept_name", required=false)String concept_name,
			@RequestParam(value="fur_kind_def_name", required=false)String fur_kind_def_name,
			@RequestParam(value="array_option", required=false)String array_option,
			Model model, HttpServletRequest request){
		
		

		List<FurnitureListViewVO> furList 
			= furnitureService.furnitureList(room_kind_def_name, concept_name, fur_kind_def_name,
						array_option, request);
		
		for(int i=0; i<furList.size(); i++){
			System.out.println(furList.get(i).toString());
		}
		model.addAttribute("furList", furList);
		
		
		return Pages.VIEW_FURNITURE_LIST;
	}
	
	
	@RequestMapping(value=URLs.URI_FURNITURE_GOOD_UP, method=RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> furnitureGoodInsert(@RequestBody Map<String, Object> furnitureGoodInfo){
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		
		int result = furnitureService.furnitureGood(furnitureGoodInfo);
		
		String resultStr = "";
		
		if(result == 1){
			resultStr = "좋아요 성공";
		}else if(result == 2){
			resultStr = "좋아요 취소 성공";
		}
		
		retVal.put("val", resultStr);
		
		return retVal;
	}
	
	@RequestMapping(value=URLs.URI_FURNITURE_REPLY_WRITE, method=RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> furnitureReplyInsert(@RequestBody Map<String, Object> furnitureReplyInfo){
		
		furnitureService.insertFurnitureReply(furnitureReplyInfo);
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		retVal.put("val", 1);
		
		return retVal;
	}
	
	
	@RequestMapping(value=URLs.URI_FURNITURE_REPLY_LIST, method=RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> furnitureReplyList(@RequestBody Map<String, Object> furnitureReplyInfo){
		
		List<FurnitureReplyListVO> list = furnitureService.listFurnitureReply(furnitureReplyInfo);
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		retVal.put("replyList", list);
		
		
		return retVal;
	}
	
	
	@RequestMapping(value=URLs.URI_FURNITURE_REPLY_DELETE, method=RequestMethod.POST, produces = {"application/json"})
	public @ResponseBody Map<String, Object> furnitureReplyDelete(
					@RequestBody Map<String, Object> furnitureReplyDeleteInfo){
		
		furnitureService.deleteFurnitureReply(furnitureReplyDeleteInfo);
		Map<String, Object> retDeleteVal = new HashMap<String, Object>();
		retDeleteVal.put("val", 1);
		
		return retDeleteVal;
	}
	//가구 구경 
	//////////////////////////////////////////////////////////////////////
}
