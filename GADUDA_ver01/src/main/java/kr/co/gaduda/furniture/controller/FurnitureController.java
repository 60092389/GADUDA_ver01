package kr.co.gaduda.furniture.controller;

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
import kr.co.gaduda.furniture.dto.FurnitureScrapDTO;
import kr.co.gaduda.furniture.service.IFurnitureService;
import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureGoodListVO;
import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture.vo.FurnitureReplyListVO;
import kr.co.gaduda.furniture.vo.FurnitureScrapListVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;

@Controller
@RequestMapping(value = "/furniture")
public class FurnitureController {
	@Autowired
	private IFurnitureService furnitureService;

	@RequestMapping(value = URLs.URI_FURNITURE_DETAIL, method = RequestMethod.GET)
	public String furListView(@RequestParam(value = "fur_no") int fur_no, Model model) {

		FurnitureDetailVO furdeVO = furnitureService.furDetailView(fur_no);
		List<String> furdepic_list = furnitureService.furDetailViewPic(fur_no);
		List<FurnitureReplyListVO> fur_repl_list = furnitureService.FurnitureReplList(fur_no);

		model.addAttribute("furdeVO", furdeVO);
		model.addAttribute("furdepic_list", furdepic_list);
		model.addAttribute("fur_repl_list", fur_repl_list);

		return Pages.VIEW_FURNITURE_DETAIL_VIEW;
	}

	////////////////////////////////////////////////////////////
	// 가구 구경 페이지 컨트롤러

	@RequestMapping(value = URLs.URI_FURNITURE_LIST_LOOKAROUND_GET, method = RequestMethod.GET)
	public String furLookAroundListView(
			@RequestParam(value = "room_kind_def_name", required = false) String room_kind_def_name,
			@RequestParam(value = "concept_name", required = false) String concept_name,
			@RequestParam(value = "fur_kind_def_name", required = false) String fur_kind_def_name,
			@RequestParam(value = "array_option", required = false) String array_option, Model model,
			HttpServletRequest request) {

		List<String> furRoomKind = furnitureService.getRoomKind();
		model.addAttribute("roomKind", furRoomKind);
		
		List<String> furConceptKind = furnitureService.getConceptKind();
		model.addAttribute("conceptKind", furConceptKind);
		
		
		List<String> furDefKind = furnitureService.getFurDefKind();
		
		if(room_kind_def_name != null){
			furDefKind = furnitureService.getFurNameForRoom(room_kind_def_name);
		}
		
		model.addAttribute("furDefKind", furDefKind);

		List<FurnitureListViewVO> furList = furnitureService.furnitureList(room_kind_def_name, concept_name,
				fur_kind_def_name, array_option, request);

		for (int i = 0; i < furList.size(); i++) {
			System.out.println(furList.get(i).toString());
		}
		model.addAttribute("furList", furList);
		model.addAttribute("roomconcept", "1");
		
		if(room_kind_def_name == null && concept_name == null && fur_kind_def_name == null){
			model.addAttribute("roomconcept", "0");
		}
		
		return Pages.VIEW_FURNITURE_LIST;
	}

	@RequestMapping(value = URLs.URI_FURNITURE_GOOD_UP, method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> furnitureGoodInsert(@RequestBody Map<String, Object> furnitureGoodInfo) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int result = furnitureService.furnitureGood(furnitureGoodInfo);

		String resultStr = "";

		if (result == 1) {
			resultStr = "좋아요 성공";
		} else if (result == 2) {
			resultStr = "좋아요 취소 성공";
		}

		retVal.put("val", resultStr);

		return retVal;
	}

	@RequestMapping(value = URLs.URI_FURNITURE_REPLY_WRITE, method = RequestMethod.POST, produces = {
			"application/json" })
	public @ResponseBody Map<String, Object> furnitureReplyInsert(@RequestBody Map<String, Object> furnitureReplyInfo) {

		furnitureService.insertFurnitureReply(furnitureReplyInfo);

		Map<String, Object> retVal = new HashMap<String, Object>();

		retVal.put("val", 1);

		return retVal;
	}

	@RequestMapping(value = URLs.URI_FURNITURE_REPLY_LIST, method = RequestMethod.POST, produces = {
			"application/json" })
	public @ResponseBody Map<String, Object> furnitureReplyList(@RequestBody Map<String, Object> furnitureReplyInfo) {

		List<FurnitureReplyListVO> list = furnitureService.listFurnitureReply(furnitureReplyInfo);

		Map<String, Object> retVal = new HashMap<String, Object>();

		retVal.put("replyList", list);

		return retVal;
	}

	@RequestMapping(value = URLs.URI_FURNITURE_REPLY_DELETE, method = RequestMethod.POST, produces = {
			"application/json" })
	public @ResponseBody Map<String, Object> furnitureReplyDelete(
			@RequestBody Map<String, Object> furnitureReplyDeleteInfo) {

		furnitureService.deleteFurnitureReply(furnitureReplyDeleteInfo);
		Map<String, Object> retDeleteVal = new HashMap<String, Object>();
		retDeleteVal.put("val", 1);

		return retDeleteVal;
	}
	// 가구 구경
	//////////////////////////////////////////////////////////////////////

	// 가구 좋아요 리스트
	@RequestMapping(value = URLs.URI_FURNITURE_DETAIL_GOOD_LIST_U, method = RequestMethod.POST, produces = {
			"application/json" })
	public @ResponseBody Map<String, Object> mongoFurGoodListService(@RequestBody Map<String, Object> search) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		List<FurnitureGoodListVO> list = furnitureService.getFurGoodList(search);

		List<FurnitureGoodListVO> list_good = new ArrayList<FurnitureGoodListVO>();

		for (int i = 0; i < list.size(); i++) {

			FurnitureGoodListVO vo = new FurnitureGoodListVO();

			int list_fur_no = list.get(i).getFur_no();
			String list_mem_id = list.get(i).getMem_id();
			String list_mem_nickname = list.get(i).getMem_nickname();
			String list_fur_good_date = list.get(i).getFur_good_date();

			vo.setFur_no(list_fur_no);
			vo.setMem_id(list_mem_id);
			vo.setMem_nickname(list_mem_nickname);
			vo.setFur_good_date(list_fur_good_date);

			list_good.add(i, vo);
		}

		retVal.put("list_good", list_good);

		return retVal;

	}
	// 가구 스크랩~~

	@RequestMapping(value = URLs.URI_FURNITURE_SCRAP, method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> furScrap(HttpServletRequest request, HttpServletResponse response,
			@RequestBody Map<String, Object> scrap_info) throws IOException {
		System.out.println("가구스크랩!");
		FurnitureScrapDTO furnitureScrapDTO = new FurnitureScrapDTO();
		Map<String, Object> retVal = new HashMap<String, Object>();

		int real_fur_no = Integer.parseInt(scrap_info.get("fur_no").toString());
		String real_mem_id = scrap_info.get("mem_id").toString();
		furnitureScrapDTO.setFur_no(real_fur_no);
		furnitureScrapDTO.setMem_id(real_mem_id);

		System.out.println(real_fur_no + "," + real_mem_id);
		int chkResult = furnitureService.furScrapChk(furnitureScrapDTO);

		String resultStr = "";

		if (chkResult == 1) {
			System.out.println("이미 스크랩 되어 있습니다");
			resultStr = "스크랩 실패";
		} else {
			System.out.println("스크랩 성공");
			resultStr = "스크랩 성공";
			int result = furnitureService.furScrap(furnitureScrapDTO);
			System.out.println(result);
		}

		retVal.put("val", resultStr);

		return retVal;

	}

	// 스크랩 리스트 보기
	@RequestMapping(value = URLs.URI_FURNITURE_DETAIL_SCRAP_LIST_U, method = RequestMethod.POST, produces = {
			"application/json" })
	public @ResponseBody Map<String, Object> FurScrapListService(HttpServletRequest request,
			HttpServletResponse response, @RequestBody Map<String, Object> scrap_info) throws IOException {
		System.out.println("여기있는데");

		Map<String, Object> retVal = new HashMap<String, Object>();

		int real_fur_no = Integer.parseInt(scrap_info.get("fur_no").toString());

		List<FurnitureScrapListVO> fur_scrap_list = furnitureService.furScrapList(real_fur_no);
		retVal.put("fur_scrap_list", fur_scrap_list);
		System.out.println(retVal);

		return retVal;

	}

}
