package co.sp.controller;

import java.util.List;

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

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;
import co.sp.beans.ShopVO;
import co.sp.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	@Resource(name = "loginBean")
	private MemberVO loginBean;
	
	@Resource(name = "loginBean2")
	private AdminVO loginBean2;

	/**
	 * 목록
	 * 
	 * @param category_no
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String main(@RequestParam("category_no") int category_no, Model model) {

		model.addAttribute("admin_no", loginBean2.getAdmin_no());
		model.addAttribute("category_no", category_no);

		System.out.println("관리자 번호: " + loginBean2.getAdmin_no());
		System.out.println("카테고리 번호: " + category_no);

		return "shop/main";
	}

	/**
	 * 가게 등록폼
	 * 
	 * @param RegShopBean
	 * @param admin_no    -- 관리자 번호
	 * @param category_no -- 카테고리 번호
	 * @return
	 */
	@GetMapping("/reg")
	public String reg(@ModelAttribute("RegShopBean") ShopVO RegShopBean, @RequestParam("category_no") int category_no,
			@RequestParam("admin_no") int admin_no) {

		return "shop/reg";
	}

	/**
	 * 가게 등록처리
	 * 
	 * @param RegShopBean
	 * @param result
	 * @param m
	 * @return
	 */
	@PostMapping("/reg_pro")
	public String reg_pro(@Valid @ModelAttribute("RegShopBean") ShopVO RegShopBean, BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "shop/reg"; // 가게 등록에 실패한 경우
		} else {
			m.addAttribute("RegShopBean", RegShopBean);
			shopService.shop_create(RegShopBean);
			return "shop/reg_success"; // 가게 등록에 성공한 경우
		}
	}

	/**
	 * 카테고리별 가게 목록
	 * 
	 * @param category_no
	 * @param model
	 * @return
	 */
	@GetMapping("/shop_list_search_paging")
	public String shop_list_search_paging(@RequestParam("category_no") int category_no, Model model) {

		List<ShopVO> shop_list_search_paging = shopService.shop_list_search_paging(category_no);

		model.addAttribute("category_no", category_no);
		model.addAttribute("admin_no", loginBean2.getAdmin_no()); // 가게 등록에 필요한 관리자 번호
		model.addAttribute("shop_list_search_paging", shop_list_search_paging);

		return "shop/shop_list_search_paging";

	}

	// 가게 상세페이지(조회)
	@GetMapping("/shop_detail")
	public String shopmain(@RequestParam("shop_no") int shop_no, @RequestParam("category_no") int category_no,
			               @RequestParam("member_no") int member_no ,Model model) {

		model.addAttribute("category_no", category_no);
		model.addAttribute("shop_no", shop_no);
		//model.addAttribute("member_no", member_no);
		//model.addAttribute("admin_no", admin_no);

		ShopVO readShopBean = shopService.getShopInfo(shop_no);
		model.addAttribute("readShopBean", readShopBean);
		model.addAttribute("loginBean2", loginBean2);
		model.addAttribute("loginBean", loginBean);
		model.addAttribute(loginBean.getMember_no());

		return "shop/shop_detail";
	}

	//가게 수정
	@GetMapping("/shop_update")
	public String shop_update(@RequestParam("shop_no") int shop_no,
			@RequestParam(value = "admin_no", defaultValue = "1") int admin_no,
			@ModelAttribute("updateShopBean") ShopVO updateShopBean, Model model) {

		model.addAttribute("shop_no", shop_no);
		model.addAttribute("admin_no", admin_no);

		ShopVO tempShopBean = shopService.getShopInfo(shop_no);

		updateShopBean.setShop_simple(tempShopBean.getShop_simple());
		updateShopBean.setShop_content(tempShopBean.getShop_content());
		updateShopBean.setShop_total_seat(tempShopBean.getShop_total_seat());
		updateShopBean.setShop_remain_seat(tempShopBean.getShop_remain_seat());
		updateShopBean.setShop_time(tempShopBean.getShop_time());

		updateShopBean.setShop_no(shop_no);
		updateShopBean.setAdmin_no(admin_no);

		return "shop/shop_update";
	}

	@PostMapping("/shop_update_pro")
	public String shop_update_pro(@Valid @ModelAttribute("updateShopBean") ShopVO updateShopBean,
			BindingResult result) {
		shopService.updateShopInfo(updateShopBean);
		return "shop/shop_update_success";
	}
	
	@GetMapping("/shop_delete")
	public String shop_delete(@RequestParam("shop_no") int shop_no,
			                  @RequestParam(value = "admin_no", defaultValue = "1") int admin_no,
			                  Model model) {
		shopService.deleteShopInfo(shop_no);
		model.addAttribute("admin_no", admin_no);
		
		return "shop/shop_delete";
	}
}
