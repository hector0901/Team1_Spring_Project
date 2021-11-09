package co.sp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;
import co.sp.service.MemberService;

public class LoginInterceptor implements HandlerInterceptor{
	private MemberVO loginBean;
	
	public LoginInterceptor(MemberVO loginBean) {
		this.loginBean=loginBean;
	}

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	   throws Exception {
		if(loginBean.isMemberLogin() == false) {
			String contextPath =request.getContextPath();
			response.sendRedirect(contextPath + "/member/not_login");
			return false;
		}
		return true;
	}
}
