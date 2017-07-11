package kr.co.gaduda.member.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.gaduda.common.Pages;
import kr.co.gaduda.common.URLs;
import kr.co.gaduda.member.dto.MemberDTO;
import kr.co.gaduda.member.service.impl.MemberService;
import kr.co.gaduda.member.vo.MemberVO;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberService memberService;
	

	@RequestMapping(value = URLs.URI_JOIN_VIEW)
	public String join() {
		return Pages.VIEW_JOIN;
	}

	@RequestMapping(value = URLs.URI_JOIN_CHK, method = RequestMethod.POST)
	public String join_chk(MemberDTO memberDTO, HttpServletRequest request) throws SQLException, Exception {
		int result = memberService.joinMember(memberDTO);
		request.setCharacterEncoding("UTF-8");
		if (result == 0) {
			return "join_failed";
		}

		return URLs.URI_MAIN_REDIRECT;
	}

	@RequestMapping(value = URLs.URI_JOIN_IDCHK, method = RequestMethod.GET)
	@ResponseBody
	public JSONObject idchk(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		JSONObject jsonObj = new JSONObject();

		String mem_id = request.getParameter("mem_id");

		Integer id = memberService.idchk(mem_id);
		jsonObj.put("idchk", id.toString());

		return jsonObj;
	}

	@RequestMapping(value = URLs.URI_LOGIN)
	public String login() {
		return Pages.VIEW_LOGIN;
	}

	@RequestMapping(value = URLs.URI_LOGIN_CHK)
	public String login_chk(MemberDTO memberDTO, Model model) {
		MemberVO memberVO = new MemberVO();
		memberVO = memberService.login_chk(memberDTO);

		if (memberVO == null) {
			return Pages.VIEW_LOGIN_FAILED;
		}

		model.addAttribute("member", memberVO);

		return URLs.URI_MAIN_REDIRECT;
	}

	@RequestMapping(value = URLs.URI_LOGOUT)
	public String logout(HttpServletRequest request) {

		request.getSession().invalidate();

		return URLs.URI_MAIN_REDIRECT;
	}

	
}
