package org.zerock.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class EmailSignController {

	@Autowired
	private JavaMailSender mailsender;
	
	
	 /* 이메일 인증 */
    @RequestMapping(value="/emailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("이메일 : " + email);
        
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
       
        String setFrom = "booktpjl@gmail.com";
        String toMail = email;
        String title = "bookstore_TPJ 인증 메일 입니다";
        String content = 
        		"홈페이지를 방문해주셔서 감사합니다. " + 
        		"<br><br>" + 
        		"인증번호는 <strong>" + checkNum + "</strong> 입니다." +
        		"<br>" + 
        		"해당 인증번호를 인증번호 확인란에 기입하여 주세요 .";
        
        
        try {
        	MimeMessage message = mailsender.createMimeMessage();
        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        	helper.setFrom(setFrom);
        	helper.setTo(toMail);
        	helper.setSubject(title);
        	helper.setText(content,true);
        	mailsender.send(message);
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
       
    }
    
    
    
    
    /* 이메일 인증 */
    @RequestMapping(value="/pasemailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String pasmailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("이메일 : " + email);
        
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
       
        String setFrom = "booktpjl@gmail.com";
        String toMail = email;
        String title = "bookstore_TPJ 인증 메일 입니다";
        String content = 
        		"홈페이지를 방문해주셔서 감사합니다. " + 
        		"<br><br>" + 
        		"인증번호는 <strong>" + checkNum + "</strong> 입니다." +
        		"<br>" + 
        		"해당 인증번호를 인증번호 확인란에 기입하여 주세요 .";
        
        
        try {
        	MimeMessage message = mailsender.createMimeMessage();
        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        	helper.setFrom(setFrom);
        	helper.setTo(toMail);
        	helper.setSubject(title);
        	helper.setText(content,true);
        	mailsender.send(message);
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
       
    }
    
    
    
	
}
