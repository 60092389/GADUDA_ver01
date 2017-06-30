package kr.co.gaduda.interceptor.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.gaduda.member.vo.MemberVO;

public class MemberLoginInterceptor extends HandlerInterceptorAdapter {
	
	private Logger logger =LoggerFactory.getLogger(MemberLoginInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("member pre interceptor");
		
		MemberVO memberVO=new MemberVO();
		memberVO=(MemberVO)request.getSession().getAttribute("member");
		
		if(memberVO==null){
			
			return true;
		}
		response.sendRedirect("/");
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("member post interceptor");
		MemberVO memberVO=new MemberVO();
		memberVO=(MemberVO)modelAndView.getModel().get("member");
		
		request.getSession().setAttribute("member", memberVO);
		
		
	}

	
	

}
