package co.sp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;
import co.sp.beans.Page;
import co.sp.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberListController {
	@Resource(name = "loginBean2")
	private AdminVO loginBean2;
	
	@Autowired
	private MemberService memberService;

	@GetMapping("/list") 
	public String list(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		if(loginBean2.isAdminLogin() == true) {
			memberService.getMemberCnt(page);
			List<MemberVO> memberList = memberService.member_list(page);
			model.addAttribute("memberList", memberList);
			
			Page pageBean = memberService.getMemberCnt(page);
			model.addAttribute("pageBean", pageBean);
			model.addAttribute("page", page);
		} 
		return "member/list";
	}
}
