package kr.co.gaduda.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.member.dao.IMemberDao;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
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
	public void update_mem_img(MemberDTO memberDTO) {
		memberSqlSession.update(namespace+".update_img",memberDTO);
		
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

	@Override
	public int chkmem_pw(MemberDTO memberDTO) {
		return memberSqlSession.selectOne(namespace+".chkmem_pw",memberDTO);
	}

	@Override
	public void update_mem(MemberDTO memberDTO) {
		memberSqlSession.update(namespace+".update_mem",memberDTO);
		
	}

	@Override
	public int update_mem_pw(MemberDTO memberDTO) {
		return memberSqlSession.update(namespace+".update_mem_pw",memberDTO);
		
	}

	@Override
	public int update_mem_pw_chk(MemberDTO memberDTO) {
		return memberSqlSession.selectOne(namespace+".pwchk",memberDTO);
	}
	
	
	@Override
	public int follower_info(FollowDTO followDTO) {
		return memberSqlSession.selectOne(namespace+".follower_info", followDTO);
	}

	@Override
	public int following_info(FollowDTO followDTO) {
		return memberSqlSession.selectOne(namespace+".following_info", followDTO);
	}

	@Override
	public List<Follower_VO>  follower_list(FollowDTO followDTO) {
		return memberSqlSession.selectList(namespace+".follower_list",followDTO);
	}

	@Override
	public List<Following_VO> following_list(FollowDTO followDTO) {
		return memberSqlSession.selectList(namespace+".following_list",followDTO);
	}

	@Override
	public int following_available(FollowDTO followDTO) {
		return memberSqlSession.selectOne(namespace+".following_available",followDTO);
	}

	@Override
	public void follow_change(FollowDTO followDTO) {
		memberSqlSession.update(namespace+".follow_change1",followDTO);
		
	}

	@Override
	public void follow_change1(FollowDTO followDTO) {
		memberSqlSession.update(namespace+".follow_change2",followDTO);
		
	}

	@Override
	public void unfollow_change(FollowDTO followDTO) {
		memberSqlSession.update(namespace+".unfollow_change1",followDTO);
		
	}

	@Override
	public void unfollow_change1(FollowDTO followDTO) {
		memberSqlSession.update(namespace+".unfollow_change2",followDTO);
		
	}

}
