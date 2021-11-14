package co.sp.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.sp.beans.ReservationVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	@GetMapping("/reservation")
	public String reservation(@RequestParam("reservation_no") int reservation_no,
								@RequestParam("member_no") int member_no,
								@RequestParam("shop_no") int shop_no, Model model) {
		
		model.addAttribute("reservation_no",reservation_no);
		model.addAttribute("member_no",member_no);
		model.addAttribute("shop_no",shop_no);
		
		return "reservation/reservation";
		
	}

}
