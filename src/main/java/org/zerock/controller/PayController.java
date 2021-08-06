package org.zerock.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.Bs_OrderDTO;
import org.zerock.domain.Bs_OrderList;
import org.zerock.domain.Bs_PayInfoVo;
import org.zerock.domain.Bs_PointVO;
import org.zerock.domain.Bs_UserVO;
import org.zerock.domain.PointSerchPD;
import org.zerock.service.BookMainService;
import org.zerock.service.BookStoreService;
import org.zerock.service.PointService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/pay/*")
@Log4j
public class PayController {
	
	@Autowired
	private BookStoreService service;
	
	@Autowired
	private PointService pointService;
	
	@Autowired
	private BookMainService bookMainService;
	
	
	@GetMapping("/payment")
	public String pay(Model model, HttpSession session) throws Exception {
		
		Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
	    String userID = login.getUser_id(); // 로그인 세션에서 userID 출력 설정
	    

	    log.info(userID);
	    model.addAttribute("addList", service.addrList(userID));  // userID에 등록되어있는 주소록 출력 전달
		
		return "pay/payment";
	}
	
    // 장바구니 페이지 -> 결제페이지
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(@ModelAttribute(value="Bs_OrderDTO") Bs_OrderDTO dto, HttpSession session, Model model) throws Exception {
		
		Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
	    String userID = login.getUser_id();
	    
	    log.info(userID);
	    model.addAttribute("addList", service.addrList(userID));
	    
	    log.info(dto);
	    log.info(dto.getOrderlist().size());
	
	    List<Bs_OrderList> list = new ArrayList<Bs_OrderList>(); // 전달받은 값 저장을 위한 List 객체생성
	    
	    
	   
	    for(int i = 0 ; i < dto.getOrderlist().size(); i++ ) {
	    	
	    	String chkBox = dto.getOrderlist().get(i).getChkBox(); // List 파라미터에서 i번째 ChkBox 값 저장 
	    	
	    	log.info(chkBox);
	    	
	    	if(chkBox != null) { // ChkBox 값이 null이 아니면
	    	
	    	int bk_num = dto.getOrderlist().get(i).getBk_num(); // i번쨰 도서번호 저장	    	
	    	
	    	Bs_OrderList orderList = service.payList(bk_num);	// 도서번호로 도서정보 출력    	
	    	orderList.setBk_ordercnt(dto.getOrderlist().get(i).getBk_ordercnt()); // 도서정보에 전달받은 수량 입력
	    	orderList.setCart_num(dto.getOrderlist().get(i).getCart_num());  // 도서정보에 전달받은 cartNum 입력
	    	
	    	log.info(orderList.getBk_name());
	    	
	    	list.add(orderList); // List에 새로 셋팅된 정보 추가
	    	
	    	}
	    }
	    
	   
	    model.addAttribute("list", list); // model 이용 View로 List 정보 전달
		
	    	
		return "pay/payment";
	
	}
	
	// 사용자 주소 추가
	@RequestMapping(value = "/regiaddr", method = RequestMethod.POST) 
	@ResponseBody
	public void stockAdd(@RequestParam("userID") String userID,
					     @RequestParam("name") String name,
					     @RequestParam("phone") int phone,
					     @RequestParam("addr") String addr) throws	Exception  {
		
		
	    
		log.info(userID);
		log.info(name);
		log.info(phone);
		log.info(addr);
		
		service.addAddress(userID, name, phone, addr);   
	 
		
	}
	
	@RequestMapping(value ="/LastPayment", method = RequestMethod.POST)
	@ResponseBody
	public void lastPayment(Bs_PayInfoVo vo, HttpSession session) throws Exception {
		
		log.info(vo);		
		
		
		service.payContent(vo); // 주문내역 등록
		service.addBookSel(vo); // 도서판매수량 등록
		service.minuStock(vo); //  도서 재고 차감
		service.delCart(vo); // 구매된 도서 장바구니에서 삭제
		service.minuPoint(vo); // 사용된 포인트 적용
		
		PointSerchPD pPd = new PointSerchPD();
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date time = new Date();
		String time1 = format1.format(time);
		
		pPd.setEndDate(time1);
		pPd.setStartDate(time1);
		pPd.setUser_id(vo.getUserId());
		
		log.info("pPd 값 : " + pPd);
		List<Bs_PointVO> pVo = pointService.dateRead(pPd);
		
		
		int pVoPoint = pVo.get(0).getPoint();
		int voPoint = vo.getUserPoint();
		
		log.info("pVoPoint 값 : " + pVoPoint);
		log.info("voPoint 값 : " + voPoint);
		
		if(pVoPoint != voPoint) {
			log.info("if문 : " + pVo.get(0).getPoint());
			log.info("if문 : " + vo.getUserPoint());
			service.infoPayment(vo);
		}
	
		
		
		// 유저 등급 업데이트 관련
		Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
	    String userID = login.getUser_id();    
	    
	    Integer user_amount = service.user_amount(userID); // userID로 유저가 사용한 총 포인트 출력
	    
		int user_rank = login.getUser_rank(); // 현재 유저 등급 출력
		
		if(user_amount == null) { // 유저 포인트가 없을 시 총포인트 '0'으로 초기화
			
			user_amount = 0;
		}
		
		log.info("user_amount =" +user_amount);
	    
		if(user_amount >= 200000 && user_rank == 0) { // 총포인트 20만 이상 and 현재 등급 0(일반)이면 VIP로 업데이트
			
			service.upgrade_VIP(userID);
			
		} else if(user_amount >= 500000 && user_rank == 1) { // 총포인트 50만 이상 and 현재 등급 1(VIP)이면 VVIP로 업데이트
			
			service.upgrade_VVIP(userID);
		
		}
		
		 login = bookMainService.login(login);
		 session.setAttribute("login", login); //포인트 db 업데이트 된 것을 session에 업데이트 해주기 위함 
	
	}
	
	// 배송비 추가
	@RequestMapping(value ="/LastPayment", method = RequestMethod.GET)
	@ResponseBody
	public void lastPayment(@RequestParam("shipPrice") int shipPrice, @RequestParam("user_point") int user_point, HttpSession session) throws Exception {
	
		Bs_UserVO login = (Bs_UserVO) session.getAttribute("login");
	    String userID = login.getUser_id();
	    log.info(" 값 : " + shipPrice + user_point);
		
		service.shipPrice(userID, shipPrice); // 결제 페이지에서 배송비를 전달받아 없데이트
		/* service.payInfoShipPC(userID, shipPrice, user_point); */
		
	}
}

