package kr.co.gaduda.member.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.member.dao.impl.MemberDao;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.service.IMemberService;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
import kr.co.gaduda.member.vo.MemberFurArrVO;
import kr.co.gaduda.member.vo.MemberVO;
@Service
public class MemberService implements IMemberService {
	
	@Autowired
	private MemberDao memberDAO;
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
	public void update_mem(MemberDTO memberDTO) {
		memberDAO.update_mem(memberDTO);
		
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
	public void update_mem_pic(MemberDTO memberDTO) {
		memberDAO.update_mem_img(memberDTO);

		
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
	public void follow_change(FollowDTO followDTO) {
		memberDAO.follow_change(followDTO);
		memberDAO.follow_change1(followDTO);
		
	}

	@Override
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

}
