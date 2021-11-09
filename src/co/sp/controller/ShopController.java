package co.sp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import co.sp.beans.MemberVO;
import co.sp.beans.ShopVO;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@GetMapping("/ShopList")
	public String sl() {
		return "shop/ShopList";
	}
	
	//가게 등록
	@GetMapping("/ShopRegister")
	public String ShopRegister(@ModelAttribute("ShopRegBean") ShopVO ShopRegBean) {
		return "shop/ShopRegister";
	}

}
