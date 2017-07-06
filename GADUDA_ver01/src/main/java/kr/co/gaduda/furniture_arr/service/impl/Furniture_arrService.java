package kr.co.gaduda.furniture_arr.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.furniture_arr.dao.IFurniture_arrDao;
import kr.co.gaduda.furniture_arr.service.IFurniture_arrService;
import kr.co.gaduda.furniture_arr.vo.Furniture_arrVO;

@Service
public class Furniture_arrService implements IFurniture_arrService {

	@Autowired
	private IFurniture_arrDao furniture_arrDao;

	@Override
	public List<Furniture_arrVO> furArrList() {
		List<Furniture_arrVO> fur_arr_list = new ArrayList<Furniture_arrVO>();

		int fur_arr_num = furniture_arrDao.countFurArr();

		for (int fur_arr_no = 0; fur_arr_no < fur_arr_num; fur_arr_no++) {
			Furniture_arrVO furArrVO = new Furniture_arrVO();

			String furArrCon = "";
			List<String> fur_arr_con_list = furniture_arrDao.getFurCon(fur_arr_no + 1);

			furArrVO = furniture_arrDao.getFurArr(fur_arr_no + 1);
			String furRoomKind = furniture_arrDao.getRoomKind(fur_arr_no + 1);

			for (int i = 0; i < fur_arr_con_list.size(); i++) {
				furArrCon = fur_arr_con_list.get(i) + "  " + furArrCon;
			}

			furArrVO.setFur_arr_con(furArrCon);
			furArrVO.setFur_arr_room_kind(furRoomKind);

			fur_arr_list.add(furArrVO);
		}

		return fur_arr_list;
	}
}
