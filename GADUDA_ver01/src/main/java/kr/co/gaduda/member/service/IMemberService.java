package kr.co.gaduda.member.service;

import java.util.List;

import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
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
}