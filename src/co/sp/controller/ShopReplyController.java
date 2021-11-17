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

import co.sp.beans.MemberVO;
import co.sp.beans.Shop_ReplyVO;
import co.sp.service.ShopReplyService;

@Controller
@RequestMapping("/shopreply")
public class ShopReplyController {
	@Autowired
	private ShopReplyService shopreplyService;
	@Resource(name = "loginBean")
	private MemberVO loginBean;
	
	//´ñ±Û µî·Ï
	@GetMapping("/shopreply")
	public String shopreply(@RequestParam("member_no") int member_no, @RequestParam("shop_no") int shop_no,
			                @ModelAttribute("joinShopreplyBean") Shop_ReplyVO joinShopreplyBean, Model model) {
		model.addAttribute("member_no", member_no);
		model.addAttribute("shop_no", shop_no);
		
		return "shopreply/shopreply";
	}
	
	@PostMapping("/shopreply_pro")
	public String shopreply_pro(@Valid @ModelAttribute("joinShopreplyBean") Shop_ReplyVO joinShopreplyBean, BindingResult result,
			                    Model m) {
		if(result.hasErrors()) {
			return "shopreply/shopreply";
		}else {
			m.addAttribute("joinShopreplyBean", joinShopreplyBean);
			shopreplyService.shopreply_create(joinShopreplyBean);
			return "shopreply/shopreply_success";
		}
	}
	
	@GetMapping("/shopreply_delete")
	public String shopreply_delete(@RequestParam("shop_reply_no") int shop_reply_no, Model model) {
		shopreplyService.deleteShopreplyInfo(shop_reply_no);
		return "shopreply/shopreply_delete";
	}
}
