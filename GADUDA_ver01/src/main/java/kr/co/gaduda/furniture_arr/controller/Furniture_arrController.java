package kr.co.gaduda.furniture_arr.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import kr.co.gaduda.furniture_arr.vo.Arrangement_furnituresVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrGoodListVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrDetailVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrScrapListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;
import kr.co.gaduda.furniture_arr.vo.crawling_furnitureVO;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.vo.MemberVO;

@Controller
@RequestMapping(value="/furniture_arr")
public class Furniture_arrController {
	
	@Autowired
	private IFurniture_arrService furniture_arrService;
	
	@RequestMapping(value=URLs.URI_FURNITURE_WATCH, method=RequestMethod.GET)
	public String furnifure_arr_watch(@RequestParam(value="room_kind_def_name",required=false)String room_kind_def_name,
			@RequestParam(value="concept_name",required=false)String concept_name,
			Model model){
		List<String> furRoomKind = furniture_arrService.getRoomKind();
		model.addAttribute("roomKind", furRoomKind);
		
		List<String> furConceptKind = furniture_arrService.getConceptKind();
		model.addAttribute("conceptKind", furConceptKind);
	
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
	public String furnitureDetailInfo(int fur_arr_plan_no, Model model, HttpServletRequest request){
		
		Furniture_arrDetailVO detailVO = furniture_arrService.getFurArrDetailInfo(fur_arr_plan_no);
		
		List<Arrangement_furnituresVO> arr_fur = furniture_arrService.getFurArrFurniture(fur_arr_plan_no);
		
		List<FurnitureArrReplyListVO> fur_arr_reply_list = furniture_arrService.getFurArrReplyList(fur_arr_plan_no);
		
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id = memVO.getMem_id();
		String fol_mem_id = detailVO.getMem_id();
		FollowDTO followdto = new FollowDTO();
		followdto.setMem_id(mem_id);
		followdto.setFol_mem_id(fol_mem_id);
		///////////////////////////
		
	      
	      String arr_furniture="" ;
	     
	      
	      List<crawling_furnitureVO> craw_fur_detail = new ArrayList<crawling_furnitureVO>();
	      
	      Map<Integer, List<crawling_furnitureVO>> map_craw_fur_detail = new HashMap<Integer, List<crawling_furnitureVO>>();
	      
//	      List<real_crawling_furnitureVO> real_vo = new ArrayList<real_crawling_furnitureVO>();
	      
	      for (int i = 0; i < arr_fur.size(); i++) {

	         int fur_no = arr_fur.get(i).getFur_no();
	         arr_furniture = arr_fur.get(i).getFur_name();
	         
	         System.out.println("컨트롤러안에"+arr_furniture);
	         try {
				
	        	 craw_fur_detail = furniture_arrService.craw_fur_list(fur_no);
	        	 System.out.println("디테일 사이즈 "+craw_fur_detail.size());
	        	 craw_fur_detail.get(i).setArr_fur_name(arr_furniture);
			} catch (Exception e) {
				 craw_fur_detail = furniture_arrService.craw_fur_list(fur_no);
			}

	         
	         map_craw_fur_detail.put(i, craw_fur_detail);
	         for(int j = 0 ; j<craw_fur_detail.size();j++){
	         
	         System.out.println("사이즈 없는거 안나와야됨"+"순서="+j+"ㅋ"+craw_fur_detail.get(j).getCraw_fur_size()+"컨트롤러안에 가구 아이디 : "+craw_fur_detail.get(j).get_id());
	         
	         }
	      }
	      
	      model.addAttribute("craw_fur_detail", map_craw_fur_detail);
	      

		///////////////////////////
		int followint = furniture_arrService.getFollowing(followdto); //맞팔
		int memfolmeint = furniture_arrService.memFolMe(followdto); //나만 팔로우
		
		int followox = 0;
		if(mem_id.equals(fol_mem_id)){ //자기 게시물 봤을 떄
			followox = 0;
		}else if(followint==0 && memfolmeint==0){ //둘다 아무도 팔로우 안함
			followox = 1;
		}else if(followint==0 && memfolmeint==1){ //작성자만 팔로우O
			followox = 2;
		}else if(followint==1 && memfolmeint==0){ //나만 팔로우
			followox = 3;
		}else if(followint==1 && memfolmeint==1){ //맞팔
			followox = 4;
		}
		model.addAttribute("followox", followox);
		model.addAttribute("detailVO", detailVO);
		model.addAttribute("arr_fur", arr_fur);
		model.addAttribute("reply_list", fur_arr_reply_list);
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("result", fur_arr_reply_list);
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
		System.out.println("꺄ㅕ르");
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
		
		int real_fur_arr_plan_no = Integer.parseInt(scrap_info.get("fur_arr_plan_no").toString());
		System.out.println(real_fur_arr_plan_no);
		
		List<Furniture_arrScrapListVO> fur_arr_plan_list = furniture_arrService.furArrScrapList(real_fur_arr_plan_no);
		retVal.put("fur_arr_plan_list", fur_arr_plan_list);
		System.out.println(retVal);
		
		
		return retVal;
	}
	
	//hashtag검색
	@RequestMapping(value=URLs.URI_FURNITURE_HASHTAG, method=RequestMethod.GET)
	public String furnifure_arr_hash(@RequestParam(value="hashtag_search")String hashtag_search,
			Model model){
		
		List<Integer> hashFurNo = furniture_arrService.searchHashTag(hashtag_search);
		
		List<Furniture_arrVO> HashFurArr = new ArrayList<Furniture_arrVO>();
		for(int i = 0; i < hashFurNo.size(); i++){
			int fur_no = hashFurNo.get(i);
			System.out.println(fur_no);
			Furniture_arrVO arrVO = furniture_arrService.getFurArrHashTag(fur_no);
			System.out.println(arrVO);
			HashFurArr.add(arrVO);
		}
		
		model.addAttribute("HashTag",hashtag_search);
		model.addAttribute("fur_arr_list",HashFurArr);
		return Pages.VIEW_FURNITURE_HASH_VIEW;
	}
	
	
}
