package co.sp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.sp.beans.MemberVO;
import co.sp.beans.Page;
import co.sp.beans.Shop_ReplyVO;
import co.sp.service.ShopReplyService;

@Controller
@RequestMapping("/shopreply")
public class ShopReplyListController {
	
	@Autowired
	private ShopReplyService shopreplyService;
	
	@Resource(name = "loginBean")
	private MemberVO loginBean;
	
	@GetMapping("shopreply_list")
	public String shopreply_list(@RequestParam("shop_no") int shop_no, 
			                     @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		List<Shop_ReplyVO> shopreply_list=shopreplyService.shopreply_list(shop_no, page);
		
		model.addAttribute("shop_no", shop_no);
		model.addAttribute("shopreply_list", shopreply_list);
		
		Page pageBean=shopreplyService.getShopreplyCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		
		return "shopreply/shopreply_list";
	}

}
