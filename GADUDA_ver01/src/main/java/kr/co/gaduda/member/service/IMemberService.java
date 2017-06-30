package kr.co.gaduda.member.service;

import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.vo.MemberVO;

public interface IMemberService {
	public int joinMember(MemberDTO memberDTO);
	public int idchk(String mem_id);
	public MemberVO login_chk(MemberDTO memberDTO);
	public void deletemember(MemberDTO memberDTO);
}
