package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Bs_UserVO;
import org.zerock.service.BookMainService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
public class UsersearchController {
		
		@Autowired
	   private final BookMainService bookMainservice;
	
	 @GetMapping("/idsearch")
	   public String idsearch() {
	    
	      
	      return "idsearch";
	   }
	 
	 @GetMapping("/passearch")
	   public String passearch() {
	    
	      
	      return "passearch";
	   }
	
	 
	 @RequestMapping(value="/pasupdate", method=RequestMethod.POST)
	 @ResponseBody
	 public String pasupdate(Bs_UserVO vo) {
		
		 
		 String hashedPw = BCrypt.hashpw(vo.getUser_pw(), BCrypt.gensalt()); // 비밀번호암호화 
	     vo.setUser_pw(hashedPw); 
	      
	     log.info(vo);
		 bookMainservice.userupdate(vo);
	      
	      return "1";
	      
	 }
	 
	 
	 
	 @RequestMapping(value="/mailCntcheck", method=RequestMethod.GET)
	 @ResponseBody
	 public String mailCntcheck(Bs_UserVO vo) {
		
	      int result = bookMainservice.mailCheckCnt(vo);
	      
	      return Integer.toString(result);
	      
	 }
	 
	 
	 @PostMapping("/idsearch")
	   public String idsearchPost(Bs_UserVO vo, HttpServletRequest request) {
	     	
		Bs_UserVO id_check = bookMainservice.mailCheck(vo);
		
		request.setAttribute("myid", id_check.getUser_id());
		
		
		
	      return "/searchOk";
	   }
	 
	 
	 
	 @RequestMapping(value="/pasmailCntcheck", method=RequestMethod.GET)
	 @ResponseBody
	 public String pasmailCntcheck(Bs_UserVO vo) {
		
	      int result = bookMainservice.pasmailCheckCnt(vo);
	      
	      return Integer.toString(result);
	      
	 }
	 
	 
	 @PostMapping("/passearch")
	   public String pasidsearchPost(Bs_UserVO vo, HttpServletRequest request) {
	     	
		Bs_UserVO id_check = bookMainservice.pasmailCheck(vo);
		
		request.setAttribute("mypasid", id_check.getUser_id());
		
		
		
	      return "/searchOk";
	   }
	 
	 
	 
	 
	 
}
