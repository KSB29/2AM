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
		/*
		final String user = "tjdcksghkd12@gmail.com"; //발신자의 이메일 아이디를 입력 final String password = "password";
		final String password ="tjdcks12!";

		// Property에 SMTP 서버 정보 설정
		Properties prop = new Properties(); 
		prop.put("mail.smtp.host", "smtp.gmail.com"); 
		prop.put("mail.smtp.port", 465); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//logger.info(user);
		//logger.info(user);
		
		
		// SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성한다.
		

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                
            	return new PasswordAuthentication(user, password);   
                
            }
        });
		// 난수 자릴수를 정해 생성, 호출
		String num = new RandomNo().getKey(6,true);	   
		
		
		try {
	            MimeMessage msg = new MimeMessage(session);
	            msg.setFrom(new InternetAddress(user));
				//InternetAddress to = new InternetAddress(email);

	            //수신자메일주소
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
				//msg.addRecipient(Message.RecipientType.TO, to); 
	            
	            // 인증번호 전송
				
	            // 제목입력
	            msg.setSubject("무한한 공간대여 splace! 이메일 인증번호가 도착했어요 :p"); //메일 제목을 입력
	            
	            // 내용 입력
	            msg.setText("아래 인증코드를 입력 후 확인 버튼을 눌러주세요! \n"+"인증 코드 :"+num ); //메일 내용을 입력
	            
	            // 메세지 전송
	            Transport.send(msg); ////전송
	            
	            //logger.info("메세지 전송 성공");
	           // logger.info("인증번호 :"+num);
	            
	            
	        } catch (AddressException e) {
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }
		
		 	//return num;

		 	
		 	 */
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

			msg.setFrom(new InternetAddress("tjdcksghkd12@gmail.com", "Splace"));
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
	
	
	
