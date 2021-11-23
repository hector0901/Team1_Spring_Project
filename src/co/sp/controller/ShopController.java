package co.sp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Delete;
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
import co.sp.beans.Page;
import co.sp.beans.ReservationVO;
import co.sp.beans.ShopVO;
import co.sp.beans.Shop_ReplyVO;
import co.sp.service.ShopReplyService;
import co.sp.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopReplyService shopreplyService;
	
	@Autowired
	private ShopService shopService;
	
	@Resource(name = "loginBean")
	private MemberVO loginBean;
	
	@Resource(name = "loginBean2")
	private AdminVO loginBean2;

	/**
	 * 紐⑸줉
	 * 
	 * @param category_no
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String main(@RequestParam("category_no") int category_no, Model model) {

		model.addAttribute("admin_no", loginBean2.getAdmin_no());
		model.addAttribute("category_no", category_no);

		System.out.println("愿�由ъ옄 踰덊샇: " + loginBean2.getAdmin_no());
		System.out.println("移댄뀒怨좊━ 踰덊샇: " + category_no);

		return "shop/main";
	}

	/**
	 * 媛�寃� �벑濡앺뤌
	 * 
	 * @param RegShopBean
	 * @param admin_no    -- 愿�由ъ옄 踰덊샇
	 * @param category_no -- 移댄뀒怨좊━ 踰덊샇
	 * @return
	 */
	@GetMapping("/reg")
	public String reg(@ModelAttribute("RegShopBean") ShopVO RegShopBean, @RequestParam("category_no") int category_no,
			@RequestParam("admin_no") int admin_no) {

		return "shop/reg";
	}

	/**
	 * 媛�寃� �벑濡앹쿂由�
	 * 
	 * @param RegShopBean
	 * @param result
	 * @param m
	 * @return
	 */
	@PostMapping("/reg_pro")
	public String reg_pro(@Valid @ModelAttribute("RegShopBean") ShopVO RegShopBean, BindingResult result, Model m) {
		if (result.hasErrors()) {
			return "shop/reg"; // 媛�寃� �벑濡앹뿉 �떎�뙣�븳 寃쎌슦
		} else {
			m.addAttribute("RegShopBean", RegShopBean);
			shopService.shop_create(RegShopBean);
			return "shop/reg_success"; // 媛�寃� �벑濡앹뿉 �꽦怨듯븳 寃쎌슦
		}
	}

	/**
	 * 移댄뀒怨좊━蹂� 媛�寃� 紐⑸줉
	 * 
	 * @param category_no
	 * @param model
	 * @return
	 */
	@GetMapping("/shop_list_search_paging")
	public String shop_list_search_paging(@RequestParam("category_no") int category_no, 
			                              @RequestParam(value = "page", defaultValue = "1") int page ,Model model) {
		shopService.getShopCnt(page);
		List<ShopVO> shop_list_search_paging = shopService.shop_list_search_paging(category_no, page);

		model.addAttribute("category_no", category_no);
		model.addAttribute("admin_no", loginBean2.getAdmin_no()); // 媛�寃� �벑濡앹뿉 �븘�슂�븳 愿�由ъ옄 踰덊샇
		model.addAttribute("shop_list_search_paging", shop_list_search_paging);
		
		Page pageBean = shopService.getShopCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);

		return "shop/shop_list_search_paging";

	}

	// 媛�寃� �긽�꽭�럹�씠吏�(議고쉶)
	@GetMapping("/shop_detail")
	public String shopmain(@RequestParam("shop_no") int shop_no,
			               @RequestParam(value = "page", defaultValue = "1") int page,
			               @ModelAttribute("joinShopreplyBean") Shop_ReplyVO joinShopreplyBean,
			               @RequestParam("member_no") int member_no ,Model model) {
		
		List<Shop_ReplyVO> shopreply_list=shopreplyService.shopreply_list(shop_no, page);

		model.addAttribute("shop_no", shop_no);
		model.addAttribute("shopreply_list", shopreply_list);
		model.addAttribute("member_no", member_no);
		
		Page pageBean=shopreplyService.getShopreplyCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);

		ShopVO readShopBean = shopService.getShopInfo(shop_no);
		model.addAttribute("readShopBean", readShopBean);
		model.addAttribute("loginBean2", loginBean2);
		model.addAttribute("loginBean", loginBean);
		model.addAttribute(loginBean.getMember_no());

		return "shop/shop_detail";
	}


	//媛�寃� �닔�젙
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
	
	
	@PostMapping("/reply_pro")
	public String reply_pro(@Valid @ModelAttribute("joinShopreplyBean") Shop_ReplyVO joinShopreplyBean, 
			                BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "shop/reply_fail";
		}else {
			m.addAttribute("joinShopreplyBean", joinShopreplyBean);
			shopreplyService.shopreply_create(joinShopreplyBean);
			return "redirect:/shop/shop_detail?shop_no=" + joinShopreplyBean.getShop_no() +"&member_no=" + joinShopreplyBean.getMember_no();
		}
	}
	
	//댓글 삭제
	@GetMapping("/reply_delete")
	public String reply_delete(@ModelAttribute("DeleteShopreplyBean") Shop_ReplyVO DeleteShopreplyBean,
			                   @RequestParam("member_no") int member_no, 
			                   @RequestParam("shop_no") int shop_no,
			                   @RequestParam("shop_reply_no") int shop_reply_no,
			                   Model m) {
		
		m.addAttribute("loginBean.getMember_no()", loginBean.getMember_no());
		m.addAttribute("shop_no", shop_no);
		m.addAttribute("shop_reply_no", shop_reply_no);
		
		shopreplyService.deleteReply(DeleteShopreplyBean);
	    return "shop/reply_success";
	}
	
	/////
    @GetMapping("/recommend_list")
    public String recommend_list(@RequestParam("category_no") int category_no, 
                                 @RequestParam(value = "page", defaultValue = "1") int page, 
                                 Model model) {
      // 
      
      List<ShopVO> recommend_list = shopService.recommend_list(category_no, page);

      model.addAttribute("category_no", category_no);
      model.addAttribute("recommend_list", recommend_list);

      Page pageBean=shopService.getRecommendCnt(page);
      model.addAttribute("pageBean", pageBean);
      model.addAttribute("page", page);
      
      return "shop/recommend_list";
    }
    /////
	
	
	
	
	
}
