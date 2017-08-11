package kr.co.gaduda.furniture_arr.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.furniture_arr.dao.IFurniture_arrDao;
import kr.co.gaduda.furniture_arr.dto.FurnitureArrScrapDTO;
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
import kr.co.gaduda.member.dto.FollowDTO;

@Service
public class Furniture_arrService implements IFurniture_arrService {

	@Autowired
	private IFurniture_arrDao furniture_arrDao;

	@Override
	public List<Furniture_arrVO> furArrList() {

		List<Furniture_arrVO> fur_arr_list = furniture_arrDao.getFurArr();

		for (int i = 0; i < fur_arr_list.size(); i++) {

			int fur_arr_plan_no = fur_arr_list.get(i).getFur_arr_plan_no();
			//2017-08-07 추가(수정)
			String mem_id = fur_arr_list.get(i).getMem_id();
			Furniture_arrMemberVO memVO = furniture_arrDao.getFurArrUser(mem_id);
			fur_arr_list.get(i).setMem_nickname(memVO.getMem_nickname());
			fur_arr_list.get(i).setMem_profile_pic(memVO.getMem_profile_pic());

			List<String> furArrRoomKind = furniture_arrDao.FurArrRoomKind(fur_arr_plan_no);
			List<String> furArrCon = furniture_arrDao.getFurCon(fur_arr_plan_no);
			String furArrRoomKind_final = "";
			String furArrCon_final = "";
			
			
			for (int j = 0; j < furArrCon.size(); j++) {
				String concept = furArrCon.get(j);
				furArrCon_final = concept + " " + furArrCon_final;
			}

			for (int j = 0; j < furArrRoomKind.size(); j++) {
				String roomkind = furArrRoomKind.get(j);
				furArrRoomKind_final = roomkind + " " + furArrRoomKind_final;
			}
			
			int fur_scrap_num = furniture_arrDao.getCountScrap(fur_arr_plan_no);

			fur_arr_list.get(i).setFur_arr_room_kind(furArrRoomKind_final);
			fur_arr_list.get(i).setFur_arr_con(furArrCon_final);
			fur_arr_list.get(i).setFur_arr_plan_scrap_num(fur_scrap_num);
		}

		return fur_arr_list;
	}

	@Override
	public List<Furniture_arrVO> furArrList_roomkind(String room_kind_def_name) {
		List<Furniture_arrVO> fur_arr_list_roomkind = new ArrayList<Furniture_arrVO>();

		List<Furniture_arrVO> furArrVO = new ArrayList<Furniture_arrVO>();

		List<Furniture_arrVO> result = new ArrayList<Furniture_arrVO>();

		furArrVO = furniture_arrDao.getFurArr_roomkind(room_kind_def_name);

		for (int i = 0; i < furArrVO.size(); i++) {
			Furniture_arrVO vo = new Furniture_arrVO();

			int fur_arr_plan_no = furArrVO.get(i).getFur_arr_plan_no();
			List<String> furArrRoomKind = furniture_arrDao.FurArrRoomKind(fur_arr_plan_no);
			List<String> concepts = furniture_arrDao.getFurCon(fur_arr_plan_no);

			String furArrRoomKind_final = "";
			String concept_final = "";

			System.out.println("가구배치도 컨셉사이즈 - " + concepts.size());

			for (int j = 0; j < concepts.size(); j++) {

				String concept = concepts.get(j);

				concept_final = concept + " " + concept_final;

			}
			for (int j = 0; j < furArrRoomKind.size(); j++) {
				String roomkind = furArrRoomKind.get(j);
				furArrRoomKind_final = roomkind + " " + furArrRoomKind_final;
			}
			int fur_arr_plan_scrap_num = furniture_arrDao.getCountScrap(fur_arr_plan_no);
			vo.setFur_arr_plan_no(fur_arr_plan_no);
			vo.setFur_arr_plan_img_loc(furArrVO.get(i).getFur_arr_plan_img_loc());
			vo.setFur_arr_name(furArrVO.get(i).getFur_arr_name());
			vo.setMem_id(furArrVO.get(i).getMem_id());
			vo.setFur_arr_con(concept_final);
			vo.setFur_arr_room_kind(furArrRoomKind_final);
			vo.setFur_arr_plan_good_num(furArrVO.get(i).getFur_arr_plan_good_num());
			vo.setFur_arr_plan_scrap_num(fur_arr_plan_scrap_num);
			vo.setFur_arr_plan_repl_num(furArrVO.get(i).getFur_arr_plan_repl_num());

			result.add(vo);

		}

		return result;

	}

	@Override
	public List<Furniture_arrVO> furArrList_concept(String concept_name) {
		List<Furniture_arrVO> fur_arr_list_concept = new ArrayList<Furniture_arrVO>();
		List<Furniture_arrVO> furArrVO = new ArrayList<Furniture_arrVO>();
		List<Furniture_arrVO> result = new ArrayList<Furniture_arrVO>();

		furArrVO = furniture_arrDao.getFurArr_concept(concept_name);
		for (int i = 0; i < furArrVO.size(); i++) {
			Furniture_arrVO vo = new Furniture_arrVO();
			int fur_arr_plan_no_con = furArrVO.get(i).getFur_arr_plan_no();
			List<String> concepts = furniture_arrDao.getFurCon(fur_arr_plan_no_con);
			List<String> furArrRoomKind = furniture_arrDao.FurArrRoomKind(fur_arr_plan_no_con);
			String concept_final = "";
			String furArrRoomKind_final = "";
			for (int j = 0; j < concepts.size(); j++) {
				String concept = concepts.get(j);
				concept_final = concept + " " + concept_final;
			}
			for (int j = 0; j < furArrRoomKind.size(); j++) {
				String roomkind = furArrRoomKind.get(j);
				furArrRoomKind_final = roomkind + " " + furArrRoomKind_final;
			}
			int fur_arr_plan_scrap_num = furniture_arrDao.getCountScrap(fur_arr_plan_no_con);
			vo.setFur_arr_plan_no(fur_arr_plan_no_con);
			vo.setFur_arr_plan_img_loc(furArrVO.get(i).getFur_arr_plan_img_loc());
			vo.setFur_arr_name(furArrVO.get(i).getFur_arr_name());
			vo.setMem_id(furArrVO.get(i).getMem_id());
			vo.setFur_arr_con(concept_final);
			vo.setFur_arr_room_kind(furArrRoomKind_final);
			vo.setFur_arr_plan_good_num(furArrVO.get(i).getFur_arr_plan_good_num());
			vo.setFur_arr_plan_scrap_num(fur_arr_plan_scrap_num);
			vo.setFur_arr_plan_repl_num(furArrVO.get(i).getFur_arr_plan_repl_num());

			result.add(vo);
		}

		return result;
	}

	@Override
	public List<Furniture_arrVO> furArrList_roomkind_concept(String room_kind_def_name, String concept_name) {
		List<Furniture_arrVO> fur_arr_list_roomkind = new ArrayList<Furniture_arrVO>();

		List<Furniture_arrVO> furArrVO = new ArrayList<Furniture_arrVO>();

		List<Furniture_arrVO> result = new ArrayList<Furniture_arrVO>();

		furArrVO = furniture_arrDao.getFurArr_roomkind(room_kind_def_name);

		for (int i = 0; i < furArrVO.size(); i++) {
			Furniture_arrVO vo = new Furniture_arrVO();

			int fur_arr_plan_no = furArrVO.get(i).getFur_arr_plan_no();

			List<String> concepts = furniture_arrDao.getFurCon(fur_arr_plan_no);
			List<String> furArrRoomKind = furniture_arrDao.FurArrRoomKind(fur_arr_plan_no);
			String concept_final = "";
			String furArrRoomKind_final = "";
			System.out.println("가구배치도 컨셉사이즈 - " + concepts.size());

			for (int j = 0; j < concepts.size(); j++) {

				String concept = concepts.get(j);

				concept_final = concept + " " + concept_final;

			}
			for (int j = 0; j < furArrRoomKind.size(); j++) {
				String roomkind = furArrRoomKind.get(j);
				furArrRoomKind_final = roomkind + " " + furArrRoomKind_final;
			}
			int fur_arr_plan_scrap_num = furniture_arrDao.getCountScrap(fur_arr_plan_no);

			vo.setFur_arr_plan_img_loc(furArrVO.get(i).getFur_arr_plan_img_loc());
			vo.setFur_arr_name(furArrVO.get(i).getFur_arr_name());
			vo.setMem_id(furArrVO.get(i).getMem_id());
			vo.setFur_arr_con(concept_final);
			vo.setFur_arr_room_kind(furArrRoomKind_final);
			vo.setFur_arr_plan_good_num(furArrVO.get(i).getFur_arr_plan_good_num());
			vo.setFur_arr_plan_scrap_num(fur_arr_plan_scrap_num);
			vo.setFur_arr_plan_repl_num(furArrVO.get(i).getFur_arr_plan_repl_num());
			vo.setFur_arr_plan_no(fur_arr_plan_no);

			if (vo.getFur_arr_con().contains(concept_name)) {

				vo.setFur_arr_con(concept_final);
				result.add(vo);
			}
		}

		return result;
	}

	@Override
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
	public int insertFurnitureArrReply(Map<String, Object> furArrReplyInfo) {
		int result = 0;

		int fur_arr_plan_no = Integer.parseInt((String) furArrReplyInfo.get("fur_arr_plan_no"));

		System.out.println("댓글 입력의 fur_arr_plan_no : " + fur_arr_plan_no);

		furniture_arrDao.insertFurnitureArrReply(furArrReplyInfo);
		result = furniture_arrDao.furnitureArrReplyNumUp(fur_arr_plan_no);

		return result;
	}

	@Override
	public int deleteFurnitureArrReply(Map<String, Object> furArrReplyInfo) {

		int result = 0;

		int fur_arr_plan_no = Integer.parseInt((String) furArrReplyInfo.get("fur_arr_plan_no"));

		System.out.println("댓글 삭제의 fur_arr_plan_no : " + fur_arr_plan_no);

		furniture_arrDao.deleteFurnitureArrReply(furArrReplyInfo);
		result = furniture_arrDao.furnitureArrReplyNumDown(fur_arr_plan_no);

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
	public List<Furniture_arrScrapListVO> furArrScrapList(int fur_arr_plan_no){
		return furniture_arrDao.furArrScrapList(fur_arr_plan_no);
	}
	
	//가구 방 종류 가져오기
	@Override
	public List<String> getRoomKind(){
		return furniture_arrDao.getRoomKind();
	}
	
	//가구 컨셉 종류 가져오기
	@Override 
	public List<String> getConceptKind(){
		return furniture_arrDao.getConceptKind();
	}
	
	//가구배치도 작성자를 내가 팔로우 했는지/아닌지
	@Override
	public int getFollowing(FollowDTO followdto){
		return furniture_arrDao.getFollowing(followdto);
	}
	
	//작성자가 나를 팔로우 했는지 확인하기
	@Override
	public int memFolMe(FollowDTO followdto){
		return furniture_arrDao.memFolMe(followdto);
	}
		

}
