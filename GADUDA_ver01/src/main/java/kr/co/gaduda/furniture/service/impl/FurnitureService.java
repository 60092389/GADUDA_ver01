package kr.co.gaduda.furniture.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.furniture.dao.IFurnitureDao;
import kr.co.gaduda.furniture.service.IFurnitureService;
import kr.co.gaduda.furniture.vo.FurnitureDetailVO;
import kr.co.gaduda.furniture.vo.FurnitureVO;


@Service
public class FurnitureService implements IFurnitureService {
	
	@Autowired
	private IFurnitureDao furnitureDao;

	@Override
	public List<FurnitureVO> furList() {

		List<FurnitureVO> fur_list = new ArrayList<FurnitureVO>();

		int fur_num = furnitureDao.countFur();
		
		for (int fur_no = 0; fur_no < fur_num; fur_no++) {
			FurnitureVO furVO = new FurnitureVO();

			furVO = furnitureDao.getFurniture(fur_no + 1);
			List<String> fur_pic_loc = furnitureDao.fur_pic_loc_Get(fur_no + 1);

			String fur_pic_loc_main = fur_pic_loc.get(0).toString();

			furVO.setFur_pic_loc(fur_pic_loc_main);

			fur_list.add(furVO);
		}

		return fur_list;
	}

	@Override
	public FurnitureDetailVO furDetailView(int fur_no) {

		FurnitureDetailVO furdeVO = new FurnitureDetailVO();

		furdeVO = furnitureDao.getDetailFurniture(fur_no);
		
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
		furdeVO.setFur_pic_loc(fur_pic_loc_list);
		furdeVO.setFur_con(fur_con);
		furdeVO.setFur_kind(fur_kind);

		return furdeVO;
	}
	
	public List<String> furDetailViewPic(int fur_no){
		List<String> fur_pic_loc_list = furnitureDao.fur_pic_loc_Get(fur_no);
		return fur_pic_loc_list;
	}
}
