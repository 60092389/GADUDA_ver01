package kr.co.gaduda.furniture.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.furniture.dao.IFurnitureDao;
import kr.co.gaduda.furniture.service.IFurnitureService;
import kr.co.gaduda.furniture.vo.FurnitureVO;


@Service
public class FurnitureService implements IFurnitureService {
	
	@Autowired
	private IFurnitureDao furDao;
	
	@Override
	public List<FurnitureVO> furList(){
		
		List<FurnitureVO> fur_list = new ArrayList<FurnitureVO>();
		
		int fur_num = furDao.countFur();
		
		for(int fur_no = 0; fur_no < fur_num ; fur_no++ ){
			FurnitureVO furVO = new FurnitureVO();
			
			furVO = furDao.getFurniture(fur_no+1);
			String fur_img_loc = furDao.fur_pic_loc_Get(fur_no+1);
			furVO.setFur_pic_loc(fur_img_loc);
			
			fur_list.add(furVO);
		}
		
		return fur_list;
	}
	
	public FurnitureVO furDetailView(int fur_no){
		FurnitureVO furVO = new FurnitureVO();
		
		furVO = furDao.getFurniture(fur_no);
		String fur_img_loc = furDao.fur_pic_loc_Get(fur_no);
		furVO.setFur_pic_loc(fur_img_loc);
		
		System.out.println(furVO);
		
		return furVO;
	}
}
