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
import co.sp.beans.Page;
import co.sp.beans.ReservationVO;
import co.sp.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
  
  @Autowired
  private ReservationService reservationService;
  
  @Resource(name = "loginBean")
  private MemberVO loginBean;
  
  @Resource(name = "loginBean2")
  private AdminVO loginBean2;

  @GetMapping("/reservation")
  public String reservation(@ModelAttribute("reservationBean") ReservationVO reservationBean,
                            @RequestParam("member_no") int member_no, 
                            @RequestParam("shop_no") int shop_no) {
    
    reservationBean.setMember_no(member_no);
    reservationBean.setShop_no(shop_no);
    
    return "reservation/reservation";
  }
  
  @PostMapping("reservation_pro")
  public String reservation_pro(@Valid @ModelAttribute("reservationBean") ReservationVO reservationBean,
                                BindingResult result, Model m) {
    
    
    if (result.hasErrors()) {
      return "reservation/reservation"; 
    } else {
      m.addAttribute("reservationBean", reservationBean);
//      reservationService.reservation(reservationBean);
      return "reservation/pay"; 
    }
    
  }
  
  @GetMapping("/reservation_list")
  public String reservation_list(@RequestParam("member_no") int member_no,
		                         @RequestParam(value = "page", defaultValue = "1") int page ,Model model) {
    
    model.addAttribute("member_no", member_no);
    model.addAttribute("loginBean.getMember_no()", loginBean.getMember_no());
    
    List<ReservationVO> reservation_list = reservationService.reservation_list(member_no, page);
    model.addAttribute("reservation_list", reservation_list);
    
    Page pageBean=reservationService.getReservationCnt(page);
    model.addAttribute("pageBean", pageBean);
    model.addAttribute("page", page);

    return "reservation/reservation_list";
  }
  
  /**
   * 로그인된 회원번호 + 예약번호 기준 1건 조회
   * @param reservation_no
   * @param member_no
   * @param model
   * @return
   */
  @GetMapping("/reservation_read")
  public String reservation_read(@RequestParam("reservation_no") int reservation_no, 
                                 @RequestParam("member_no") int member_no,
                                 Model model) {
    
    model.addAttribute("reservation_no", reservation_no);
    model.addAttribute("member_no", member_no);
    model.addAttribute("loginBean.getMember_no()", loginBean.getMember_no());
    
    ReservationVO reservation_read = reservationService.reservation_read(reservation_no);
    model.addAttribute("reservation_read", reservation_read);

    return "reservation/reservation_read";
    
  }
  
  
  @GetMapping("/reservation_delete")
  public String reservation_delete(@RequestParam("reservation_no") int reservation_no, 
                                 Model model) {
    
    reservationService.reservation_delete(reservation_no);
    //model.addAttribute("reservation_no", reservation_no);
    //model.addAttribute("loginBean.getMember_no()", loginBean.getMember_no());

    return "reservation/reservation_delete";

  }
  
  
  //결제
	@GetMapping("/pay")
	public String pay(@RequestParam("pay_no") int pay_no,
			Model model) {

		model.addAttribute("pay_no", pay_no);

		return "reservation/kakaopay";
	}

	@GetMapping("/kakaopay")
	public String kakaopay(@RequestParam("pay_no") int pay_no,
			               @ModelAttribute("reservationBean") ReservationVO reservationBean, Model model) {

	  model.addAttribute("pay_no", pay_no);
      reservationService.reservation(reservationBean);
      return "reservation/kakaopay";
      
	}

	  
    /////
    /**
     * 관리자용 예약 목록 화면 
     * @param model
     * @return
     */
	@GetMapping("/reservation_list_admin")
    public String reservation_list_admin(@RequestParam(value="page", defaultValue = "1") int page ,Model model) {
      List<ReservationVO> reservation_list_admin = reservationService.reservation_list_admin(page);
      model.addAttribute("reservation_list_admin", reservation_list_admin);
      model.addAttribute(loginBean2.getAdmin_no());
      
      Page pageBean=reservationService.getReservationAdminCnt(page);
      model.addAttribute("pageBean", pageBean);
      model.addAttribute("page", page);
      
      return "reservation/reservation_list_admin";
    }
    /////

}
