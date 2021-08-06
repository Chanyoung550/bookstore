package org.zerock.service;





import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.zerock.domain.Bs_AddrVO;
import org.zerock.domain.Bs_BookVO;
import org.zerock.domain.Bs_OrderList;
import org.zerock.domain.Bs_OrderVO;
import org.zerock.domain.Bs_PayInfoVo;
import org.zerock.domain.Bs_UserVO;
import org.zerock.domain.PaginationPD;
import org.zerock.domain.SearchPD;
import org.zerock.mapper.BookStoreMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BookStoreServiceIpml implements BookStoreService{
	
	private final BookStoreMapper mapper;
	
	@Override
	public void register(Bs_BookVO vo) throws Exception {
		
		mapper.register(vo);
		
	}
	
	@Override
	public List<Bs_BookVO> productList(SearchPD search) throws	Exception {
		
		return mapper.productList(search);
		
	}
	
	@Override
	public int productListCnt(SearchPD search) throws Exception {
		
		return mapper.productListCnt(search);
	}
	
	@Override
	public void stockAdd(int stockAdd, int bkNum) throws Exception {
		
		mapper.stockAdd(stockAdd, bkNum);
	}
	
	@Override
	public List<Bs_OrderVO> orderList(SearchPD search) throws Exception {
		
		return mapper.orderList(search);
	}
	
	@Override
	public int orderListCnt(SearchPD search) throws Exception {
		
		return mapper.orderListCnt(search);
	}
	
	@Override
	public void delivery(int cNum, int oNum) throws Exception {
		
		mapper.delivery(cNum, oNum);
		
	}
	
	@Override
	public void delBook(int bkNum) throws Exception {
		
		mapper.delBook(bkNum);
		
	}
	
	@Override
	public List<Bs_UserVO> memberList(SearchPD search) throws Exception {
		
		return mapper.memberList(search);
	}
	
	@Override
	public int memberListCnt(SearchPD search) throws Exception {
		
		return mapper.memberListCnt(search);
	}
	
	@Override
	public void addAddress(String userID, String name, int phone, String addr) throws Exception {
		
		mapper.addAddress(userID, name, addr, phone);
	}
	
	@Override
	public List<Bs_AddrVO> addrList(String userID) throws Exception {
		
		return mapper.addrList(userID);
		
	
	}
	
	@Override
	public Bs_OrderList payList(int bk_num) throws Exception {
		
		return mapper.payList(bk_num);
	}
	
	@Override
	public void payContent(Bs_PayInfoVo vo) throws Exception {
		
		mapper.payContent(vo);
		
	}
	
	@Override
	public void addBookSel(Bs_PayInfoVo vo) throws Exception {
		
		mapper.addBookSel(vo);
		
	}
	
	@Override
	public void minuStock(Bs_PayInfoVo vo) throws Exception {
		
		mapper.minuStock(vo);
		
	}
	
	@Override
	public void delCart(Bs_PayInfoVo vo) throws Exception {
		
		mapper.delCart(vo);
		
	}
	
	@Override
	public void minuPoint(Bs_PayInfoVo vo) throws Exception {
		
		mapper.minuPoint(vo);
		
	}
	
	@Override
	public void infoPayment(Bs_PayInfoVo vo) throws Exception {
		
		mapper.infoPayment(vo);
		
	}
	
	@Override
	public void shipPrice(String userID, int shipPrice) {
		
		mapper.shipPrice(userID, shipPrice);
		
	}

	@Override
	public void payInfoShipPC(String userID, int shipPrice, int user_point) {
		
		mapper.payInfoShipPC(userID, shipPrice, user_point);
		
	}
	
	@Override
	public Integer user_amount(String userID) {
	
		return mapper.user_amount(userID);
		
	}

	@Override
	public void upgrade_VIP(String userID) {
		
		mapper.upgrade_VIP(userID);
		
	}
	
	@Override
	public void upgrade_VVIP(String userID) {

		mapper.upgrade_VVIP(userID);
		
	}
}
