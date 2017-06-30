package kr.co.gaduda.member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.service.impl.MemberService;
import kr.co.gaduda.member.vo.MemberVO;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value=URLs.URI_JOIN_VIEW)
	public String join(){
		return Pages.VIEW_JOIN;
	}
	
	@RequestMapping(value=URLs.URI_JOIN_CHK, method = RequestMethod.POST)
	public String join_chk(MemberDTO memberDTO) throws SQLException{
		int result = memberService.joinMember(memberDTO);
		
		if(result==0){
			return "join_failed";
		}
		
		return URLs.URI_MAIN_REDIRECT;
	}
	
	@RequestMapping(value=URLs.URI_JOIN_IDCHK,method=RequestMethod.GET)
	@ResponseBody
	public JSONObject idchk(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("application/json;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		JSONObject jsonObj= new JSONObject();
		
		String mem_id=request.getParameter("mem_id");
		
		Integer id=memberService.idchk(mem_id);
		jsonObj.put("idchk", id.toString());
				
		return jsonObj;
	}
	
	@RequestMapping(value=URLs.URI_LOGIN)
	public String login(){
		return Pages.VIEW_LOGIN;
	}
	
	@RequestMapping(value=URLs.URI_LOGIN_CHK)
	public String login_chk(MemberDTO memberDTO,Model model){
		MemberVO memberVO = new MemberVO();
		memberVO = memberService.login_chk(memberDTO);
		
		if(memberVO==null){
			return Pages.VIEW_LOGIN_FAILED;
		}
		
		model.addAttribute("member",memberVO);
		
		return URLs.URI_MAIN_REDIRECT;
	}
	@RequestMapping(value=URLs.URI_LOGOUT)
	public String logout(HttpServletRequest request){
		
		request.getSession().invalidate();
			
		return URLs.URI_MAIN_REDIRECT;
	}
	
	@RequestMapping(value=URLs.URI_DELETE_MEMBER)
	public String deleteMember(){
						
		return Pages.VIEW_DEL_MEMBER;
	}
	
	@RequestMapping(value=URLs.URI_DELETE_MEMBER_CHK)
	public String deleteMember_chk(MemberDTO memberDTO,HttpServletRequest request){
		memberDTO.setMem_id(request.getParameter("mem_id"));
		memberDTO.setMem_pw(request.getParameter("mem_pw"));
		memberService.deletemember(memberDTO);
		MemberVO memVO=(MemberVO)request.getSession().getAttribute("member");
		
		if(memVO.getMem_pw().equals(memberDTO.getMem_pw())){
			request.getSession().invalidate();
			return URLs.URI_MAIN_REDIRECT;
		}
		return Pages.VIEW_DEL_MEMBER_FAILED;
		
	}
}
