package co.sp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import co.sp.beans.MemberVO;

public class PWFindInterceopotr implements HandlerInterceptor {
  
  private MemberVO pwBean;

  public PWFindInterceopotr(MemberVO pwBean) {
    this.pwBean = pwBean;
  }
  
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
     throws Exception {
      if(pwBean.isPwfind() == false) {
          String contextPath =request.getContextPath();
          response.sendRedirect(contextPath + "/member/not_pwfind");
          return false;
      }
      return true;
  }
  
  

}
