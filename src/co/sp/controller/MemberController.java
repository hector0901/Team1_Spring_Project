package co.sp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;
import co.sp.service.AdminService;
import co.sp.service.MemberService;
import co.sp.validator.MemberValidator;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
    private AdminService adminService;
	
	@Resource(name = "loginBean")
	private MemberVO loginBean;
	
	@Resource(name = "loginBean2")
	private AdminVO loginBean2;

	/**
	 * 등록폼
	 * @param joinMemberBean
	 * @return
	 */
	@GetMapping("/join")
	public String join(@ModelAttribute("joinMemberBean") MemberVO joinMemberBean) {
		return "member/join";
	} 
	
	/**
	 * 회원가입 프로시저
	 * @param joinMemberBean
	 * @param result
	 * @param m
	 * @return
	 */
	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinMemberBean") MemberVO joinMemberBean, BindingResult result,Model m) {
		if(result.hasErrors()) {
			return "member/join";           // ?��?��?�� 경우
		} else {	
			m.addAttribute("joinMemberBean", joinMemberBean);
			memberService.member_create(joinMemberBean);
			return "member/join_success";  // ?��공한 경우
		}
		
	}
	// ȸ�� �α���
	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginMemberBean") MemberVO tempLoginMemberBean,
			            @RequestParam(value="fail", defaultValue ="false") boolean fail,
			            Model model) {
		model.addAttribute("fail", fail);
		
		return "member/login";
	}
	//�α��� ���� ����
	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("tempLoginMemberBean") MemberVO tempLoginMemberBean, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "member/login";
		}
		
		memberService.getLoginmemberInfo(tempLoginMemberBean);
		
		if(loginBean.isMemberLogin() == true) {
			m.addAttribute("tempLoginMemberBean", tempLoginMemberBean);
			return "member/login_success";
		} else {
			return "member/login_fail";
		}
	}
	@GetMapping("/not_login")
	public String not_login() {
		return "member/not_login";
	}
	
	//����
	@GetMapping("/update")
	public String update(@ModelAttribute("updateMemberBean") MemberVO updateMemberBean) {
		memberService.getupdatememberInfo(updateMemberBean);
		
		return "member/update";
	}
	
	@PostMapping("/update_pro")
	public String update_pro(@Valid @ModelAttribute("updateMemberBean") MemberVO updateMemberBean, BindingResult result) {
		if(result.hasErrors()) {
			return "member/update_fail";
		}
		memberService.updatememberInfo(updateMemberBean);
		System.out.println("수정된 회원 번호: " + updateMemberBean.getMember_no());
		
		return "member/update_success";
	}
	
	@GetMapping("/delete_page")
	public String delete_page(@ModelAttribute("deleteMemberBean") MemberVO deleteMemberBean, BindingResult result, Model model) {
		
		return "member/delete_page";
	}
	@GetMapping("/delete")
	public String delete(@Valid @ModelAttribute("deleteMemberBean") MemberVO deleteMemberBean, BindingResult result, Model model, HttpSession session) {
		memberService.deleteMemberInfo(deleteMemberBean);
		model.addAttribute("member_no", deleteMemberBean.getMember_no());
		model.addAttribute("member_id", deleteMemberBean.getMember_id());
		model.addAttribute("member_pw", deleteMemberBean.getMember_pw());
		session.invalidate();
		return "member/delete";
	}
	
	
	/**
	 * ȸ�� �α׾ƿ�
	 * @param session
	 * @return
	 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		loginBean.setMemberLogin(false);
		session.invalidate();
		return "member/logout";
	}
	
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        MemberValidator validator1 = new MemberValidator();
        binder.addValidators(validator1);
    }
	

}
