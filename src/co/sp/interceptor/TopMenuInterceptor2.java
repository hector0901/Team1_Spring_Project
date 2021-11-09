package co.sp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import co.sp.beans.AdminVO;

public class TopMenuInterceptor2 implements HandlerInterceptor{
  private AdminVO loginBean2;
  
  public TopMenuInterceptor2(AdminVO loginBean2) {
    this.loginBean2=loginBean2;
  }
  
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
  // TODO Auto-generated method stub
  request.setAttribute("loginBean2", loginBean2);
  
  return true;
}

}
