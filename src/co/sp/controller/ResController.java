package co.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import co.sp.service.MemberService;


@RestController
public class ResController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member/checkMemberIdExist/{member_id}")
	public String checkMemberIdExist(@PathVariable String member_id) {
		
		boolean check = memberService.checkMemberIdExist(member_id);
		
		return check + "";
	}
}












