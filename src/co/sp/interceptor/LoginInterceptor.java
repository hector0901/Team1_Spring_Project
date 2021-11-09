package co.sp.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import co.sp.beans.MemberVO;


public class LoginInterceptor implements HandlerInterceptor{
	
	private MemberVO loginBean;
	
	public LoginInterceptor(MemberVO loginBean) {
		// TODO Auto-generated constructor stub
		this.loginBean = loginBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		if(loginBean.isMemberLogin() == false) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/member/not_login");
			return false;
		}
		return true;
	}
	
}








