package com.project.splace.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.splace.member.RandomNo;
import com.project.splace.member.model.vo.MailAuth;

@Controller
public class sendMailController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="sendCertiNo.sp", method=RequestMethod.POST)
	@ResponseBody
	public String sendCertiNo(String email) {

		Properties prop = new Properties(); 
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Authenticator auth = new MailAuth();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);
		
		String num = new RandomNo().getKey(10,true);

		try {
			msg.setSentDate(new Date());

			msg.setFrom(new InternetAddress("splace.2am@gmail.com", "Splace"));
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			
			msg.setSubject("인증코드 입니다.");
			
			logger.info(email);
			
	
			msg.setText("회원가입을 축하합니다! 아래 인증코드를 입력해주세요 \n인증 코드 : "+num);
			
			Transport.send(msg);
			
			logger.info("인증코드"+num);

		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
		
		return num;

	}

		
		
		
	}
	
	
	
