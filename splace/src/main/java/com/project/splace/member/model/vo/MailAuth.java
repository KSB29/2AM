package com.project.splace.member.model.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class MailAuth extends Authenticator{
    
    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "splace.2am@gmail.com";
        String mail_pw = "asd159//";
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
