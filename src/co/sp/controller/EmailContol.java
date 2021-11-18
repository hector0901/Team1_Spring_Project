package co.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import co.sp.beans.EmailSet;
import co.sp.service.EmailSender;

@Controller
public class EmailContol {

	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping("/member/mail")
	public void sendPassword() throws Exception{
    
	    System.out.println("Email Controller");
	    
	    EmailSet email = new EmailSet();
	    email.setReceiver("cso3398@gmail.com");
	    email.setSubject("Sul Sure ��й�ȣ ã�� ���");
	    email.setContent("������ ��й�ȣ�� �Դϴ�.");
	    
	    emailSender.SendEmail(email);
	}
    
}