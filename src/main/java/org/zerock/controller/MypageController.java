package org.zerock.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.Bs_BookVO;
import org.zerock.domain.Bs_CartVO;
import org.zerock.domain.Bs_OrderDTO;
import org.zerock.domain.Bs_OrderVO;
import org.zerock.domain.Bs_PointVO;
import org.zerock.domain.Bs_UserVO;
import org.zerock.domain.KakaoPayVO;
import org.zerock.domain.OrderSerchPD;
import org.zerock.domain.PointSerchPD;
import org.zerock.service.BookMainService;
import org.zerock.service.CartService;
import org.zerock.service.OrderService;
import org.zerock.service.PointService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
public class MypageController {
   @Setter(onMethod_ = @Autowired)
   private CartService cartService;
   
   @Setter(onMethod_ = @Autowired)
   private OrderService orderService;
   

   @Setter(onMethod_ = @Autowired)
   private BookMainService bookMainService;
   
   @Setter(onMethod_ = @Autowired)
   private PointService pointService;
   

   
   
   
   @RequestMapping(value = "/cart", method = RequestMethod.GET)
      public String list(Model model, HttpSession session) {
         
         log.info("===========================");
         
         Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
         
         log.info("login array list : " + login);
         
         List<Bs_CartVO> myCartList =  cartService.read(login.getUser_id());
         
         
        
         for(int i = 0; i < myCartList.size() ; i++) {
            
            int bkNum = myCartList.get(i).getBk_num();
            
            Bs_BookVO myBook = bookMainService.detail(bkNum);
            
            myCartList.get(i).setPickurl(myBook.getBk_thumbUrl());
            myCartList.get(i).setBk_name(myBook.getBk_name());
            myCartList.get(i).setBk_price(myBook.getBk_price());
         
         } //list에 book정보를 넣어주기 위함 
        
         
         model.addAttribute("myCartList", myCartList);

         return "mycart";
         
         
      }
   
   
   
//      @GetMapping("/home")
//      public String myhome(Model model) throws IOException {
//      
//         log.info("===========================");
//         
//         String user_id = "userid50";
//         List<Bs_OrderVO> myOrderList =  orderService.read(user_id);
//         
//         
//         model.addAttribute("myOrderList", myOrderList);
//         
//         for(int i = 0; i < myOrderList.size() ; i++) {
//            myOrderList.get(i).setBk_pick("https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F9958193E5F9CA090112295");
//            myOrderList.get(i).setBk_name("å ̸ " + myOrderList.get(i).getBk_num());
//            myOrderList.get(i).setBk_price(15000);
//         }
//         
//         
//         
//         return "myRoom/main";
//      }
      
      
      
   
      @GetMapping("/order")
      public String orderpage(Model model , HttpSession session 
            ,@RequestParam(required = false, defaultValue = "1") int page
            ,@RequestParam(required = false, defaultValue = "1") int range
            ,@RequestParam(required = false) String searchType
            ,@RequestParam(required = false) String keyword
            ,@RequestParam(required = false) String endDate
            ,@RequestParam(required = false) String startDate
            ) throws IOException {
         
      log.info("order start : ==========================");
      
      log.info("order 값 : " + endDate + startDate);
      
         Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
         
         String user_id = login.getUser_id();
        
         // 페이징을 위한 set처리
         OrderSerchPD serchPD = new OrderSerchPD();
         
         serchPD.setUser_id(user_id);
         serchPD.setStartDate(startDate);
         serchPD.setEndDate(endDate);
         serchPD.setKeyword(keyword);
         serchPD.setSearchType(searchType);
        
         // 위에서 설정한 값들로 searchlist의 길이값을 구한다 
         int myOrderListCnt =  orderService.searchlistcnt(serchPD);
         serchPD.pageInfo(page, range, myOrderListCnt);
         
         // 위에서 설정한 값들로 searchlist 를 구한다 
         List<Bs_OrderVO> myOrderList =  orderService.searchlist(serchPD);
          
      
      
         for(int i = 0; i < myOrderList.size() ; i++) { // sarchlist에 책 섬네일과 이름 갸격정보를 담아준다
         
  
               int bkNum = myOrderList.get(i).getBk_num();
               
                  
               Bs_BookVO myBook = bookMainService.detail(bkNum);

               log.info("myBook ?? : " + myBook);
               
               myOrderList.get(i).setBk_pick(myBook.getBk_thumbUrl());
               myOrderList.get(i).setBk_name(myBook.getBk_name());
               myOrderList.get(i).setBk_price(myBook.getBk_price());
               
         
         }
         
         
         model.addAttribute("pagination", serchPD);   
         model.addAttribute("myOrderList", myOrderList);
         
         
         
         return "myRoom/myorder";
         
      }
      
      
   
      @GetMapping("/paylist")
      public String paylist(Model model , HttpSession session 
            ,@RequestParam(required = false, defaultValue = "1") int page
            ,@RequestParam(required = false, defaultValue = "1") int range
            ,@RequestParam(required = false) String endDate
            ,@RequestParam(required = false) String startDate
            ) throws IOException {
         
         Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
                     
         String user_id = login.getUser_id();
         //페이징을 위한 set처리 
         PointSerchPD serchPD = new PointSerchPD();
         
         serchPD.setUser_id(user_id);
         serchPD.setStartDate(startDate);
         serchPD.setEndDate(endDate);
         
         // 위에서 설정한 값들로 myPointList의 길이값을 구한다 
         int myPointListCnt =  pointService.dateReadCnt(serchPD);
         serchPD.pageInfo(page, range, myPointListCnt);
         
         
         // 위에서 설정한 값들로 myPointList를 구한다 
         List<Bs_PointVO> pVo =  pointService.dateRead(serchPD);
         
         serchPD.pageInfo(page, range, myPointListCnt);
         
         model.addAttribute("pagination", serchPD);   
         model.addAttribute("paylist", pVo);
         
         
         return "myRoom/paylist";
         
   }
      
      
      
      
   
   
   @RequestMapping(value = "/cartdel", method = RequestMethod.POST)
   @ResponseBody
   public String cartdel( HttpServletRequest request,@RequestParam("chkbox") ArrayList<String> chkbox ) throws IOException {
      int result = 0;
      
      for(String cNum : chkbox) {
         result = cartService.delete(cNum);
         
         if(result == 0) {
            log.info("     " + result);
            break ; 
         }
      
      }
   
      
      return Integer.toString(result);
   }
   
   
   
   
   
//   @RequestMapping(value = "/mypage/pay", method = RequestMethod.POST)
//   public String pay(@ModelAttribute(value="Bs_OrderDTO") Bs_OrderDTO dto) throws IOException {
//   
//      log.info("vo Ȯ   : " + dto);
//      
//      return "mycart";
//   }
   
   
   
   
   @RequestMapping(value = "/modify", method = RequestMethod.GET)
   public String usermodify(Model model, HttpSession session) {
       
      

      return "myRoom/modify";
   }
   
   
   
   @RequestMapping(value = "/modify", method = RequestMethod.POST)
   public String modify(Bs_UserVO vo, HttpSession session) {
       
      
      log.info("가져온 값 " + vo);
      if( vo.getUser_pw() != null) { //비밀번호 암호화 
         String hashedPw = BCrypt.hashpw(vo.getUser_pw(), BCrypt.gensalt()); 
         vo.setUser_pw(hashedPw); 
      }
      
      bookMainService.userupdate(vo); //회원정보 업데이트 
      
      Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
      login.setUser_name(vo.getUser_name());
      login.setUser_phone(vo.getUser_phone());
      login.setUser_addr(vo.getUser_addr());
      
      session.setAttribute("login", login);
      

      return "myRoom/modify";
   }
   
   
   @RequestMapping(value = "/point", method = RequestMethod.GET)
   public String pointinit(Model model, HttpSession session) {
       
      Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
      login = bookMainService.login(login);
      session.setAttribute("login", login); //포인트 db 업데이트 된 것을 session에 업데이트 해주기 위함 

      return "myRoom/point";
   }
   
   @RequestMapping(value = "/point", method = RequestMethod.POST)
   public String pointupdate( Bs_PointVO pVo, HttpSession session) {
      
      log.info("pVo 값 : " + pVo);
      pointService.insert(pVo);
      Bs_UserVO uVo = new Bs_UserVO();
      uVo.setUser_id(pVo.getUser_id());
      uVo.setUser_point(pVo.getPoint());
      
      bookMainService.userpointupdate(uVo); //유저포인트 업데이트 
      
      
      Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
      login.setUser_point(pVo.getPoint());
      session.setAttribute("login", login);
      

      return "redirect:/mypage/paylist";
   }
}