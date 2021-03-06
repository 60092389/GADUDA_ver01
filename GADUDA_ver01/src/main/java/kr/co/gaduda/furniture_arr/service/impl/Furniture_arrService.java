package kr.co.gaduda.furniture_arr.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gaduda.furniture.service.IFurnitureService;
import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture_arr.dao.IFurniture_arrDao;
import kr.co.gaduda.furniture_arr.dto.FurnitureArrScrapDTO;
import kr.co.gaduda.furniture_arr.dto.Furniture_arrDTO;
import kr.co.gaduda.furniture_arr.dto.OtherFurnitureDTO;
import kr.co.gaduda.furniture_arr.service.IFurniture_arrService;
import kr.co.gaduda.furniture_arr.vo.Arrangement_furnituresVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrGoodListVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrDetailVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrMemberVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrScrapListVO;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;
import kr.co.gaduda.furniture_arr.vo.Other_Furniture_arrVO;
import kr.co.gaduda.furniture_arr.vo.crawling_furnitureVO;
import kr.co.gaduda.member.dto.FollowDTO;

@Service
public class Furniture_arrService implements IFurniture_arrService {

	@Autowired
	private IFurniture_arrDao furniture_arrDao;
	@Autowired
	private IFurnitureService furnitureService;

	@Override
	public List<Furniture_arrVO> furArrList() {

		List<Furniture_arrVO> fur_arr_list = furniture_arrDao.getFurArr();

		for (int i = 0; i < fur_arr_list.size(); i++) {

			int fur_arr_plan_no = fur_arr_list.get(i).getFur_arr_plan_no();
			// 2017-08-07 추가(수정)
			String mem_id = fur_arr_list.get(i).getMem_id();
			Furniture_arrMemberVO memVO = furniture_arrDao.getFurArrUser(mem_id);
			fur_arr_list.get(i).setMem_nickname(memVO.getMem_nickname());
			fur_arr_list.get(i).setMem_profile_pic(memVO.getMem_profile_pic());

			List<String> furArrRoomKind = furniture_arrDao.FurArrRoomKind(fur_arr_plan_no);
			List<String> furArrCon = furniture_arrDao.getFurCon(fur_arr_plan_no);
			List<String> hashTagList = furniture_arrDao.getFurArrHashtags(fur_arr_plan_no);

			String furArrRoomKind_final = "";
			String furArrCon_final = "";
			String hashTag_final = "";

			for (int j = 0; j < furArrCon.size(); j++) {
				String concept = furArrCon.get(j);
				furArrCon_final = concept + " " + furArrCon_final;
			}

			for (int j = 0; j < furArrRoomKind.size(); j++) {
				String roomkind = furArrRoomKind.get(j);
				furArrRoomKind_final = roomkind + " " + furArrRoomKind_final;
			}

			for (int k = 0; k < hashTagList.size(); k++) {
				String hashTag = hashTagList.get(k);
				hashTag_final = hashTag + " " + hashTag_final;
			}

			int fur_scrap_num = furniture_arrDao.getCountScrap(fur_arr_plan_no);

			fur_arr_list.get(i).setFur_arr_room_kind(furArrRoomKind_final);
			fur_arr_list.get(i).setFur_arr_con(furArrCon_final);
			fur_arr_list.get(i).setFur_arr_plan_scrap_num(fur_scrap_num);
			fur_arr_list.get(i).setFur_arr_hashtag_name(hashTag_final);
		}

		return fur_arr_list;
	}

	@Override
	public List<Furniture_arrVO> furArrList_roomkind(String room_kind_def_name) {
		List<Furniture_arrVO> fur_arr_list = furniture_arrDao.getFurArr_roomkind(room_kind_def_name);

		for (int i = 0; i < fur_arr_list.size(); i++) {

			int fur_arr_plan_no = fur_arr_list.get(i).getFur_arr_plan_no();
			// 2017-08-07 추가(수정)
			String mem_id = fur_arr_list.get(i).getMem_id();
			Furniture_arrMemberVO memVO = furniture_arrDao.getFurArrUser(mem_id);
			fur_arr_list.get(i).setMem_nickname(memVO.getMem_nickname());
			fur_arr_list.get(i).setMem_profile_pic(memVO.getMem_profile_pic());

			List<String> furArrRoomKind = furniture_arrDao.FurArrRoomKind(fur_arr_plan_no);
			List<String> furArrCon = furniture_arrDao.getFurCon(fur_arr_plan_no);
			List<String> hashTagList = furniture_arrDao.getFurArrHashtags(fur_arr_plan_no);

			String furArrRoomKind_final = "";
			String furArrCon_final = "";
			String hashTag_final = "";

			for (int m = 0; m < furArrCon.size(); m++) {
				String concept = furArrCon.get(m);
				furArrCon_final = concept + " " + furArrCon_final;
			}

			for (int j = 0; j < furArrRoomKind.size(); j++) {
				String roomkind = furArrRoomKind.get(j);
				furArrRoomKind_final = roomkind + " " + furArrRoomKind_final;
			}

			for (int k = 0; k < hashTagList.size(); k++) {
				String hashTag = hashTagList.get(k);
				hashTag_final = hashTag + " " + hashTag_final;
			}

			int fur_scrap_num = furniture_arrDao.getCountScrap(fur_arr_plan_no);

			fur_arr_list.get(i).setFur_arr_room_kind(furArrRoomKind_final);
			fur_arr_list.get(i).setFur_arr_con(furArrCon_final);
			fur_arr_list.get(i).setFur_arr_plan_scrap_num(fur_scrap_num);
			fur_arr_list.get(i).setFur_arr_hashtag_name(hashTag_final);
		}

		return fur_arr_list;

	}

	@Override
	public List<Furniture_arrVO> furArrList_concept(String concept_name) {
		List<Furniture_arrVO> fur_arr_list = furniture_arrDao.getFurArr_concept(concept_name);

		for (int i = 0; i < fur_arr_list.size(); i++) {

			int fur_arr_plan_no = fur_arr_list.get(i).getFur_arr_plan_no();
			// 2017-08-07 추가(수정)
			String mem_id = fur_arr_list.get(i).getMem_id();
			Furniture_arrMemberVO memVO = furniture_arrDao.getFurArrUser(mem_id);
			fur_arr_list.get(i).setMem_nickname(memVO.getMem_nickname());
			fur_arr_list.get(i).setMem_profile_pic(memVO.getMem_profile_pic());

			List<String> furArrRoomKind = furniture_arrDao.FurArrRoomKind(fur_arr_plan_no);
			List<String> furArrCon = furniture_arrDao.getFurCon(fur_arr_plan_no);
			List<String> hashTagList = furniture_arrDao.getFurArrHashtags(fur_arr_plan_no);

			String furArrRoomKind_final = "";
			String furArrCon_final = "";
			String hashTag_final = "";

			for (int m = 0; m < furArrCon.size(); m++) {
				String concept = furArrCon.get(m);
				furArrCon_final = concept + " " + furArrCon_final;
			}

			for (int j = 0; j < furArrRoomKind.size(); j++) {
				String roomkind = furArrRoomKind.get(j);
				furArrRoomKind_final = roomkind + " " + furArrRoomKind_final;
			}

			for (int k = 0; k < hashTagList.size(); k++) {
				String hashTag = hashTagList.get(k);
				hashTag_final = hashTag + " " + hashTag_final;
			}

			int fur_scrap_num = furniture_arrDao.getCountScrap(fur_arr_plan_no);

			fur_arr_list.get(i).setFur_arr_room_kind(furArrRoomKind_final);
			fur_arr_list.get(i).setFur_arr_con(furArrCon_final);
			fur_arr_list.get(i).setFur_arr_plan_scrap_num(fur_scrap_num);
			fur_arr_list.get(i).setFur_arr_hashtag_name(hashTag_final);
		}

		return fur_arr_list;

	}

	@Override
	public List<Furniture_arrVO> furArrList_roomkind_concept(String room_kind_def_name, String concept_name) {
		List<Furniture_arrVO> fur_arr_list = furniture_arrDao.getFurArr_roomkind(room_kind_def_name);

		for (int i = 0; i < fur_arr_list.size(); i++) {

			int fur_arr_plan_no = fur_arr_list.get(i).getFur_arr_plan_no();
			// 2017-08-07 추가(수정)
			String mem_id = fur_arr_list.get(i).getMem_id();
			Furniture_arrMemberVO memVO = furniture_arrDao.getFurArrUser(mem_id);
			fur_arr_list.get(i).setMem_nickname(memVO.getMem_nickname());
			fur_arr_list.get(i).setMem_profile_pic(memVO.getMem_profile_pic());

			List<String> furArrRoomKind = furniture_arrDao.FurArrRoomKind(fur_arr_plan_no);
			List<String> furArrCon = furniture_arrDao.getFurCon(fur_arr_plan_no);
			List<String> hashTagList = furniture_arrDao.getFurArrHashtags(fur_arr_plan_no);

			String furArrRoomKind_final = "";
			String furArrCon_final = "";
			String hashTag_final = "";

			for (int m = 0; m < furArrCon.size(); m++) {
				String concept = furArrCon.get(m);
				furArrCon_final = concept + " " + furArrCon_final;
			}

			for (int j = 0; j < furArrRoomKind.size(); j++) {
				String roomkind = furArrRoomKind.get(j);
				furArrRoomKind_final = roomkind + " " + furArrRoomKind_final;
			}

			for (int k = 0; k < hashTagList.size(); k++) {
				String hashTag = hashTagList.get(k);
				hashTag_final = hashTag + " " + hashTag_final;
			}

			int fur_scrap_num = furniture_arrDao.getCountScrap(fur_arr_plan_no);

			fur_arr_list.get(i).setFur_arr_room_kind(furArrRoomKind_final);
			fur_arr_list.get(i).setFur_arr_con(furArrCon_final);
			fur_arr_list.get(i).setFur_arr_plan_scrap_num(fur_scrap_num);
			fur_arr_list.get(i).setFur_arr_hashtag_name(hashTag_final);
		}

		return fur_arr_list;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int furnitureArrGood(Map<String, Object> furnitureArrGoodInfo) {

		int result = 0;

		int fur_arr_plan_no = Integer.parseInt((String) furnitureArrGoodInfo.get("fur_arr_plan_no"));

		System.out.println("goodChk 결과 : " + furniture_arrDao.furnitureArrGoodChk(furnitureArrGoodInfo));

		try {

			if (furniture_arrDao.furnitureArrGoodChk(furnitureArrGoodInfo) == 0) {
				furniture_arrDao.insertFurnitureArrGood(furnitureArrGoodInfo);
				furniture_arrDao.furnitureArrGoodNumUp(fur_arr_plan_no);
				result = 1;
			} else if (furniture_arrDao.furnitureArrGoodChk(furnitureArrGoodInfo) == 1) {
				furniture_arrDao.deleteFurnitureArrGood(furnitureArrGoodInfo);
				furniture_arrDao.furnitureArrGoodNumDown(fur_arr_plan_no);
				result = 2;
			}

		} catch (Exception e) {
			result = 0;
		}
		return result;
	}

	@Override
	public List<FurnitureArrGoodListVO> getFurArrGoodList(Map<String, Object> furArrGoodInfo) {
		return furniture_arrDao.getFurArrGoodList(furArrGoodInfo);
	}

	@Override
	public Furniture_arrDetailVO getFurArrDetailInfo(int fur_arr_plan_no) {

		Furniture_arrDetailVO resultVO = new Furniture_arrDetailVO();

		Furniture_arrDetailVO basicVO = furniture_arrDao.getFurArrDetailBasic(fur_arr_plan_no);

		String fur_arr_plan_img_loc = basicVO.getFur_arr_plan_img_loc();
		String fur_arr_name = basicVO.getFur_arr_name();
		String mem_id = basicVO.getMem_id();
		String mem_nickname = basicVO.getMem_nickname();
		String mem_profile_pic = basicVO.getMem_profile_pic();
		String fur_arr_contents = basicVO.getFur_arr_contents();
		String fur_arr_create_date = basicVO.getFur_arr_create_date();
		int fur_arr_plan_good_num = basicVO.getFur_arr_plan_good_num();
		int fur_arr_plan_repl_num = basicVO.getFur_arr_plan_repl_num();
		int fur_arr_plan_scrap_num = basicVO.getFur_arr_plan_scrap_num();
		int total_fur_price = basicVO.getTotal_fur_price();

		List<String> hashTagList = furniture_arrDao.getFurArrHashtags(fur_arr_plan_no);

		String fur_arr_hashtags = "";

		for (int i = 0; i < hashTagList.size(); i++) {
			fur_arr_hashtags = hashTagList.get(i) + " " + fur_arr_hashtags;
		}

		List<String> conceptList = furniture_arrDao.getFurArrConcepts(fur_arr_plan_no);

		String fur_arr_concepts = "";

		for (int i = 0; i < conceptList.size(); i++) {
			fur_arr_concepts = conceptList.get(i) + " " + fur_arr_concepts;
		}

		List<String> roomList = furniture_arrDao.getFurArrRoomKinds(fur_arr_plan_no);

		String fur_arr_rooms = "";

		for (int i = 0; i < roomList.size(); i++) {
			fur_arr_rooms = roomList.get(i) + " " + fur_arr_rooms;
		}

		OtherFurnitureDTO otherFurnitureDTO = new OtherFurnitureDTO();
		otherFurnitureDTO.setFur_arr_plan_no(fur_arr_plan_no);
		otherFurnitureDTO.setMem_id(mem_id);

		List<Other_Furniture_arrVO> other_furniture_arrList = furniture_arrDao.getOtherFurArr(otherFurnitureDTO);

		resultVO.setFur_arr_concepts(fur_arr_concepts);
		resultVO.setFur_arr_contents(fur_arr_contents);
		resultVO.setFur_arr_create_date(fur_arr_create_date);
		resultVO.setFur_arr_hashtags(fur_arr_hashtags);
		resultVO.setFur_arr_name(fur_arr_name);
		resultVO.setFur_arr_plan_good_num(fur_arr_plan_good_num);
		resultVO.setFur_arr_plan_img_loc(fur_arr_plan_img_loc);
		resultVO.setFur_arr_plan_no(fur_arr_plan_no);
		resultVO.setFur_arr_plan_repl_num(fur_arr_plan_repl_num);
		resultVO.setFur_arr_plan_scrap_num(fur_arr_plan_scrap_num);
		resultVO.setFur_arr_rooms(fur_arr_rooms);
		resultVO.setMem_id(mem_id);
		resultVO.setMem_nickname(mem_nickname);
		resultVO.setMem_profile_pic(mem_profile_pic);
		resultVO.setOther_furniture_arrList(other_furniture_arrList);
		resultVO.setTotal_fur_price(total_fur_price);

		return resultVO;
	}

	@Override
	public List<Arrangement_furnituresVO> getFurArrFurniture(int fur_arr_plan_no) {

		List<Arrangement_furnituresVO> list = furniture_arrDao.getFurArrFurniture(fur_arr_plan_no);

		List<Arrangement_furnituresVO> resultList = new ArrayList<Arrangement_furnituresVO>();

		for (int i = 0; i < list.size(); i++) {
			Arrangement_furnituresVO vo = new Arrangement_furnituresVO();

			int fur_no = list.get(i).getFur_no();

			vo.setFur_name(list.get(i).getFur_name());
			vo.setFur_no(fur_no);
			vo.setFur_pic_loc(furniture_arrDao.getArrFurPic(fur_no));
			vo.setFur_price(list.get(i).getFur_price());

			resultList.add(vo);

		}

		return resultList;
	}

	@Override
	public List<FurnitureArrReplyListVO> getFurArrReplyList(int fur_arr_plan_no) {

		return furniture_arrDao.getFurArrReplyList(fur_arr_plan_no);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertFurnitureArrReply(Map<String, Object> furArrReplyInfo) {
		int result = 0;

		int fur_arr_plan_no = Integer.parseInt((String) furArrReplyInfo.get("fur_arr_plan_no"));

		String fur_arr_writer = furniture_arrDao.getFurArrWriter(fur_arr_plan_no);

		furArrReplyInfo.put("fur_arr_writer", fur_arr_writer);

		System.out.println("댓글 입력의 fur_arr_plan_no : " + fur_arr_plan_no);

		try {
			furniture_arrDao.insertFurnitureArrReply(furArrReplyInfo);
			result = furniture_arrDao.furnitureArrReplyNumUp(fur_arr_plan_no);

		} catch (Exception e) {
			result = 0;
		}

		return result;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int deleteFurnitureArrReply(Map<String, Object> furArrReplyInfo) {

		int result = 0;

		try {
			int fur_arr_plan_no = Integer.parseInt((String) furArrReplyInfo.get("fur_arr_plan_no"));

			System.out.println("댓글 삭제의 fur_arr_plan_no : " + fur_arr_plan_no);

			furniture_arrDao.deleteFurnitureArrReply(furArrReplyInfo);
			result = furniture_arrDao.furnitureArrReplyNumDown(fur_arr_plan_no);

		} catch (Exception e) {
			System.out.println("가구배치도 댓글 삭제 실패");
		}

		return result;
	}

	@Override
	public int insertFurnitureArrScrap(Map<String, Object> furArrScrapInfo) {

		int result = 0;

		int fur_arr_plan_no = Integer.parseInt((String) furArrScrapInfo.get("fur_arr_plan_no"));
		String mem_id = (String) furArrScrapInfo.get("mem_id");

		FurnitureArrScrapDTO dto = new FurnitureArrScrapDTO();

		dto.setFur_arr_plan_no(fur_arr_plan_no);
		dto.setMem_id(mem_id);

		int chk_num = furniture_arrDao.furArrScrapChk(dto);

		if (chk_num == 0) {
			furniture_arrDao.insertFurArrScrap(dto);
			result = 1;
		} else {
			result = 2;
		}

		return result;
	}

	@Override
	public List<Furniture_arrScrapListVO> furArrScrapList(int fur_arr_plan_no) {
		return furniture_arrDao.furArrScrapList(fur_arr_plan_no);
	}

	// 가구 방 종류 가져오기
	@Override
	public List<String> getRoomKind() {
		return furniture_arrDao.getRoomKind();
	}

	// 가구 컨셉 종류 가져오기
	@Override
	public List<String> getConceptKind() {
		return furniture_arrDao.getConceptKind();
	}

	// 가구배치도 작성자를 내가 팔로우 했는지/아닌지
	@Override
	public int getFollowing(FollowDTO followdto) {
		return furniture_arrDao.getFollowing(followdto);
	}

	// 작성자가 나를 팔로우 했는지 확인하기
	@Override
	public int memFolMe(FollowDTO followdto) {
		return furniture_arrDao.memFolMe(followdto);
	}

	@Override
	public List<crawling_furnitureVO> craw_fur_list(int fur_no) {

		System.out.println("가구번호 들어오는지 확인" + fur_no);

		Furniture_arrDTO faDTO = new Furniture_arrDTO();
		FurnitureDetailVO furDetailVO = furnitureService.furDetailView(fur_no);

		int fur_width = furDetailVO.getFur_width();
		int fur_height = furDetailVO.getFur_height();
		int fur_depth = furDetailVO.getFur_depth();
		String fur_kind = furDetailVO.getFur_kind();
		String fur_concept = furDetailVO.getFur_con();

		String fur_concept_arr[] = fur_concept.split(" ");

		fur_concept = fur_concept_arr[0];

		faDTO.setFur_concept(fur_concept);
		faDTO.setFur_kind(fur_kind);

		faDTO.setMax_fur_width(fur_width + 150);
		faDTO.setMin_fur_width(fur_width - 150);
		faDTO.setMax_fur_depth(fur_depth + 150);
		faDTO.setMin_fur_depth(fur_depth - 150);
		faDTO.setMax_fur_height(fur_height + 150);
		faDTO.setMin_fur_height(fur_height - 150);

		List<crawling_furnitureVO> final_craw_fur = furniture_arrDao.getCrawling_fur(faDTO);

		return final_craw_fur;

	}

	// 2017.08.11 HashTagSearch Sujung
	@Override
	public List<Integer> searchHashTag(String hashtag_name) {
		return furniture_arrDao.searchHashTag(hashtag_name);
	}

	@Override
	public Furniture_arrVO getFurArrHashTag(int fur_arr_plan_no) {

		Furniture_arrVO fur_arr = furniture_arrDao.getFurArrHashTag(fur_arr_plan_no);

		String mem_id = fur_arr.getMem_id();
		Furniture_arrMemberVO memVO = furniture_arrDao.getFurArrUser(mem_id);
		fur_arr.setMem_nickname(memVO.getMem_nickname());
		fur_arr.setMem_profile_pic(memVO.getMem_profile_pic());

		List<String> furArrRoomKind = furniture_arrDao.FurArrRoomKind(fur_arr_plan_no);
		List<String> furArrCon = furniture_arrDao.getFurCon(fur_arr_plan_no);
		List<String> hashTagList = furniture_arrDao.getFurArrHashtags(fur_arr_plan_no);

		String furArrRoomKind_final = "";
		String furArrCon_final = "";
		String hashTag_final = "";

		for (int m = 0; m < furArrCon.size(); m++) {
			String concept = furArrCon.get(m);
			furArrCon_final = concept + " " + furArrCon_final;
		}

		for (int j = 0; j < furArrRoomKind.size(); j++) {
			String roomkind = furArrRoomKind.get(j);
			furArrRoomKind_final = roomkind + " " + furArrRoomKind_final;
		}

		for (int k = 0; k < hashTagList.size(); k++) {
			String hashTag = hashTagList.get(k);
			hashTag_final = hashTag + " " + hashTag_final;
		}

		int fur_scrap_num = furniture_arrDao.getCountScrap(fur_arr_plan_no);

		fur_arr.setFur_arr_room_kind(furArrRoomKind_final);
		fur_arr.setFur_arr_con(furArrCon_final);
		fur_arr.setFur_arr_plan_scrap_num(fur_scrap_num);
		fur_arr.setFur_arr_hashtag_name(hashTag_final);

		return fur_arr;
	}

}
