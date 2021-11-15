package co.sp.controller;

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
import co.sp.service.AdminService;
import co.sp.validator.AdminValidator;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Resource(name="loginBean2")
	private AdminVO loginBean2;
	
	// 관리자 로그인
		@GetMapping("/admin_login")
		public String admin_login(@ModelAttribute("tempLoginAdminBean") AdminVO tempLoginAdminBean, 
				                  @RequestParam(value="fail", defaultValue = "false") boolean fail, 
				                  Model model) {
			model.addAttribute("fail", fail);
			return "admin/admin_login";
		}
		
		
		@PostMapping("/login_pro2")
		public String login_pro2(@Valid @ModelAttribute("tempLoginAdminBean") AdminVO tempLoginAdminBean, BindingResult result, Model m) {
			if(result.hasErrors()) {
				return "admin/login_fail";
			}
			adminService.getLoginadminInfo(tempLoginAdminBean);
			
			if(loginBean2.isAdminLogin() == true) {
				m.addAttribute("tempLoginAdminBean", tempLoginAdminBean);
				return "admin/login_success";
			} else {
				return "admin/login_fail";
			}
		}
		@GetMapping("/not_login")
		public String not_login() {
			return "admin/not_login";
		}
		
		/**
		 * 관리자 로그아웃
		 * @return
		 */
		@GetMapping("/logout")
	      public String logout(HttpSession session) {
	         loginBean2.setAdminLogin(false);
	         session.invalidate();
	         return "admin/logout";
	      }
		
		@InitBinder
	    public void initBinder(WebDataBinder binder) {
	        AdminValidator validator1 = new AdminValidator();
	        binder.addValidators(validator1);
	    }
		
}
