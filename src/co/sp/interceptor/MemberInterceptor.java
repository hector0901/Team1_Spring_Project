package co.sp.interceptor;


import org.springframework.web.servlet.HandlerInterceptor;

import co.sp.beans.MemberVO;
import co.sp.service.MemberService;

public class MemberInterceptor implements HandlerInterceptor{
	private MemberVO loginBean;
	private MemberService memberService;
	
	public MemberInterceptor(MemberVO loginBean, MemberService memberService) {
		this.loginBean=loginBean;
		this.memberService=memberService;
	}
}
