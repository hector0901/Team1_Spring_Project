package co.sp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.sp.beans.AdminVO;
import co.sp.beans.MemberVO;
import co.sp.beans.Page;
import co.sp.beans.WaitingVO;
import co.sp.service.WaitingService;

@Controller
@RequestMapping("/waiting")
public class WaitingListController {
	
	@Autowired
	private WaitingService waitingService;
	
	@Resource(name = "loginBean")
	private MemberVO loginBean;
	
	@Resource(name="loginBean2")
	private AdminVO loginBean2;
	
	@GetMapping("/waiting_list")
	public String waiting_list(@RequestParam("member_no") int member_no, 
			                   @RequestParam(value="page", defaultValue = "1") int page ,Model model) {
		List<WaitingVO> waiting_list=waitingService.waiting_list(member_no, page);
		
		model.addAttribute("member_no", member_no);
		model.addAttribute("waiting_list", waiting_list);
		model.addAttribute(loginBean.getMember_no());
		
		Page pageBean = waitingService.getWaitingCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		
		return "waiting/waiting_list";
	}
	
	@GetMapping("/waiting_detail")
	public String waiting_detail(@RequestParam("member_no") int member_no,
			                     @RequestParam("waiting_no") int waiting_no, Model model) {
		
		model.addAttribute("waiting_no", waiting_no);
		WaitingVO readWaitingBean = waitingService.getWaitingInfo(waiting_no);
		model.addAttribute("waiting_no", waiting_no);
		model.addAttribute("readWaitingBean", readWaitingBean);
		model.addAttribute("loginBean", loginBean);
		model.addAttribute(loginBean.getMember_no());
		
		return "waiting/waiting_detail";
	}
	
	/**
     * 관리자용 웨이팅 목록 화면 
     * @param model
     * @return
     */
    @GetMapping("/waiting_list_admin")
    public String waiting_list_admin(@RequestParam(value="page", defaultValue = "1") int page ,Model model) {
      List<WaitingVO> waiting_list_admin = waitingService.wating_list_admin(page);
      model.addAttribute("waiting_list_admin", waiting_list_admin);
      model.addAttribute(loginBean2.getAdmin_no());
      
      Page pageBean=waitingService.getWaitingAdminCnt(page);
      model.addAttribute("pageBean", pageBean);
      model.addAttribute("page", page);
      
      return "waiting/waiting_list_admin";
    }
}
