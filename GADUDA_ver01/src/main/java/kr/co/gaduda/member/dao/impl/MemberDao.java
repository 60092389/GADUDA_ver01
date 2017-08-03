package kr.co.gaduda.member.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.member.dao.IMemberDao;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
import kr.co.gaduda.member.vo.MemberFurArrVO;
import kr.co.gaduda.member.vo.MemberVO;

@Repository
public class MemberDao implements IMemberDao {

	private static final String namespace = "kr.co.gaduda.mapper.MemberMapper";
	@Autowired
	SqlSession memberSqlSession;

	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public int joinMember(MemberDTO memberDTO) {
		int result;
		try {
			result = memberSqlSession.insert(namespace + ".joinMember", memberDTO);

		} catch (Exception e) {
			result = 0;
		}
		return result;
	}

	@Override
	public void update_mem_img(MemberDTO memberDTO) {
		memberSqlSession.update(namespace + ".update_img", memberDTO);

	}

	@Override
	public int idchk(String mem_id) {
		return memberSqlSession.selectOne(namespace + ".idchk", mem_id);
	}

	@Override
	public MemberVO login_chk(MemberDTO memberDTO) {

		return memberSqlSession.selectOne(namespace + ".loginMember", memberDTO);

	}

	@Override
	public void deletemember(MemberDTO memberDTO) {
		memberSqlSession.delete(namespace + ".deletemember", memberDTO);

	}

	@Override
	public int chkmem_pw(MemberDTO memberDTO) {
		return memberSqlSession.selectOne(namespace + ".chkmem_pw", memberDTO);
	}

	@Override
	public void update_mem(MemberDTO memberDTO) {
		memberSqlSession.update(namespace + ".update_mem", memberDTO);

	}

	@Override
	public int update_mem_pw(MemberDTO memberDTO) {
		return memberSqlSession.update(namespace + ".update_mem_pw", memberDTO);

	}

	@Override
	public int update_mem_pw_chk(MemberDTO memberDTO) {
		return memberSqlSession.selectOne(namespace + ".pwchk", memberDTO);
	}

	@Override
	public int follower_info(FollowDTO followDTO) {
		return memberSqlSession.selectOne(namespace + ".follower_info", followDTO);
	}

	@Override
	public int following_info(FollowDTO followDTO) {
		return memberSqlSession.selectOne(namespace + ".following_info", followDTO);
	}

	@Override
	public List<Follower_VO> follower_list(FollowDTO followDTO) {
		return memberSqlSession.selectList(namespace + ".follower_list", followDTO);
	}

	@Override
	public List<Following_VO> following_list(FollowDTO followDTO) {
		return memberSqlSession.selectList(namespace + ".following_list", followDTO);
	}

	@Override
	public int following_available(FollowDTO followDTO) {
		return memberSqlSession.selectOne(namespace + ".following_available", followDTO);
	}

	@Override
	public void follow_change(FollowDTO followDTO) {
		memberSqlSession.update(namespace + ".follow_change1", followDTO);

	}

	@Override
	public void follow_change1(FollowDTO followDTO) {
		memberSqlSession.update(namespace + ".follow_change2", followDTO);

	}

	@Override
	public void unfollow_change(FollowDTO followDTO) {
		memberSqlSession.update(namespace + ".unfollow_change1", followDTO);

	}

	@Override
	public void unfollow_change1(FollowDTO followDTO) {
		memberSqlSession.update(namespace + ".unfollow_change2", followDTO);

	}
	
	@Override
	public int addfollow(FollowDTO followDTO){
		return memberSqlSession.update(namespace + ".addfollow", followDTO);
	}
	
	@Override
	public int add2follow(FollowDTO followDTO){
		return memberSqlSession.update(namespace + ".add2follow", followDTO);
	}
	
	@Override
	public void delfollow(FollowDTO followDTO){
		memberSqlSession.delete(namespace + ".delfollow", followDTO);
	}
	
	@Override
	public void del2follow(FollowDTO followDTO){
		memberSqlSession.delete(namespace + ".del2follow", followDTO);
	}
	
	@Override
	public int unfollow_available(FollowDTO followDTO) {
		return memberSqlSession.selectOne(namespace + ".unfollow_available", followDTO);
	}
	
	@Override
	   public void member_log(Map<String, Object> memberInfo) {
	      
	            
	      Date d=new Date();
	      
	      
	      SimpleDateFormat formatType=new SimpleDateFormat("yyyy-MM-dd");
	      String date=formatType.format(d);
	      
	      memberInfo.put("mem_log_create_date", date);
	      
	      mongoTemplate.insert(memberInfo,"member_log");
	   }

	
	// 마이페이지 내 가구배치도 리스트 불러오기//
	@Override
	public List<MemberFurArrVO> callMyFurArr(String mem_id) {
		return memberSqlSession.selectList(namespace + ".callMyFurArr", mem_id);
	}

	@Override
	public int getCountScrap(int fur_arr_plan_no) {
		return memberSqlSession.selectOne(namespace + ".count_scrap", fur_arr_plan_no);
	}

	// 가구 방 컨셉 가져오기
	@Override
	public List<String> getFurCon(int fur_arr_plan_no) {
		return memberSqlSession.selectList(namespace + ".fur_arr_con", fur_arr_plan_no);
	}

	// 가구 방 종류 가져오기
	@Override
	public List<String> getRoomKind(int fur_arr_plan_no) {
		return memberSqlSession.selectList(namespace + ".fur_arr_room_kind", fur_arr_plan_no);
	}
	
	// 가구 방 해시태그 가져오기
	@Override
	public List<String> getHashTag(int fur_arr_plan_no) {
		return memberSqlSession.selectList(namespace + ".fur_arr_hashtag", fur_arr_plan_no);
	}

}
