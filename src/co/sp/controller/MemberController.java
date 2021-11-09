package co.sp.controller;

import javax.annotation.Resource;


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

import co.sp.beans.MemberVO;
import co.sp.service.MemberService;
import co.sp.validator.MemberValidator;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Resource(name = "loginBean")
	private MemberVO loginBean;

	// 회원가입 
	@GetMapping("/join")
	public String join(@ModelAttribute("joinMemberBean") MemberVO joinMemberBean) {
		return "member/join";
	} 
	
	// 회원가입 프로시저
	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinMemberBean") MemberVO joinMemberBean, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "member/join";           // 실패한 경우
		} else {
			memberService.member_create(joinMemberBean);
			m.addAttribute("joinMemberBean", joinMemberBean);
			return "member/join_success";  // 성공한 경우
		}		
	}
	
	// 로그인
	@GetMapping("/login")
    public String login(@ModelAttribute("tempLoginMemberBean") MemberVO tempLoginMemberBean,
                        @RequestParam(value = "fail", defaultValue = "false") boolean fail, Model model) {

	  model.addAttribute("fail", fail);
	  
      return "member/login";
    }
    
	// 로그인 프로시저
    @PostMapping("/login_pro")
    public String login_pro(@Valid @ModelAttribute("tempLoginMemberBean") MemberVO tempLoginMemberBean, BindingResult result) {
        
        if(result.hasErrors()) {
            return "member/login";
        } 
        
        memberService.getLoginMemberInfo(tempLoginMemberBean);
        
        if(loginBean.isMemberLogin() == true) {
          return "member/login_success";
        } else {
          return "member/login_fail";
        }
    }
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        MemberValidator validator1 = new MemberValidator();
        binder.addValidators(validator1);
    }

}
