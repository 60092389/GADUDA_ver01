package kr.co.gaduda.member.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.member.dao.IMemberDao;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
import kr.co.gaduda.member.vo.MemberFurArrVO;
import kr.co.gaduda.member.vo.MemberLogVO;
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
	
	//멤버로그가져오기
	@Override
	public List<MemberLogVO> getMember_log_url(String mem_id) {

		//오늘 날짜
		Date d=new Date();
	   
	    SimpleDateFormat formatType=new SimpleDateFormat("yyyy-MM-dd");
	    String date=formatType.format(d);
	    
	    Calendar cal = new GregorianCalendar();
		cal.add(Calendar.DATE, -1);
		
		//어제날짜
		Date yester = cal.getTime();
		SimpleDateFormat formatype = new SimpleDateFormat("yyyy-MM-dd");
		String yester_date = formatype.format(yester);
	      
		
		//String tagName = "fur_no";
		//System.out.println("나알짜아 : " + date);
		
		Query query = new Query(new Criteria().andOperator(Criteria.where("mem_id").is(mem_id),
				Criteria.where("mem_acc_loc").regex("fur_no"),
				new Criteria().orOperator(Criteria.where("mem_log_create_date").is(date),
						Criteria.where("mem_log_create_date").is(yester_date))
				));

		query.limit(10);
		
		return mongoTemplate.find(query, MemberLogVO.class, "member_log");
	}
	
	@Override
	public List<FurnitureArrReplyListVO> MyFurArrReplyList(String mem_id){
		

		Query query = new Query(new Criteria().andOperator(Criteria.where("fur_arr_writer").is(mem_id)));

		List<FurnitureArrReplyListVO> list = mongoTemplate.find(query, FurnitureArrReplyListVO.class,
				"furniture_arrangement_reply");
		
		query.limit(20);
		

		return list;

	}
	
	@Override
	public void update_fur_arr_good_nick(MemberDTO memberDTO) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mem_id").is(memberDTO.getMem_id()));
		
		Update update = new Update();
		
		update.set("mem_nickname", memberDTO.getMem_nickname());
		mongoTemplate.updateMulti(query, update, "furniture_arrangement_good");
	}
	
	@Override
	public void update_fur_arr_repl_nick(MemberDTO memberDTO) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mem_id").is(memberDTO.getMem_id()));
		
		Update update = new Update();
		
		update.set("mem_nickname", memberDTO.getMem_nickname());
		mongoTemplate.updateMulti(query, update, "furniture_arrangement_reply");
	}
	
	@Override
	public void update_fur_good_nick(MemberDTO memberDTO) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mem_id").is(memberDTO.getMem_id()));
		
		Update update = new Update();
		
		update.set("mem_nickname", memberDTO.getMem_nickname());
		mongoTemplate.updateMulti(query, update, "furniture_good");
		
	}
	
	@Override
	public void update_fur_repl_nick(MemberDTO memberDTO) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mem_id").is(memberDTO.getMem_id()));
		
		Update update = new Update();
		
		update.set("mem_nickname", memberDTO.getMem_nickname());
		mongoTemplate.updateMulti(query, update, "furniture_reply");
	}
	
	@Override
	public void update_fur_arr_good_img(MemberDTO memberDTO) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mem_id").is(memberDTO.getMem_id()));
		
		Update update = new Update();
		
		update.set("mem_profile_pic", memberDTO.getMem_profile_pic());
		mongoTemplate.updateMulti(query, update, "furniture_arrangement_good");
	}
	
	@Override
	public void update_fur_arr_repl_img(MemberDTO memberDTO) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mem_id").is(memberDTO.getMem_id()));
		
		Update update = new Update();
		
		update.set("mem_profile_pic", memberDTO.getMem_profile_pic());
		mongoTemplate.updateMulti(query, update, "furniture_arrangement_reply");
	}
	
	@Override
	public void update_fur_good_img(MemberDTO memberDTO) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mem_id").is(memberDTO.getMem_id()));
		
		Update update = new Update();
		
		update.set("mem_profile_pic", memberDTO.getMem_profile_pic());
		mongoTemplate.updateMulti(query, update, "furniture_good");
	}
	
	@Override
	public void update_fur_repl_img(MemberDTO memberDTO) {
		Query query = new Query();
		query.addCriteria(Criteria.where("mem_id").is(memberDTO.getMem_id()));
		
		Update update = new Update();
		
		update.set("mem_profile_pic", memberDTO.getMem_profile_pic());
		mongoTemplate.updateMulti(query, update, "furniture_reply");
	}



}
