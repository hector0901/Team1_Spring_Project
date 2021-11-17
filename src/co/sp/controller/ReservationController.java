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
      reservationService.reservation(reservationBean);
      return "reservation/reservation_success"; 
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
   * �α��ε� ȸ����ȣ + �����ȣ ���� 1�� ��ȸ
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

  
  
  

}
