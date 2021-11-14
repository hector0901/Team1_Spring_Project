package co.sp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/waiting")
public class WaitingController {
	
	@GetMapping("/waiting")
	public String waiting(@RequestParam("waiting_no") int waiting_no,
						@RequestParam("member_no") int member_no,
						@RequestParam("shop_no") int shop_no, Model model) {
		
		model.addAttribute("waiting_no",waiting_no );
		model.addAttribute("member_no",member_no );
		model.addAttribute("shop_no",shop_no );
		
		return "waiting/waiting";
		
	}

}
