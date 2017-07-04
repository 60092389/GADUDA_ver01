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
	private IFurniture_arrDao furArrDao;

	@Override
	public List<Furniture_arrVO> furArrList() {
		List<Furniture_arrVO> fur_arr_list = new ArrayList<Furniture_arrVO>();

		int fur_arr_num = furArrDao.countFurArr();

		for (int fur_arr_no = 0; fur_arr_no < fur_arr_num; fur_arr_no++) {
			Furniture_arrVO furArrVO = new Furniture_arrVO();

			furArrVO = furArrDao.getFurArr(fur_arr_no + 1);

			fur_arr_list.add(furArrVO);
		}

		return fur_arr_list;
	}
}
