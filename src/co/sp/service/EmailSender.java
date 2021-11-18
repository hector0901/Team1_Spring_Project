package co.sp.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import co.sp.beans.EmailSet;

@Service
public class EmailSender {

	@Autowired
	protected JavaMailSenderImpl mailSender;
	
	public void SendEmail(EmailSet email) throws Exception{
        
        MimeMessage msg = mailSender.createMimeMessage();
        try{
            
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
            
        }catch(MessagingException e){
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        
        try{
            mailSender.send(msg);
        }catch(MailException e){
            System.out.println("MailException ¹ß»ý");
            e.printStackTrace();
        }
    }
}