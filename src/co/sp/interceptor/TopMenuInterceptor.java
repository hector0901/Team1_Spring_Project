package co.sp.interceptor;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import co.sp.beans.MemberVO;

public class TopMenuInterceptor implements HandlerInterceptor{

	private MemberVO loginBean;
	
	public TopMenuInterceptor(MemberVO loginBean) {
		this.loginBean = loginBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		request.setAttribute("loginBean", loginBean);
		
		return true;
	}
}
