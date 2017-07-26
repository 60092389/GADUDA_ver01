package kr.co.gaduda.furniture_arr.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import kr.co.gaduda.furniture_arr.service.IFurniture_arrService;
import kr.co.gaduda.furniture_arr.service.impl.Furniture_arrService;
import kr.co.gaduda.furniture_arr.vo.Arrangement_furnituresVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrGoodListVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrDetailVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrScrapListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;

@Controller
@RequestMapping(value="/furniture_arr")
public class Furniture_arrController {
	
	@Autowired
	private IFurniture_arrService furniture_arrService;
	
	@RequestMapping(value=URLs.URI_FURNITURE_WATCH, method=RequestMethod.GET)
	public String furnifure_arr_watch(@RequestParam(value="room_kind_def_name",required=false)String room_kind_def_name,
			@RequestParam(value="concept_name",required=false)String concept_name,
			Model model){
	
		if((room_kind_def_name==null||room_kind_def_name.equals("0")) && (concept_name==null||concept_name.equals("0"))){
		List<Furniture_arrVO> fur_arr_list= furniture_arrService.furArrList();
		model.addAttribute("fur_arr_list",fur_arr_list);
		
		model.addAttribute("fur_arr_list",fur_arr_list);
		}else if(room_kind_def_name!=null && (concept_name==null||concept_name.equals("0"))){
			List<Furniture_arrVO> fur_arr_list_roomkind = furniture_arrService.furArrList_roomkind(room_kind_def_name);
			
			model.addAttribute("fur_arr_list",fur_arr_list_roomkind);
			
		}else if((room_kind_def_name==null||room_kind_def_name.equals("0"))&&concept_name!=null){
			List<Furniture_arrVO> fur_arr_list_concept =furniture_arrService.furArrList_concept(concept_name);
			
			model.addAttribute("fur_arr_list",fur_arr_list_concept);
		}else{
			List<Furniture_arrVO> fur_arr_list_roomkind_concept = furniture_arrService.furArrList_roomkind_concept(room_kind_def_name, concept_name);
			model.addAttribute("fur_arr_list",fur_arr_list_roomkind_concept);
		}
		
		return Pages.VIEW_FURNITURE_WATCH_VIEW;
	}
	
	
	//가구배치도 상세페이지로 이동
	@RequestMapping(value=URLs.URI_FURNITURE_ARR_DETAIL_VIEW)
	public String furnitureDetailInfo(int fur_arr_plan_no, Model model){
		
		Furniture_arrDetailVO detailVO = furniture_arrService.getFurArrDetailInfo(fur_arr_plan_no);
		
		List<Arrangement_furnituresVO> arr_fur = furniture_arrService.getFurArrFurniture(fur_arr_plan_no);
		
		List<FurnitureArrReplyListVO> fur_arr_reply_list = furniture_arrService.getFurArrReplyList(fur_arr_plan_no);
		
		model.addAttribute("detailVO", detailVO);
		model.addAttribute("arr_fur", arr_fur);
		model.addAttribute("reply_list", fur_arr_reply_list);
		
		return Pages.VIEW_FURNITURE_ARR_DETAIL;
	}
	
	
	@RequestMapping(value = URLs.URI_FURNITURE_ARR_REPLY_WRITE, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> furnitureArrReplyInsert(
			@RequestBody Map<String, Object> furArrReplyInfo){
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		int result = furniture_arrService.insertFurnitureArrReply(furArrReplyInfo);
			
		retVal.put("result", result);
		
		return retVal;
	}
	
	@RequestMapping(value = URLs.URI_FURNITURE_ARR_REPLY_DELETE, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> furnitureArrReplyDelete(
			@RequestBody Map<String, Object> furArrReplyInfo){
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		int result = furniture_arrService.deleteFurnitureArrReply(furArrReplyInfo);
			
		retVal.put("result", result);
		
		return retVal;
	}
	
	
	
	//가구배치도 상세페이지에서 좋아요 누르기
	@RequestMapping(value = URLs.URI_FURNITURE_ARR_GOOD_UP, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> furnitureArrGoodInsert(
			@RequestBody Map<String, Object> furnitureArrGoodInfo){
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		int result = furniture_arrService.furnitureArrGood(furnitureArrGoodInfo);
		
		String resultStr = "";
		
		
		if(result == 1){
			resultStr = "좋아요 성공";
		}else{
			resultStr = "좋아요 취소 성공";
		}
		
		retVal.put("val", resultStr);
			
		return retVal;
	}
	
	//가구배치도 상세페이지로 좋아요 목록 가져가기
	@RequestMapping(value = URLs.URI_FURNITURE_ARR_GOOD_LIST, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> furnitureArrGoodList(
			@RequestBody Map<String, Object> furArrGoodInfo){
		
		System.out.println("가구배치도 좋아요목록 들옴");
		System.out.println(furArrGoodInfo.get("fur_arr_plan_no"));
		
		
		List<FurnitureArrGoodListVO> goodList = furniture_arrService.getFurArrGoodList(furArrGoodInfo);
		
		for(int i=0; i<goodList.size(); i++){
			System.out.println("좋아요목록" + goodList.get(i).toString());
		}
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		retVal.put("goodList", goodList);
		
		return retVal;
	}
	
	//가구배치도 상세페이지에서 스크랩 하기
	@RequestMapping(value = URLs.URI_FURNITURE_ARR_SCRAP_ADD, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> insertFurnitureArrScrap(
			@RequestBody Map<String, Object> furArrScrapInfo){
		
		int result = furniture_arrService.insertFurnitureArrScrap(furArrScrapInfo);
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		retVal.put("resultNum", result);
		
		return retVal;
	}
	
	//가구배치도 상세페이지에서 스크랩 하기 07.26
	@RequestMapping(value = URLs.URI_FURNITURE_ARR_DETAIL_SCRAP_LIST, method = RequestMethod.POST, produces = {
	"application/json" })
	public @ResponseBody Map<String, Object> FurArrScrapListService(HttpServletRequest request,
			HttpServletResponse response, @RequestBody Map<String, Object> scrap_info) throws IOException {
		System.out.println("여기있는데");
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		System.out.println("??");
		
		int real_fur_arr_plan_no = Integer.parseInt(scrap_info.get("fur_arr_plan_no").toString());
		System.out.println(real_fur_arr_plan_no);
		
		List<Furniture_arrScrapListVO> fur_arr_plan_list = furniture_arrService.furArrScrapList(real_fur_arr_plan_no);
		retVal.put("fur_arr_plan_list", fur_arr_plan_list);
		System.out.println(retVal);
		
		
		return retVal;
	}
	
	
}
