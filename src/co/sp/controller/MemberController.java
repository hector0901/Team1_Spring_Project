package co.sp.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.sp.beans.MemberVO;
import co.sp.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Resource(name = "loginBean")
	private MemberVO loginBean;

	// ȸ������ 
	@GetMapping("/join")
	public String join(@ModelAttribute("joinMemberBean") MemberVO joinMemberBean) {
		return "member/join";
	} 
	
	// ȸ������ ���ν���
	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinMemberBean") MemberVO joinMemberBean, BindingResult result) {
		if(result.hasErrors()) {
			return "member/join";           // ������ ���
		} else {
			memberService.member_create(joinMemberBean);
			return "member/join_success";  // ������ ���
		}
		
	}

}
