package org.zerock.controller;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Bs_BookVO;
import org.zerock.domain.Bs_CartVO;
import org.zerock.domain.Bs_CodeVO;
import org.zerock.domain.Bs_ReviewVO;
import org.zerock.domain.Bs_UserVO;
import org.zerock.domain.PaginationPD;
import org.zerock.domain.SearchPD;
import org.zerock.service.BookMainService;
import org.zerock.service.KakaoAPI;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class HomeController {
   @Autowired
   private final BookMainService service;
   private final KakaoAPI kakao;
   
   
   @GetMapping("/remain")
   public String remain() {
      return "mainRe";
   }
   
   
   @RequestMapping(value="/kakaoLogin" ,method = RequestMethod.GET )
   public String login(@RequestParam("code") String code, HttpSession session) throws Exception{
	   
	   System.out.println("code : " + code);
	   String access_Token = kakao.getAccessToken(code);
	   HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	   System.out.println("login Controller : " + userInfo);
	   
	   String userId = (String)userInfo.get("email");
	   String userNickName = (String)userInfo.get("nickname");
	   
	   System.out.println("userId : " + userId);
	   
	   int check = service.check(userId);
	   
	   if(check == 0) {
		   
		   service.regiUser(userId, userNickName);
		   

		   
	   }
	   
	   Bs_UserVO user = service.infoUser(userId);
	   
	   session.setAttribute("login", user);
	   
	   return "redirect:/main";
	   
   }
  
   
   @RequestMapping(value="/googleLogin" ,method = RequestMethod.POST )
   @ResponseBody
   public String login(@RequestParam("email") String email,@RequestParam("userName") String userName, HttpSession session) throws Exception{
   
	  
	   
	   System.out.println("email : " + email);
	   System.out.println("userName : " + userName);
	   
	   int check = service.check(email);
	   
	   	   if(check == 0) {
		   
		   service.regiUser(email, userName);

		   
	   }
	   	   
	   Bs_UserVO user = service.infoUser(email);
		   
		   session.setAttribute("login", user);
		   
		   
		   return "suc";
		
		 
		
		   
   }
   
   
//   @RequestMapping(value="/kakaoLogout")
//   public String kakaoLogout(HttpSession session) {
//       kakao.kakaoLogout((String)session.getAttribute("access_Token"));
//       session.removeAttribute("access_Token");
//       session.removeAttribute("userId");
//       session.invalidate();
//       return "redirect:/main";
//   }
   
   //로그인 페이지로 이동
   @GetMapping("/login")
   public String login() {
      return "loginMain";
   }
   //회원가입 페이지로 이동
   @GetMapping("/join")
   public String join() {
      return "joinForm";
   }
   //회원가입 화면에서 파라미터로 가져오는 아이디가 데이터베이스에 존재하는지 체크
   @RequestMapping(value = "/idCheck",method = RequestMethod.GET, produces = "application/text; charset=utf8")
   @ResponseBody
   public String idCheck(HttpServletRequest request) {
      
      String user_id = request.getParameter("user_id");//request값으로 전달받은 유저아이디를 변수에 담음
      int result=service.idCheck(user_id);//유저아이디를 서비스로 전달
      return Integer.toString(result);	//데이터베이스에서 가져온 result값을 스트링 값으로 변경해 return 시켜줌
   }
   //회원가입을 완료하면 로그인 창으로 이동
   @PostMapping("/join")
   public String joinForm(Bs_UserVO vo,RedirectAttributes redirectAttributes) {
      String hashedPw = BCrypt.hashpw(vo.getUser_pw(), BCrypt.gensalt()); //파라미터로 가져온 패스워드를 암호화.
      vo.setUser_pw(hashedPw); //vo패스워드에 암호화 된 패스워드를 넣어줌
      service.register(vo);  //암호화 된 회원가입 정보를 서비스에 전달.
      
      return "redirect:/login";
   }
   //로그인 정보가 일치하는지 확인.
   @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
   @ResponseBody
   public String login(@RequestBody Bs_UserVO vo, HttpSession session) throws Exception {
      
      String result = null;
      
      Bs_UserVO user = service.login(vo); //로그인 시도한 회원의 아이디와 일치하는 정보를 user에 할당.
      //아이디 존재 -> 가입된 회원이 존재 -> 비밀번호 확인 필요
      if(user != null&&BCrypt.checkpw(vo.getUser_pw(), user.getUser_pw())) { //아이디값이 null이 아니고 데이터베이스에서 가져온 암호화된 패스워드와 
    	  																	 //파라미터로 전달된 패스워드를 암호화시켜 비교후 값이 일치하면 session에 저장 후 result값을 loginSuccess로 전달(로그인 성공)
         session.setAttribute("login", user);
         result = "loginSuccess";
         
      } else {  //아이디가 존재하지 않음
         result = "idFail";
      }
      
      return result;
   }
   //로그인이 성공하면 메인으로 이동.
   @PostMapping("/login")
   public String login2() {
      return "redirect:/main";
   }
   //로그인이 성공하면 메인으로 이동.
    @GetMapping("/main")
    public String main(Model model, HttpSession session) throws Exception {
    	Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");//세션에 담겨있는 유저정보를 변수에 저장.
    	if(login!=null) {//세션에서 가져온 정보가 null이 아니면 실행
        	String user_id = login.getUser_id();//세션에 있는 유저아이디를 변수에저장
        	log.info("userid"+user_id);
        		Bs_UserVO selectPoint = service.selectPoint(user_id);//유저 아이디를 서비스로 전달
        		List<Bs_BookVO> ranklist=service.rankselect();//서비스로 이동
        		List<Bs_BookVO> list=service.dateselect();//서비스로 이동
        		List<Bs_BookVO> bestlist=service.bestselect();//서비스로 이동
        		model.addAttribute("userinfo", selectPoint);//로그인 되어있는 유저의 포인트를 모델에 담음.
        		model.addAttribute("ranklist",ranklist);//평점순으로 되어있는 책들을 모델에 담음(limit.10)
        		model.addAttribute("list", list);//출간일 순서대로 되어있는 책들을 모델에 담음(limit.10)
        		model.addAttribute("bestlist", bestlist);//판매된 수량 순서대로 되어있는 책들을 모델에  담음(limit.10)
        		return "main";
    	}
    	else {//세션에서 가져온 정보가 null이면 실행
    		List<Bs_BookVO> ranklist=service.rankselect();//서비스로 이동
    		List<Bs_BookVO> list=service.dateselect();//서비스로 이동
    		List<Bs_BookVO> bestlist=service.bestselect();//서비스로 이동
    		model.addAttribute("ranklist",ranklist);//평점순으로 되어있는 책들을 모델에 담음(limit.10)
    		model.addAttribute("list", list);//출간일 순서대로 되어있는 책들을 모델에 담음(limit.10)
    		model.addAttribute("bestlist", bestlist);//판매된 수량 순서대로 되어있는 책들을 모델에  담음(limit.10)
    		return "main";
    	}
    	
    }
    
    //카트데 담음 수량과 책에대한 정보를 카드에 담음
    @RequestMapping(value = "/addcart", method = RequestMethod.POST)
    @ResponseBody
    public String addcart(Bs_CartVO vo) {
       String result=null;
       log.info("vo : " + vo);
       
       
          if(vo!=null) {//전달받은 정보가 null이 아니면 실행
             service.addcart(vo);//전달받은 정보를 서비스로 전달
             result="success";//result값에 success를 담음.
          }
          else {//전달받은 정보가 null이면 실행
             result="fail";//result값에 fail을 담음.
          }
       return result;//result값을 리턴
    }
    
    //댓글을 데이터베이스에 저장.
    @RequestMapping(value = "/comment", method=RequestMethod.POST)
    @ResponseBody
    public String comment(Bs_ReviewVO vo) throws Exception {
       log.info("vo : "+ vo);
       String result = null;
       int ordCheck = service.ordCheck(vo);//파라미터로 책정보를 서비스로 전달.
       if(ordCheck==0) {//댓글을 남기려는 사용자가 책을 구매하지 않았으면 실행.
          result="notorder";//result값에 notorder을 넣어줌.
       }
       else {//댓글을 남기려는 사용자가 책을 구매했으면 실행
          service.comment(vo);//구매자의 정보와 함께 작성한 댓글 및 평점을 서비스로 전달.
          int bk_num=vo.getBk_num();//파라미터로 받은 책번호를 변수에 담음.
          double sum=service.selectsum(bk_num);//책번호를 서비스로 넘겨서 책에대한 평점을 모두 더한 값 을 변수에 저장.
           int count=service.rankcount(bk_num);//책번호를 서비스로 점겨서 책에대한 평점을 카운트한 값을 변수에 저장.
           double avg=sum/count;//책에대한 평균을 구함.
           double revrank=(double)Math.round(avg*10)/10;//소수점 첫번째 자리까지만 나오게하고 나머지는 모두 탈락.
           service.revupdate(revrank, bk_num);//책 평균 평점과 책번호를 서비스로 넘김.
          result="order";//result값에 order값을 저장.
       }
       return result;//result값을 return.
       
    }
    //댓글 삭제
    @RequestMapping(value = "/commentDelete", method = RequestMethod.GET)
   @ResponseBody
    public void commentDelete(Bs_ReviewVO vo) {
       log.info("vo : "+vo);
       service.commentdelete(vo);//댓글에 대한 정보를 서비스로 넘김.
   }
    //댓글 수정
    @RequestMapping(value = "/commentUpdate", method = RequestMethod.POST)
   @ResponseBody
    public void commentUpdate(Bs_ReviewVO vo) {
       log.info("vo : "+vo);
       service.commentupdate(vo);//댓글에 대한 정보를 서비스로 넘김.
   }
    //로그아웃
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout(HttpSession session) {
     
      session.invalidate();//세션에 저장된 값을invalidate함.
      return "redirect:/main";//로그아웃 후 메인페이지로 돌아감.
   }
    //상세페이지로 이동
    @GetMapping("/detail")
    public String detail(Model model
          , @RequestParam(required = false)int num//책번호를 넘겨받음
          , @RequestParam(required = false, defaultValue = "1") int page//페이징에 필요
          , @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
       model.addAttribute("bk_num", num);//책번호를 모델에 담음 
       log.info("bk_num : "+num);
       int bk_num = num;//책번호를 변수에 저장.
       double sum=service.selectsum(bk_num);//책번호를 서비스로 넘겨서 책에대한 평점을 모두 더한 값 을 변수에 저장.
       int count=service.rankcount(bk_num);//책번호를 서비스로 점겨서 책에대한 평점을 카운트한 값을 변수에 저장.
       double avg=sum/count;//책에대한 평균을 구함.
       double rank=(double)Math.round(avg*10)/10;//소수점 첫번째 자리까지만 나오게하고 나머지는 모두 탈락.
       log.info("rank : "+rank);
       log.info("count : "+count);
       log.info("sum :"+sum);
       model.addAttribute("rank", rank);//책에 대한 평점평균을 모델에 담음.
       model.addAttribute("book", service.detail(bk_num));//책에대한 정보를 모델에 담음.
       
       SearchPD search = new SearchPD();//SearchPD의 객체를 생성.
       search.setBk_num(bk_num);//객체로 생성된 search에 책번호를 넣어줌.
       
       int listCnt = service.decommentcnt(search);//책에대한 전체 댓글의 수를 변수에 저장.
       log.info("listCnt 값 :" + listCnt);
      
       search.pageInfo(page, range, listCnt);//현재페이지, 마지막페이지, 전댓글의수를 넘김.
       model.addAttribute("pagination", search);//모델에 페이징을 할 정보를 담아줌.
       model.addAttribute("comment", service.decomment(search));//댓글을 10개씩 출력할 수 있도록 댓글을 가지고 모델에 담아줌.
       return "detail";
    }

   //검색페이지.
    @RequestMapping(value = "/search", method = RequestMethod.GET)
   public String getBookList(Model model
         , @RequestParam(required = false, defaultValue = "0") int cateCode//카테고리 코드를 넘겨받음
         , @RequestParam(required = false, defaultValue = "0") int best//베스트로 검색되면 1값이 넘어옴.
         , @RequestParam(required = false, defaultValue = "0") int newbook//신간으로 검색되면 1값이 넘어옴.
         , @RequestParam(required = false, defaultValue = "1") int page//페이징.
         , @RequestParam(required = false, defaultValue = "1") int range//페이징.
         , @RequestParam(required = false, defaultValue = "title") String searchType//검색이되면 어떤검색인지 넘어옴.
         , @RequestParam(required = false) String keyword//검색한 키워드가 엄어옴.
         ) throws Exception {
       log.info("cateCode : "+cateCode);
       if(cateCode!=0 && best==0 && newbook==0) {//카테고리로 검색되었을 경우 실행.
          model.addAttribute("code",cateCode);//모델에 카테고리로 넘겨받은 파라미터를 넣어줌.
          model.addAttribute("best",best);//모델에 베스트셀러로 넘겨받은 파라미터를 넣어줌.
          model.addAttribute("newbook",newbook);//모델에 신간도서로 넘겨받은 파라미터를  넣어줌.
         SearchPD search = new SearchPD();//SearchPD의 객체를 생성.
          search.setCode(cateCode);//객체로 생성된 search에 카테고리를 넣어줌.
          
          int listCnt = service.getBookListCnt(search);//카테고리에 대한 전체 책의 수를 변수에 저장.
          log.info("listCnt 값 :" + listCnt);
          search.pageInfo(page, range, listCnt);//현재페이지, 마지막페이지, 검색된 책의수를 넘김.
          
          model.addAttribute("listCnt",listCnt);//모델에 검색된 책의수를 담음.
          model.addAttribute("pagination", search);//모델에 페이징을 할 정보를 담아줌.
          model.addAttribute("bookList", service.getBookList(search));//책을 10권씩 출력할 수 있도록 책을 모델에 담아줌.
         return "search";
       }
       else if(best!=0 && cateCode==0 && newbook==0) {//베스트셀러로 검색되었을때 실행
          model.addAttribute("code",cateCode);//모델에 카테고리로 넘겨받은 파라미터를 넣어줌.
          model.addAttribute("best",best);//모델에 베스트셀러로 넘겨받은 파라미터를 넣어줌
          model.addAttribute("newbook",newbook);//모델에 신간도서로 넘겨받은 파라미터를  넣어줌.
          
         SearchPD search = new SearchPD();//SearchPD의 객체를 생성.
          search.setBest(best);//객체로 생성된 search에 setBest 1을 넣어줌.
          
          int listCnt = service.revranklistcnt();//판매개수 순서대로 전체 책의 수를 변수에 저장.
          log.info("listCnt 값 :" + listCnt);
          
          search.pageInfo(page, range, listCnt);//현재페이지, 마지막페이지, 검색된 책의수를 넘김.
          
          model.addAttribute("listCnt",listCnt);//모델에 판매개수 순서대로 전체 책의 수를 담음.
          model.addAttribute("pagination", search); //모델에 페이징을 할 정보를 담아줌.  
          model.addAttribute("bookList", service.revranklist(search));//책을 10권씩 출력할 수 있도록 책을 모델에 담아줌.
         return "search";
       }
       else if(newbook!=0 && cateCode==0 && best==0) {//신간도서로 검색 되었을때 실행.
          model.addAttribute("code",cateCode);//모델에 카테고리로 넘겨받은 파라미터를 넣어줌.
          model.addAttribute("best",best);//모델에 베스트셀러로 넘겨받은 파라미터를 넣어줌
          model.addAttribute("newbook",newbook);//모델에 신간도서로 넘겨받은 파라미터를  넣어줌.
         
          SearchPD search = new SearchPD();//SearchPD의 객체를 생성.
          search.setNewbook(newbook);//객체로 생성된 search에 setNewbook에 1을 넣어줌.
          
          int listCnt = service.newbooklistcnt();//출간일 순서대로 전체 책의 수를 변수에 저장.
          log.info("listCnt 값 :" + listCnt);
          
          search.pageInfo(page, range, listCnt);//현재페이지, 마지막페이지, 검색된 책의수를 넘김.
          
          model.addAttribute("listCnt",listCnt);//모델에 출간일 순서대로 전체 책의 수를 담음.
          model.addAttribute("pagination", search);   //모델에 페이징을 할 정보를 담아줌.  
          model.addAttribute("bookList", service.newbooklist(search));//책을 10권씩 출력할 수 있도록 책을 모델에 담아줌.
          return "search";
       }
       else {//키워드로 검색되었을때 실행.
          model.addAttribute("keyword",keyword);//모델에 검색된 키워드를 넣어줌.
          model.addAttribute("code",cateCode);//모델에 카테고리로 넘겨받은 파라미터를 넣어줌.
          model.addAttribute("best",best);//모델에 베스트셀러로 넘겨받은 파라미터를 넣어줌
          model.addAttribute("newbook",newbook);//모델에 신간도서로 넘겨받은 파라미터를  넣어줌.
          log.info("searchType : "+searchType);
          log.info("keyword : "+keyword);
          SearchPD search = new SearchPD();//SearchPD의 객체를 생성.
          search.setSearchType(searchType);//객체로 생성된 search에 setSearchType에 파라미터로 전달받은 searchType을 넣어줌.
          search.setKeyword(keyword);//객체로 생성된 search에 setKeyword에 파라미터로 전달받은 keyword를 넣어줌.
          
          int listCnt = service.searchlistcnt(search);//검색 된 전체 책의 수를 변수에 저장.
          log.info("listCnt 값 :" + listCnt);
          
          search.pageInfo(page, range, listCnt);//현재페이지, 마지막페이지, 검색된 책의수를 넘김.
          
          model.addAttribute("listCnt",listCnt);//모델에 검색 된  전체 책의 수를 담음.
          model.addAttribute("pagination", search);//모델에 페이징을 할 정보를 담아줌.  
          model.addAttribute("bookList", service.searchlist(search));//책을 10권씩 출력할 수 있도록 책을 모델에 담아줌.
          return "search";
       }
   }
}