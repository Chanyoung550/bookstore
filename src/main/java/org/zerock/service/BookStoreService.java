package org.zerock.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Bs_AddrVO;
import org.zerock.domain.Bs_BookVO;
import org.zerock.domain.Bs_OrderList;
import org.zerock.domain.Bs_OrderVO;
import org.zerock.domain.Bs_PayInfoVo;
import org.zerock.domain.Bs_UserVO;
import org.zerock.domain.SearchPD;


public interface BookStoreService {
	
	// 도서 등록 기능
	public void register(Bs_BookVO vo) throws Exception;
	
	// 도서 리스트 출력
	public List<Bs_BookVO> productList(SearchPD search) throws	Exception;
	
	// 총 게시글 갯수 확인
	public int productListCnt(SearchPD search) throws Exception;
	
	// 재고 수량 추가
	public void stockAdd(int stockAdd, int bkNum) throws Exception;
	
	// 주문 리스트
	public List<Bs_OrderVO> orderList(SearchPD search) throws Exception;
	
	// 총 게시글 갯수 확인
	public int orderListCnt(SearchPD search) throws Exception;
	
	// 배송상태확인
	public void delivery(int cNum, int oNum) throws Exception;
	
	// 도서 리스트 도서삭제
	
	public void delBook(int bkNum) throws Exception;
	
	// 유저 리스트
	public List<Bs_UserVO> memberList(SearchPD search) throws Exception;
	
	// 유저 리스트 개수 확인 
	public int memberListCnt(SearchPD search) throws Exception;
	
	// 직접입력 배송지

	public void addAddress(String userID, String name, int phone, String addr) throws Exception;
	
	// 배송지 출력
	
	public List<Bs_AddrVO> addrList(String userID) throws Exception;
	
	// 결제 상품 리스트
	
	public Bs_OrderList payList(int bk_num) throws Exception;
	
	// 결제 내용 저장
	
	public void payContent(Bs_PayInfoVo vo) throws Exception;
	
	// 책 판매량 추가
	
	public void addBookSel(Bs_PayInfoVo vo) throws Exception;
	
	// 판매 재고 마이너스
	
	public void minuStock(Bs_PayInfoVo vo) throws Exception;
	
	// 결제 완료 카트 삭제
	
	public void delCart(Bs_PayInfoVo vo) throws	Exception;
	
	// 결제 완료 포인트 차감
	
    public void minuPoint(Bs_PayInfoVo vo) throws Exception;
    
    // 결제 내역 포인트 정보
    
    public void infoPayment(Bs_PayInfoVo vo) throws	Exception;
    
    // 배송비 결제
    
    public void shipPrice(String userID, int shipPrice);
    
    // 결제 내역 배송비 추가
    
    public void payInfoShipPC(String userID, int shipPrice, int user_point);
    
    // 유저 결제 누적금액
    
    public Integer user_amount(String userID);
    
    // 유저 등급업(VIP)
    
	public void upgrade_VIP(String userID);
    
	// 유저 등급업(VVIP)
    
	public void upgrade_VVIP(String userID);
}
