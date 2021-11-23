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
import co.sp.beans.Page;
import co.sp.beans.WaitingVO;
import co.sp.service.WaitingService;
import co.sp.validator.WaitingValidator;

@Controller
@RequestMapping("/waiting")
public class WaitingController {

	@Autowired
	private WaitingService waitingService;
	
	@Resource(name = "loginBean")
	private MemberVO loginBean;
	
	@Resource(name = "loginBean2")
    private AdminVO loginBean2;

	@GetMapping("/waiting")
	public String waiting(@RequestParam("member_no") int member_no, @RequestParam("shop_no") int shop_no,
			@ModelAttribute("joinWaitingBean") WaitingVO joinWaitingBean, Model model) {

		model.addAttribute("member_no", member_no);
		model.addAttribute("shop_no", shop_no);
		model.addAttribute("cnt", waitingService.getWaitingNo());


		// 웨이팅+멤버+샵 vo만들기 (조인 vo)
		return "waiting/waiting";

	}

	@PostMapping("/waiting_pro")
	public String waiting_pro(@Valid @ModelAttribute("joinWaitingBean") WaitingVO joinWaitingBean, BindingResult result,
			Model m) {
		if (result.hasErrors()) {
			return "waiting/waiting";
		} else {
			m.addAttribute("joinWaitingBean", joinWaitingBean);
			waitingService.waiting_create(joinWaitingBean);
			return "waiting/waiting_success";
		}
	}
	
	@GetMapping("/waiting_delete")
	public String waiting_delete(@RequestParam("waiting_no") int waiting_no, Model model) {
		waitingService.deleteWaitingInfo(waiting_no);
		return "waiting/waiting_delete";
	}
	
	

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		WaitingValidator validator1 = new WaitingValidator();
		binder.addValidators(validator1);
	}
}
