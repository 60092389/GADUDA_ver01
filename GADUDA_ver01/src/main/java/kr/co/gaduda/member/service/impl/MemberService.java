package kr.co.gaduda.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gaduda.member.dao.impl.MemberDao;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.service.IMemberService;
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

}
