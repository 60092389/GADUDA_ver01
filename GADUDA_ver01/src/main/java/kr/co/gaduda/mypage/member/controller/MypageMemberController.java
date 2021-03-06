package kr.co.gaduda.mypage.member.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.furniture.vo.FurnitureListViewVO;
import kr.co.gaduda.furniture_arr.vo.FurnitureArrReplyListVO;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.service.impl.MemberService;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
import kr.co.gaduda.member.vo.MemberFurArrVO;
import kr.co.gaduda.member.vo.MemberVO;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/mypage/member")
public class MypageMemberController implements ServletContextAware {
	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub

	}

	@Autowired
	private MemberService memberService;
	private ServletContext servletContext;

	@RequestMapping(value = URLs.URI_MYPAGE_MEMBER)
	public String mypage_member(Model model, HttpServletRequest request) {
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		if (memVO == null) {
			return Pages.VIEW_LOGIN_FAILED;
		}
		String mem_id = memVO.getMem_id();
		FollowDTO followDTO = new FollowDTO();
		followDTO.setMem_id(mem_id);
		int follower = memberService.follower_info(followDTO);
		int following = memberService.following_info(followDTO);
		
		List<FurnitureListViewVO> recent_view_fur_list = memberService.getRecentFindFur(mem_id);
		List<FurnitureArrReplyListVO> repllist = memberService.MyFurArrReplyList(mem_id);
		
		
		
		model.addAttribute("recent_view", 1);
		model.addAttribute("repl_view", 1);
		
		if(recent_view_fur_list.isEmpty()){
			model.addAttribute("recent_view", 0);
		}
		if(repllist.isEmpty()){
			model.addAttribute("repl_view", 0);
		}
		model.addAttribute("repllist", repllist);
		model.addAttribute("follower", follower);
		model.addAttribute("following", following);
		model.addAttribute("recent_view_fur_list", recent_view_fur_list);

		return Pages.VIEW_MYPAGE_MEMBER;
	}

	@RequestMapping(value = URLs.URI_DELETE_MEMBER)
	public String deleteMember() {

		return Pages.VIEW_DEL_MEMBER;
	}

	@RequestMapping(value = URLs.URI_DELETE_MEMBER_CHK)
	public String deleteMember_chk(MemberDTO memberDTO, HttpServletRequest request) {
		memberDTO.setMem_id(request.getParameter("mem_id"));
		memberDTO.setMem_pw(request.getParameter("mem_pw"));
		memberService.deletemember(memberDTO);
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");

		if (memVO.getMem_pw().equals(memberDTO.getMem_pw())) {
			request.getSession().invalidate();
			return URLs.URI_MAIN_REDIRECT;
		}
		return Pages.VIEW_DEL_MEMBER_FAILED;

	}

	@RequestMapping(value = URLs.URI_UPDATE_MEMBER_FIRST)
	public String update_mem_first() {

		return Pages.VIEW_UPDATE_MEMBER_FIRST;
	}

	@RequestMapping(value = URLs.URI_UPDATE_MEMBER)
	public String update_mem() {

		return Pages.VIEW_MYPAGE_MEMBER;
	}

	@RequestMapping(value = URLs.URI_UPDATE_MEMBER_CHK, method = RequestMethod.POST)
	public String update_mem_chk(MemberDTO memberDTO, Model model, HttpServletRequest request) {

		memberService.update_mem(memberDTO);
		model.addAttribute("member");
		System.out.println("회원수정 입력 후 닉네임 : " + memberDTO.getMem_nickname());
		System.out.println("회원수정 입력 후 성별 : " + memberDTO.getMem_sex());
		System.out.println("회원수정 입력 후 소개 : " + memberDTO.getMem_intro());
		System.out.println("회원수정 입력 후 생일 : " + memberDTO.getMem_birth());
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		memVO.setMem_nickname(memberDTO.getMem_nickname());
		memVO.setMem_sex(memberDTO.getMem_sex());
		memVO.setMem_intro(memberDTO.getMem_intro());
		memVO.setMem_birth(memberDTO.getMem_birth());
		request.getSession().setAttribute("member", memVO);
		
		return "redirect:"+URLs.URI_MYPAGE_MEMBER_FULL;
	}

	@RequestMapping(value = URLs.URI_UPDATE_MEMBER_PW_PAGE)
	public String update_mem_pw_page() {
		return Pages.VIEW_UPDATE_MEMBER_PW;
	}

	@RequestMapping(value = URLs.URI_UPDATE_MEMBER_PW)
	public String pwchk(MemberDTO memberDTO) {
		System.out.println("비민번호 변경 컨트롤러");
		System.out.println(memberDTO.getMem_pw());
		System.out.println(memberDTO.getMem_pw_chk());
		if (memberDTO.getMem_pw().equals(memberDTO.getMem_pw_chk())) {
			System.out.println("비밀번호 바꿈");
			System.out.println(memberDTO.getMem_pw());
			System.out.println(memberDTO.getMem_pw_chk());
			memberService.update_mem_pw(memberDTO);
		} else {
			return Pages.VIEW_MYPAGE_MEMBER;
		}

		return "redirect:"+URLs.URI_MYPAGE_MEMBER_FULL;

	}

	@RequestMapping(value = URLs.URI_MYPAGE_MEMBER_IMAGE, method = RequestMethod.POST)
	public String mem_img_upload(MemberDTO memberDTO, HttpServletRequest request, MultipartFile file) throws Exception {
		String realpath = "D:\\gaduda\\profile\\";
	      System.out.println("프로필사진 저장되는 경로" + realpath);
	      MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
	      String mem_id = memVO.getMem_id();
	      
	      Date d = new Date();
	      SimpleDateFormat formatType=new SimpleDateFormat("yyyyMMddhhmmss");
	       String date=formatType.format(d);
	      System.out.println("이미지 업로드"+date);
	      String file_name=date+mem_id+file.getOriginalFilename();
	      
	      
	      
	      File f = new File(realpath +file_name);

	      memberDTO.setMem_id(mem_id);
	      file.transferTo(f);
	      String path = "/profileimage/";
	      String pic_path = path + file_name;
	      memberDTO.setMem_profile_pic(pic_path);
	      memVO.setMem_profile_pic(pic_path);
	      memberService.update_mem_pic(memberDTO);

	      memVO.setMem_profile_pic(pic_path);
	      request.getSession().setAttribute("member", memVO);
	      //return Pages.VIEW_MYPAGE_MEMBER;
	      
	      return "redirect:"+URLs.URI_MYPAGE_MEMBER_FULL;
	}

	@RequestMapping(value = URLs.URI_MYPAGE_MEMBER_FOLLOWER)
	public String follower_list(HttpServletRequest request, Model model) {
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id = memVO.getMem_id();
		FollowDTO followDTO = new FollowDTO();
		followDTO.setMem_id(mem_id);
		List<Follower_VO> follower_list = memberService.follower_list(followDTO);

		for (int i = 0; i < follower_list.size(); i++) {
			Follower_VO follower_VO = new Follower_VO();

			follower_VO.setFol_mem_id(follower_list.get(i).getFol_mem_id());

			followDTO.setFol_mem_id(follower_VO.getFol_mem_id());

			int fol_kind = memberService.following_available(followDTO); //맞팔
			int memfolmeint = memberService.unfollow_available(followDTO); //나만 팔로우
			
			follower_list.get(i).setFol_kind(fol_kind);
			
			if(fol_kind==0 && memfolmeint==0){ //둘다 아무도 팔로우 안함
				follower_list.get(i).setStatus_fol_kind("1");
			}else if(fol_kind==0 && memfolmeint==1){ //작성자만 팔로우O
				follower_list.get(i).setStatus_fol_kind("2");
			}else if(fol_kind==1 && memfolmeint==0){ //나만 팔로우
				follower_list.get(i).setStatus_fol_kind("3");
			}else if(fol_kind==1 && memfolmeint==1){ //맞팔
				follower_list.get(i).setStatus_fol_kind("4");
			}
		}
		
		model.addAttribute("follower_list", follower_list);

		return Pages.VIEW_MYPAGE_MEMBER_FOLLOWER;
	}

	@RequestMapping(value = URLs.URI_MYPAGE_MEMBER_FOLLOWING)
	public String following_list(HttpServletRequest request, Model model) {

		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id = memVO.getMem_id();
		FollowDTO followDTO = new FollowDTO();
		followDTO.setMem_id(mem_id);
		List<Following_VO> following_list = memberService.following_list(followDTO);

		for (int i = 0; i < following_list.size(); i++) {

			Following_VO following_VO = new Following_VO();

			following_VO.setFol_mem_id(following_list.get(i).getFol_mem_id());

			followDTO.setFol_mem_id(following_VO.getFol_mem_id());

			System.out.println(followDTO.getMem_id());
			System.out.println(followDTO.getFol_mem_id());
			int fol_kind = memberService.following_available(followDTO); //맞팔
			int memfolmeint = memberService.unfollow_available(followDTO); //나만 팔로우
			
			following_list.get(i).setFol_kind(fol_kind);

			if(fol_kind==0 && memfolmeint==0){ //둘다 아무도 팔로우 안함
				following_list.get(i).setStatus_fol_kind("1");
			}else if(fol_kind==0 && memfolmeint==1){ //작성자만 팔로우O
				following_list.get(i).setStatus_fol_kind("2");
			}else if(fol_kind==1 && memfolmeint==0){ //나만 팔로우
				following_list.get(i).setStatus_fol_kind("3");
			}else if(fol_kind==1 && memfolmeint==1){ //맞팔
				following_list.get(i).setStatus_fol_kind("4");
			}
		}
		model.addAttribute("following_list", following_list);

		return Pages.VIEW_MYPAGE_MEMBER_FOLLOWING ;

	}

	// 맞팔상태에서 언팔하기 팔로우하기
	@RequestMapping(value = URLs.URI_MYPAGE_FOLLOW_CHK)
	@ResponseBody
	public JSONObject follow_chk(HttpServletRequest request, HttpServletResponse response, Model model,
			String fol_mem_id) throws Exception {
		response.setContentType("application/json;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		JSONObject jsonObj = new JSONObject();
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id = memVO.getMem_id();
		FollowDTO followDTO = new FollowDTO();
		followDTO.setMem_id(mem_id);
		followDTO.setFol_mem_id(fol_mem_id);
		System.out.println(fol_mem_id);
		int fol_kind = memberService.following_available(followDTO);
		if (fol_kind == 1) {
			memberService.follow_change(followDTO);
		} else {
			memberService.unfollow_change(followDTO);
		}
		return jsonObj;
	}

	// 나만 팔로우 했을때 팔로우 취소
	@RequestMapping(value = URLs.URI_MYPAGE_DEL_FOLLOW)
	@ResponseBody
	public JSONObject delFollow(HttpServletRequest request, HttpServletResponse response, Model model,
			String fol_mem_id) throws Exception {
		response.setContentType("application/json;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("팔로우 삭제하기");
		JSONObject jsonObj = new JSONObject();
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id = memVO.getMem_id();
		FollowDTO followDTO = new FollowDTO();
		followDTO.setMem_id(mem_id);
		followDTO.setFol_mem_id(fol_mem_id);
		System.out.println(fol_mem_id);
		memberService.delfollow(followDTO);
		System.out.println("성공");
		return jsonObj;
	}

	// 새로 팔로우하기
	@RequestMapping(value = URLs.URI_MYPAGE_NEW_FOLLOW)
	@ResponseBody
	public JSONObject newFollow(HttpServletRequest request, HttpServletResponse response, Model model,
			String fol_mem_id) throws Exception {
		response.setContentType("application/json;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("팔로우 새로하기");

		JSONObject jsonObj = new JSONObject();
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id = memVO.getMem_id();
		FollowDTO followDTO = new FollowDTO();
		followDTO.setMem_id(mem_id);
		followDTO.setFol_mem_id(fol_mem_id);
		System.out.println(fol_mem_id);
		memberService.addfollow(followDTO);
		memberService.add2follow(followDTO);
		return jsonObj;
	}

	// 마이페이지 내 가구배치도 가져오기
	@RequestMapping(value = URLs.URI_MYPAGE_MYFURARR)
	public String callMyFurArr(HttpServletRequest request, Model model) {

		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id = memVO.getMem_id();
		System.out.println(mem_id);
		List<MemberFurArrVO> mem_arrList = memberService.callMyFurArr(mem_id);

		for (int i = 0; i < mem_arrList.size(); i++) {
			int fur_arr_plan_no = mem_arrList.get(i).getFur_arr_plan_no();

			int scrap_no = memberService.getCountScrap(fur_arr_plan_no);
			String furArrCon = memberService.getFurCon(fur_arr_plan_no);
			String furArrRoomKind = memberService.getRoomKind(fur_arr_plan_no);
			String furArrHashTag = memberService.getHashTag(fur_arr_plan_no);

			mem_arrList.get(i).setFur_arr_plan_scrap_num(scrap_no);
			mem_arrList.get(i).setFur_arr_plan_room_kind(furArrRoomKind);
			mem_arrList.get(i).setFur_arr_plan_concept(furArrCon);
			mem_arrList.get(i).setFur_arr_plan_hash_tag(furArrHashTag);

		}
		model.addAttribute("arrList", mem_arrList);

		return Pages.VIEW_MYFURARR;
	}

	// 팔로우회원 가구배치도 가져오기
	@RequestMapping(value = URLs.URI_FOLLOW_FURARR, method = RequestMethod.GET)
	public String callFolFurArr(@RequestParam(value = "fol_mem_id") String fol_mem_id, Model model) {

		List<MemberFurArrVO> fol_arrList = memberService.callMyFurArr(fol_mem_id);

		for (int i = 0; i < fol_arrList.size(); i++) {
			int fur_arr_plan_no = fol_arrList.get(i).getFur_arr_plan_no();

			int scrap_no = memberService.getCountScrap(fur_arr_plan_no);
			String furArrCon = memberService.getFurCon(fur_arr_plan_no);
			String furArrRoomKind = memberService.getRoomKind(fur_arr_plan_no);
			String furArrHashTag = memberService.getHashTag(fur_arr_plan_no);

			fol_arrList.get(i).setFur_arr_plan_scrap_num(scrap_no);
			fol_arrList.get(i).setFur_arr_plan_room_kind(furArrRoomKind);
			fol_arrList.get(i).setFur_arr_plan_concept(furArrCon);
			fol_arrList.get(i).setFur_arr_plan_hash_tag(furArrHashTag);

		}
		model.addAttribute("fol_mem_id", fol_mem_id);
		model.addAttribute("arrList", fol_arrList);

		return Pages.VIEW_FOLFURARR;
	}

}
