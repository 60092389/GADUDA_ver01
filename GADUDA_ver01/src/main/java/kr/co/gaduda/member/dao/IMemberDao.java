package kr.co.gaduda.member.dao;

import java.util.List;
import java.util.Map;

import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberAccHistoryDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
import kr.co.gaduda.member.vo.MemberFurArrVO;
import kr.co.gaduda.member.vo.MemberLogVO;
import kr.co.gaduda.member.vo.MemberVO;

public interface IMemberDao {
	public int joinMember(MemberDTO memberDTO);
	public int idchk(String mem_id);
	public MemberVO login_chk(MemberDTO memberDTO);
	public void deletemember(MemberDTO memberDTO);
	public int chkmem_pw(MemberDTO memberDTO);
	public void update_mem(MemberDTO memberDTO);
	public int update_mem_pw(MemberDTO memberDTO);
	public int update_mem_pw_chk(MemberDTO memberDTO);
	public void update_mem_img(MemberDTO memberDTO);
	
	public int follower_info(FollowDTO followDTO);
	public int following_info(FollowDTO followDTO);
	public List<Follower_VO> follower_list(FollowDTO followDTO);
	public List<Following_VO> following_list(FollowDTO followDTO);
	public int following_available(FollowDTO followDTO);
	
	public void follow_change(FollowDTO followDTO);
	public void follow_change1(FollowDTO followDTO);
	public void unfollow_change(FollowDTO followDTO);
	public void unfollow_change1(FollowDTO followDTO);
	public int addfollow(FollowDTO followDTO);
	public int add2follow(FollowDTO followDTO);
	public int unfollow_available(FollowDTO followDTO);
	public void delfollow(FollowDTO followDTO);
	public void del2follow(FollowDTO followDTO);
	
	public void member_log(Map<String, Object> memberInfo);
	
	
	//나의 가구배치도 정보 가져오기
	public List<MemberFurArrVO> callMyFurArr(String mem_id);
	public int getCountScrap(int fur_arr_plan_no);
	public List<String> getFurCon(int fur_arr_plan_no);
	public List<String> getRoomKind(int fur_arr_plan_no);
	public List<String> getHashTag(int fur_arr_plan_no);
	
	//해당 회원 로그 가져오기
	public List<MemberLogVO> getMember_log_url(String mem_id);
	
	//댓글 알림
	public List<FurnitureArrReplyListVO> MyFurArrReplyList(String mem_id);
	
	//가구배치도댓글 닉네임변경
	public void update_fur_arr_repl_nick(MemberDTO memberDTO);
	//가구배치도좋아요 닉네임변경
	public void update_fur_arr_good_nick(MemberDTO memberDTO);
	//가구좋아요 닉네임변경
	public void update_fur_good_nick(MemberDTO memberDTO);
	//가구댓글 닉네임변경
	public void update_fur_repl_nick(MemberDTO memberDTO);
	
	//가구배치도댓글 회원이미지변경
	public void update_fur_arr_repl_img(MemberDTO memberDTO);
	//가구배치도좋아요 회원이미지변경
	public void update_fur_arr_good_img(MemberDTO memberDTO);
	//가구좋아요 회원이미지변경
	public void update_fur_good_img(MemberDTO  memberDTO);
	//가구댓글 회원이미지변경
	public void update_fur_repl_img(MemberDTO memberDTO);
	
	//회원접속기록 추가
	public void addMemberAccHistory(MemberAccHistoryDTO memberAccHistoryDTO);
	
} 
