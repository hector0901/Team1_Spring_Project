package co.sp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/pay")
public class PayController {
	@GetMapping("/pay")
	public String pay(@RequestParam("pay_no") int pay_no,
						@RequestParam("reservation_no") int reservation_no,
						Model model) {
		
		model.addAttribute("pay_no", pay_no);
		model.addAttribute("reservation_no", reservation_no);
		
		return "pay/pay";
	}
}
