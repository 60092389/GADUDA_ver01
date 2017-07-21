package kr.co.gaduda.interceptor.log;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.gaduda.member.dao.impl.MemberDao;
import kr.co.gaduda.member.dto.MemberLogDTO;
import kr.co.gaduda.member.vo.MemberVO;

public class LogInterceptor extends HandlerInterceptorAdapter {

   @Autowired
   MemberDao memberDAO;
   
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {

//      StringBuffer FullURL;
//
//      FullURL = request.getRequestURL();
//      String str = FullURL.toString();
      
      
      Enumeration param = request.getParameterNames();
        String strParam = ""; 
        while(param.hasMoreElements()) { 
            String name = (String)param.nextElement(); 
            String value = request.getParameter(name); 
            strParam += name + "=" + value + "&"; 
        }
        String URL = request.getRequestURL() + "?" + strParam;


      MemberLogDTO memberLogVO = new MemberLogDTO();
      MemberVO memberVO=new MemberVO();
      memberVO=(MemberVO)request.getSession().getAttribute("member");
      if(memberVO==null){
         System.out.println("로그인안됨");
      }else{
         
         memberLogVO.setMem_id(memberVO.getMem_id());
         
         Map<String, Object> memberInfo = new HashMap<String, Object>();
   
         memberInfo.put("mem_id", memberVO.getMem_id());
         memberInfo.put("mem_acc_loc", URL);
         
         System.out.println("로그인아이디"+memberLogVO.getMem_id());
         memberDAO.member_log(memberInfo);
      }
   
      System.out.println("URL 전체주소" + URL);

   }

}
