package kr.co.gaduda.mypage.member.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.member.dto.FollowDTO;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.service.impl.MemberService;
import kr.co.gaduda.member.vo.Follower_VO;
import kr.co.gaduda.member.vo.Following_VO;
import kr.co.gaduda.member.vo.MemberVO;

@Controller
@RequestMapping(value="/mypage/member")
public class MypageMemberController implements ServletContextAware{
	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub
		
	}
	@Autowired
	private MemberService memberService;
	private ServletContext servletContext;
	
	
	@RequestMapping(value=URLs.URI_MYPAGE_MEMBER)
	public String mypage_member(Model model, HttpServletRequest request){
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id=memVO.getMem_id();
		System.out.println("아아아");
		System.out.println(mem_id+"mem_id!!!!!");
		FollowDTO followDTO = new FollowDTO();
		followDTO.setMem_id(mem_id);
		int follower=memberService.follower_info(followDTO);
		int following=memberService.following_info(followDTO);
		model.addAttribute("follower", follower);
		model.addAttribute("following", following);
		
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
		
		
		return Pages.VIEW_UPDATE_MEMBER;
	}

	@RequestMapping(value = URLs.URI_UPDATE_MEMBER_CHK, method = RequestMethod.POST)
	public String update_mem_chk(MemberDTO memberDTO) {

		memberService.update_mem(memberDTO);

		return URLs.URI_MAIN_REDIRECT;
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
		if(memberDTO.getMem_pw().equals(memberDTO.getMem_pw_chk())){
			System.out.println("비밀번호 바꿈");
			System.out.println(memberDTO.getMem_pw());
			System.out.println(memberDTO.getMem_pw_chk());
			memberService.update_mem_pw(memberDTO);
		}else{
			return URLs.URI_MAIN_REDIRECT;
		}
		
		return URLs.URI_MAIN_REDIRECT;

	}

	

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String mem_img_upload(MemberDTO memberDTO, HttpServletRequest request,MultipartFile file)
			throws Exception {
		String realpath="C:/sts/workspace/GADUDA_ver2/src/main/webapp/resources/Images/MemberImage/";
		File f=new File(realpath+file.getOriginalFilename());
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id=memVO.getMem_id();
		
		memberDTO.setMem_id(mem_id);
		file.transferTo(f);
		String path="/resources/Images/MemberImage/";
		String pic_path=path+file.getOriginalFilename();
		memberDTO.setMem_profile_pic(pic_path);
		memVO.setMem_profile_pic(pic_path);
		memberService.update_mem_pic(memberDTO);
		
		/*
		 * MultipartFile file=null; String
		 * mem_orgname=file.getOriginalFilename(); String
		 * mem_newname=mem_orgname+System.currentTimeMillis()+file.getSize();
		 * String
		 * path=servletContext.getRealPath("/resources/Images/MemberImage");
		 * System.out.println("path:"+path); File files=new
		 * File(path+File.separator+mem_newname);
		 * memberDTO.setMem_orgname(mem_orgname);
		 * memberDTO.setMem_newname(mem_newname);
		 * memberDTO.setMem_profile_pic(path);
		 * memberService.update_mem_pic(memberDTO); System.out.println();
		 * file.transferTo(files);
		 */

		return Pages.VIEW_UPDATE_MEMBER_FIRST;
	}
	
	@RequestMapping(value=URLs.URI_MYPAGE_MEMBER_FOLLOWER)
	public String follower_list(HttpServletRequest request,Model model){
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id=memVO.getMem_id();
		FollowDTO followDTO = new FollowDTO();
		followDTO.setMem_id(mem_id);
		String follower_list=memberService.follower_list(followDTO);
		model.addAttribute("follower_list",follower_list);
		
		return Pages.VIEW_MYPAGE_MEMBER_FOLLOWER;
	}
	
	@RequestMapping(value=URLs.URI_MYPAGE_MEMBER_FOLLOWING)
	public String following_list(HttpServletRequest request,Model model){
		
		MemberVO memVO = (MemberVO) request.getSession().getAttribute("member");
		String mem_id=memVO.getMem_id();
		FollowDTO followDTO = new FollowDTO();
		followDTO.setMem_id(mem_id);
		String following_list=memberService.following_list(followDTO);
		followDTO.setFol_mem_id(following_list);
		model.addAttribute("following_list",following_list);
		
		System.out.println(followDTO.getMem_id());
		System.out.println(followDTO.getFol_mem_id());
		int fol_kind=memberService.following_available(followDTO);
		if(fol_kind==1){
		//내가 팔로우를함(맞팔)
		model.addAttribute("following_available","FOLLOW중");
	}else{
			model.addAttribute("following_available","UNFOLLOW");
	}
		
		return Pages.VIEW_MYPAGE_MEMBER_FOLLOWING;
		
	}
	
	
}
