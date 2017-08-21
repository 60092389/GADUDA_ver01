package kr.co.gaduda.furniture.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.furniture.dao.IFurnitureDao;
import kr.co.gaduda.furniture.dto.FurnitureCateDTO;
import kr.co.gaduda.furniture.dto.FurnitureDTO;
import kr.co.gaduda.furniture.dto.FurnitureScrapDTO;
import kr.co.gaduda.furniture.service.IFurnitureService;
import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureGoodListVO;
import kr.co.gaduda.furniture.vo.FurnitureItemVO;
import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture.vo.FurnitureReplyListVO;
import kr.co.gaduda.furniture.vo.FurnitureScrapListVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;
import kr.co.gaduda.furniture_arr.vo.crawling_furnitureVO;

@Service
public class FurnitureService implements IFurnitureService {

	@Autowired
	private IFurnitureDao furnitureDao;

	@Override
	public List<FurnitureVO> furList() {

		List<FurnitureVO> fur_list = furnitureDao.getFurniture();
		for (int i = 0; i < fur_list.size(); i++) {

			int fur_no = fur_list.get(i).getFur_no();

			List<String> fur_pic_loc = furnitureDao.fur_pic_loc_Get(fur_no);
			int fur_scrap = furnitureDao.getFurScrapCount(fur_no);
			fur_list.get(i).setFur_scrap_num(fur_scrap);
			String fur_pic_loc_main = fur_pic_loc.get(0).toString();

			fur_list.get(i).setFur_pic_loc(fur_pic_loc_main);
		}

		return fur_list;
	}

	@Override
	public FurnitureDetailVO furDetailView(int fur_no) {

		FurnitureDetailVO furdeVO = new FurnitureDetailVO();
		FurnitureItemVO furitemVO = new FurnitureItemVO();

		furdeVO = furnitureDao.getDetailFurniture(fur_no);
		furitemVO = furnitureDao.getFurItem(fur_no);

		String fur_item_no = furitemVO.getFur_item_no();
		int fur_width = furitemVO.getFur_width();
		int fur_height = furitemVO.getFur_height();
		int fur_depth = furitemVO.getFur_depth();

		System.out.println(fur_width + "|" + fur_height + "|" + fur_depth);

		String fur_con = "";
		String fur_kind = "";
		List<String> fur_pic_loc_list = furnitureDao.fur_pic_loc_Get(fur_no);
		List<String> fur_con_list = furnitureDao.fur_pic_con_Get(fur_no);

		for (int i = 0; i < fur_con_list.size(); i++) {
			fur_con = fur_con_list.get(i) + "  " + fur_con;
		}

		List<String> fur_kind_list = furnitureDao.fur_pic_kind_Get(fur_no);
		for (int i = 0; i < fur_kind_list.size(); i++) {
			fur_kind = fur_kind_list.get(i) + "  " + fur_kind;
		}
		int fur_scrap = furnitureDao.getFurScrapCount(fur_no);

		furdeVO.setFur_item_no(fur_item_no);
		furdeVO.setFur_width(fur_width);
		furdeVO.setFur_height(fur_height);
		furdeVO.setFur_depth(fur_depth);

		furdeVO.setFur_pic_loc(fur_pic_loc_list);
		furdeVO.setFur_con(fur_con);
		furdeVO.setFur_kind(fur_kind);
		furdeVO.setFur_scrap_num(fur_scrap);

		return furdeVO;
	}

	@Override
	public List<String> furDetailViewPic(int fur_no) {
		List<String> fur_pic_loc_list = furnitureDao.fur_pic_loc_Get(fur_no);
		return fur_pic_loc_list;
	}

	@Override
	public List<FurnitureReplyListVO> FurnitureReplList(int fur_no) {
		List<FurnitureReplyListVO> fur_repl_list = furnitureDao.FurnitureReplList(fur_no);
		return fur_repl_list;
	}

	///////////////////////////////////////////////////////////////
	// 가구구경 페이지용

	@Override
	public List<FurnitureListViewVO> furnitureList(String room_kind_def_name, String concept_name,
			String fur_kind_def_name, String array_option, HttpServletRequest request) {

		System.out.println();
		System.out.println(room_kind_def_name);
		System.out.println();

		FurnitureCateDTO furCateDTO = new FurnitureCateDTO();
		request.getSession().setAttribute("array_option", array_option);

		String array_option_session = (String) request.getSession().getAttribute("array_option");
		String room_kind_def_name_session = (String) request.getSession().getAttribute("room_kind_def_name");
		String concept_name_session = (String) request.getSession().getAttribute("concept_name");
		String fur_kind_def_name_session = (String) request.getSession().getAttribute("fur_kind_def_name");

		if ((room_kind_def_name_session != null || room_kind_def_name == null) && concept_name != null) {

			room_kind_def_name = null;
			fur_kind_def_name = null;
			request.getSession().setAttribute("concept_name", concept_name);
			request.getSession().setAttribute("room_kind_def_name", null);
			request.getSession().setAttribute("fur_kind_def_name", null);

			if (concept_name == concept_name_session) {

			}

		} else if ((concept_name_session != null || concept_name == null) && room_kind_def_name != null) {
			concept_name = null;
			fur_kind_def_name = null;
			request.getSession().setAttribute("room_kind_def_name", room_kind_def_name);
			request.getSession().setAttribute("concept_name", null);
			request.getSession().setAttribute("fur_kind_def_name", null);
		}

		if (room_kind_def_name_session != null && fur_kind_def_name != null) {
			room_kind_def_name = room_kind_def_name_session;
			request.getSession().setAttribute("fur_kind_def_name", fur_kind_def_name);

		} else if (concept_name_session != null && fur_kind_def_name != null) {
			concept_name = concept_name_session;
			request.getSession().setAttribute("fur_kind_def_name", fur_kind_def_name);
		}

		if (room_kind_def_name == null && concept_name == null && fur_kind_def_name == null && array_option == null) {
			request.getSession().setAttribute("room_kind_def_name", null);
			request.getSession().setAttribute("concept_name", null);
			request.getSession().setAttribute("fur_kind_def_name", null);
			request.getSession().setAttribute("array_option", null);
		}

		array_option = (String) request.getSession().getAttribute("array_option");
		room_kind_def_name = (String) request.getSession().getAttribute("room_kind_def_name");
		concept_name = (String) request.getSession().getAttribute("concept_name");
		fur_kind_def_name = (String) request.getSession().getAttribute("fur_kind_def_name");

		furCateDTO.setArray_option(array_option);
		furCateDTO.setConcept_name(concept_name);
		furCateDTO.setFur_kind_def_name(fur_kind_def_name);
		furCateDTO.setRoom_kind_def_name(room_kind_def_name);

		System.out.println("///////////카테고리///////////////");
		System.out.println(furCateDTO.toString());
		System.out.println("///////////////////////////////");

		List<FurnitureListViewVO> furBasicList = furnitureDao.getFurBasicList(furCateDTO);

		List<FurnitureListViewVO> furResultList = new ArrayList<FurnitureListViewVO>();

		for (int i = 0; i < furBasicList.size(); i++) {
			FurnitureListViewVO vo = new FurnitureListViewVO();

			vo.setFur_brand_name(furBasicList.get(i).getFur_brand_name());
			vo.setFur_good_num(furBasicList.get(i).getFur_good_num());
			vo.setFur_name(furBasicList.get(i).getFur_name());
			vo.setFur_no(furBasicList.get(i).getFur_no());
			vo.setFur_pic_loc(furnitureDao.getFurPicLoc(furBasicList.get(i).getFur_no()));
			vo.setFur_price(furBasicList.get(i).getFur_price());
			vo.setFur_repl_num(furBasicList.get(i).getFur_repl_num());
			vo.setFur_scrap_num(furnitureDao.getFurScrapCount(furBasicList.get(i).getFur_no()));

			furResultList.add(vo);

		}

		return furResultList;
	}

	@Override
	public int furnitureGood(Map<String, Object> furnitureGoodInfo) {

		int result = 0;

		int fur_no = Integer.parseInt((String) furnitureGoodInfo.get("fur_no"));

		try {

			if (furnitureDao.furnitureGoodChk(furnitureGoodInfo) == 0) {
				furnitureDao.insertFurnitureGood(furnitureGoodInfo);
				furnitureDao.furnitureGoodNumUp(fur_no);
				result = 1; // 좋아요 성공 후
			} else {
				furnitureDao.deleteFurnitureGood(furnitureGoodInfo);
				furnitureDao.furnitureGoodNumDown(fur_no);
				result = 2; // 좋아요 취소 후
			}

		} catch (Exception e) {
			result = 0;
		}

		return result;
	}

	@Override
	public void insertFurnitureReply(Map<String, Object> furnitureReplyInfo) {
		furnitureDao.insertFurnitureReply(furnitureReplyInfo);

		int fur_no = Integer.parseInt((String) furnitureReplyInfo.get("fur_no"));
		furnitureDao.furnitureReplyNumUp(fur_no);
	}

	@Override
	public List<FurnitureReplyListVO> listFurnitureReply(Map<String, Object> furnitureReplyInfo) {

		return furnitureDao.listFurnitureReply(furnitureReplyInfo);
	}

	@Override
	public void deleteFurnitureReply(Map<String, Object> furnitureReplyDeleteInfo) {
		furnitureDao.deleteFurnitureReply(furnitureReplyDeleteInfo);

		int fur_no = Integer.parseInt((String) furnitureReplyDeleteInfo.get("fur_no"));
		furnitureDao.furnitureReplyNumDown(fur_no);

	}
	//////////////////////////////////////////////////////////////////////////

	@Override
	public List<FurnitureGoodListVO> getFurGoodList(Map<String, Object> search) {

		List<FurnitureGoodListVO> vo = new ArrayList<FurnitureGoodListVO>();
		vo = furnitureDao.getFurGoodList(search);
		return furnitureDao.getFurGoodList(search);
	}

	// 가구스크랩~~~~~~~~~~~~~~~
	@Override
	public int furScrapChk(FurnitureScrapDTO furnitureScrapDTO) {
		return furnitureDao.furScrapChk(furnitureScrapDTO);
	}

	@Override
	public int furScrap(FurnitureScrapDTO furnitureScrapDTO) {
		return furnitureDao.furScrap(furnitureScrapDTO);
	}

	@Override
	public List<FurnitureScrapListVO> furScrapList(int fur_no) {
		return furnitureDao.furScrapList(fur_no);
	}

	// 가구 방 종류 가져오기
	@Override
	public List<String> getRoomKind() {
		return furnitureDao.getRoomKind();
	}

	// 가구 컨셉 종류 가져오기
	@Override
	public List<String> getConceptKind() {
		return furnitureDao.getConceptKind();
	}

	// 가구 종류 가져오기
	public List<String> getFurDefKind() {
		return furnitureDao.getFurDefKind();
	}

	// 방 종류에 따라 가구 가져오기
	public List<String> getFurNameForRoom(String room_kind_def_name) {
		return furnitureDao.getFurNameForRoom(room_kind_def_name);
	}

	@Override
	public List<crawling_furnitureVO> craw_furniture_list(int fur_no) {
		FurnitureDTO furDTO = new FurnitureDTO();
		furDTO.setFur_concept(furDetailView(fur_no).getFur_kind());

		furDTO.setMax_fur_width(furDetailView(fur_no).getFur_width() + 150);
		furDTO.setMin_fur_width(furDetailView(fur_no).getFur_width() - 150);
		furDTO.setMax_fur_depth(furDetailView(fur_no).getFur_depth() + 150);
		furDTO.setMin_fur_depth(furDetailView(fur_no).getFur_depth() - 150);
		furDTO.setMax_fur_height(furDetailView(fur_no).getFur_height() + 150);
		furDTO.setMin_fur_height(furDetailView(fur_no).getFur_height() - 150);
		
		List<crawling_furnitureVO> craw_furniture = furnitureDao.getCrawling_furniture(furDTO);
		
		return craw_furniture;
	}
}
