package kr.co.gaduda.member.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gaduda.furniture.dao.impl.FurnitureDao;
import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.member.dao.impl.MemberDao;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.service.IMemberService;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
import kr.co.gaduda.member.vo.MemberFurArrVO;
import kr.co.gaduda.member.vo.MemberLogVO;
import kr.co.gaduda.member.vo.MemberVO;
@Service
public class MemberService implements IMemberService {
	
	@Autowired
	private MemberDao memberDAO;
	
	@Autowired
	private FurnitureDao furnitureDao;
	
	@Override
	public int joinMember(MemberDTO memberDTO) {
		return memberDAO.joinMember(memberDTO);
	}

	@Override
	public int idchk(String mem_id) {
		return memberDAO.idchk(mem_id);
	}

	@Override
	public MemberVO login_chk(MemberDTO memberDTO) {
		return memberDAO.login_chk(memberDTO);
	}

	@Override
	public void deletemember(MemberDTO memberDTO) {
		memberDAO.deletemember(memberDTO);
		
	}

	@Override
	public int chkmem_pw(MemberDTO memberDTO) {
		return memberDAO.chkmem_pw(memberDTO);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,
				rollbackFor={Exception.class})
	public void update_mem(MemberDTO memberDTO) {
		try {
			memberDAO.update_mem(memberDTO);
			memberDAO.update_fur_arr_good_nick(memberDTO);
			memberDAO.update_fur_arr_repl_nick(memberDTO);
			memberDAO.update_fur_good_nick(memberDTO);
			memberDAO.update_fur_repl_nick(memberDTO);
		} catch (Exception e) {
			
		}

		
	}

	@Override
	public int update_mem_pw(MemberDTO memberDTO) {
		
		return memberDAO.update_mem_pw(memberDTO); 
	}

	@Override
	public int update_mem_pw_chk(MemberDTO memberDTO) {
		return memberDAO.update_mem_pw_chk(memberDTO);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED,
				rollbackFor={Exception.class})
	public void update_mem_pic(MemberDTO memberDTO) {
		try {
			memberDAO.update_mem_img(memberDTO);
			memberDAO.update_fur_arr_good_img(memberDTO);
			memberDAO.update_fur_arr_repl_img(memberDTO);
			memberDAO.update_fur_good_img(memberDTO);
			memberDAO.update_fur_repl_img(memberDTO);
		} catch (Exception e) {
		
		}

		
	}

	@Override
	public int follower_info(FollowDTO followDTO) {
		return memberDAO.follower_info(followDTO);
	}

	@Override
	public int following_info(FollowDTO followDTO) {
		
		return memberDAO.following_info(followDTO);
	}

	@Override
	public List<Follower_VO> follower_list(FollowDTO followDTO) {
		
		
		return memberDAO.follower_list(followDTO);
	}

	@Override
	public List<Following_VO> following_list(FollowDTO followDTO) {
		
		return memberDAO.following_list(followDTO);
	}

	@Override
	public int following_available(FollowDTO followDTO) {
		return memberDAO.following_available(followDTO);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,
				rollbackFor={Exception.class})
	public void follow_change(FollowDTO followDTO) {
		try {
			memberDAO.follow_change(followDTO);
			memberDAO.follow_change1(followDTO);
		} catch (Exception e) {
			
		}
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,
				rollbackFor={Exception.class})
	public void unfollow_change(FollowDTO followDTO) {
		memberDAO.unfollow_change(followDTO);
		memberDAO.unfollow_change1(followDTO);
		
	}
	@Override
	public int addfollow(FollowDTO followDTO){
		return memberDAO.addfollow(followDTO);
	}
	
	@Override
	public int add2follow(FollowDTO followDTO){
		return memberDAO.add2follow(followDTO);
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED,
				rollbackFor={Exception.class})
	public void delfollow(FollowDTO followDTO){
		try {
			memberDAO.delfollow(followDTO);
			memberDAO.del2follow(followDTO);
		} catch (Exception e) {

		}

	}
	@Override
	public int unfollow_available(FollowDTO followDTO) {
		return memberDAO.unfollow_available(followDTO);
	}
	
	@Override
	public List<MemberFurArrVO> callMyFurArr(String mem_id) {
		return memberDAO.callMyFurArr(mem_id);
	}

	@Override
	public int getCountScrap(int fur_arr_plan_no) {
		return memberDAO.getCountScrap(fur_arr_plan_no);
	}

	@Override
	public String getFurCon(int fur_arr_plan_no){
		String furArrCon = "";
		List<String> conarr = memberDAO.getFurCon(fur_arr_plan_no);
		for(int i = 0 ; i < conarr.size() ; i++){
			furArrCon = conarr.get(i) + " " + furArrCon;
		}
		return furArrCon;
	}

	@Override
	public String getRoomKind(int fur_arr_plan_no){
		String furArrRoomKind = "";
		List<String> roomkind = memberDAO.getRoomKind(fur_arr_plan_no);
		for(int i = 0 ; i < roomkind.size() ; i++){
			furArrRoomKind = roomkind.get(i) + " " + furArrRoomKind;
		}
		return furArrRoomKind;
	}

	@Override
	public String getHashTag(int fur_arr_plan_no){
		String furArrHashTag = "";
		List<String> hashtag = memberDAO.getHashTag(fur_arr_plan_no);
		for(int i = 0 ; i < hashtag.size() ; i++){
			furArrHashTag = hashtag.get(i) + " " + furArrHashTag;
		}
		return furArrHashTag;
	}
	
	@Override
	public List<FurnitureListViewVO> getRecentFindFur(String mem_id) {
		
		List<MemberLogVO> log_list = memberDAO.getMember_log_url(mem_id);
		
		String[] part;
		
		List<Integer> find_fur_no_list = new ArrayList<Integer>();
		
		List<FurnitureListViewVO> recent_view_fur_list = new ArrayList<FurnitureListViewVO>();
		FurnitureListViewVO recent_view_fur;
		
		for(int i=0; i<log_list.size(); i++){
			String url = log_list.get(i).getMem_acc_loc();
			//System.out.println(url);
			
			part = url.split("/");
			String fur_no_part = part[5];
			
			String fur_no_str = fur_no_part.replaceAll("\\D", "");
			//System.out.println(fur_no_str);
			
			int fur_no = Integer.parseInt(fur_no_str);
			//System.out.println(fur_no);
			
			find_fur_no_list.add(fur_no);
		}
		
		//중복값까지 제거한 최근 본 가구 번호들
		List<Integer> fur_no_list = new ArrayList<Integer>();
		
		//중복된 값 제거
		for(int j=0; j<find_fur_no_list.size(); j++){
			if(!fur_no_list.contains(find_fur_no_list.get(j))){
				fur_no_list.add(find_fur_no_list.get(j));
			}
		}

		//최근본순서로 리스트에 저장
		for(int i=fur_no_list.size()-1; i>=0; i--){
			System.out.println(fur_no_list.get(i));
			recent_view_fur = new FurnitureListViewVO();
			recent_view_fur = furnitureDao.getFindRecentFur(fur_no_list.get(i));
			//System.out.println(recent_view_fur);
			recent_view_fur_list.add(recent_view_fur);	
		}
		
		return recent_view_fur_list;
	}
	
	@Override
	public List<FurnitureArrReplyListVO> MyFurArrReplyList(String mem_id){
		return memberDAO.MyFurArrReplyList(mem_id);
	}

}
