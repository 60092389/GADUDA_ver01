package kr.co.gaduda.member.service;

import java.util.List;

import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
import kr.co.gaduda.member.vo.MemberFurArrVO;
import kr.co.gaduda.member.vo.MemberVO;

public interface IMemberService {
	public int joinMember(MemberDTO memberDTO);
	public int idchk(String mem_id);
	public MemberVO login_chk(MemberDTO memberDTO);
	public void deletemember(MemberDTO memberDTO);
	public int chkmem_pw(MemberDTO memberDTO);
	public void update_mem(MemberDTO memberDTO);
	public int update_mem_pw(MemberDTO memberDTO);
	public int update_mem_pw_chk(MemberDTO memberDTO);
	public void update_mem_pic(MemberDTO memberDTO);
	
	public int follower_info(FollowDTO followDTO);
	public int following_info(FollowDTO followDTO);
	public List<Follower_VO> follower_list(FollowDTO followDTO);
	public List<Following_VO> following_list(FollowDTO followDTO);
	
	public int following_available(FollowDTO followDTO);
	
	public void follow_change(FollowDTO followDTO);
	public void unfollow_change(FollowDTO followDTO);
	
	public int addfollow(FollowDTO followDTO);
	public int add2follow(FollowDTO followDTO);
	public void delfollow(FollowDTO followDTO);
	
	public int unfollow_available(FollowDTO followDTO);
	
	//나의 가구배치도 정보 가져오기
	public List<MemberFurArrVO> callMyFurArr(String mem_id);
	public int getCountScrap(int fur_arr_plan_no);
	public String getFurCon(int fur_arr_plan_no);
	public String getRoomKind(int fur_arr_plan_no);
	public String getHashTag(int fur_arr_plan_no);
	
	//마이페이지에 최근에본 가구 정보 가져가기
	public List<FurnitureListViewVO> getRecentFindFur(String mem_id);
	
	//나의 가구 배치도 내용 가져오기
	public List<FurnitureArrReplyListVO> MyFurArrReplyList(String mem_id);
	
	//로그아웃시 회원접속기록에 추가
	public void logoutAddMemberAcchHistory(String mem_id);
}
