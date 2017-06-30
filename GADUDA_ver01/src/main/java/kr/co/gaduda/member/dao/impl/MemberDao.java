package kr.co.gaduda.member.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.member.dao.IMemberDao;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.vo.MemberVO;

@Repository
public class MemberDao implements IMemberDao {
	private static final String namespace="kr.co.gaduda.mapper.MemberMapper";
	@Autowired
	SqlSession memberSqlSession;
	@Override
	public int joinMember(MemberDTO memberDTO) {
		int result;
		try{
			result = memberSqlSession.insert(namespace+".joinMember",memberDTO);
			
		}catch(Exception e){
			result =0;
		}
		return result;
	}

	@Override
	public int idchk(String mem_id) {
		return memberSqlSession.selectOne(namespace+".idchk",mem_id);
	}

	@Override
	public MemberVO login_chk(MemberDTO memberDTO) {

		return memberSqlSession.selectOne(namespace+".loginMember",memberDTO);
		
	}

	@Override
	public void deletemember(MemberDTO memberDTO) {
		memberSqlSession.delete(namespace+".deletemember",memberDTO);
		
	}

}
