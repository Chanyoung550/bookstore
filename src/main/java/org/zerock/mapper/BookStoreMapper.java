package org.zerock.mapper;





import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.Bs_AddrVO;
import org.zerock.domain.Bs_BookVO;
import org.zerock.domain.Bs_OrderList;
import org.zerock.domain.Bs_OrderVO;
import org.zerock.domain.Bs_PayInfoVo;
import org.zerock.domain.Bs_UserVO;
import org.zerock.domain.PaginationPD;
import org.zerock.domain.SearchPD;



// 2가지 방법
// 방법 1 : 자바 인터페이스에서 SQL을 작성하는 방법
// 방법 2 : 자바 인터페이스 + XML mapper(SQL)을 사용하는 방법

// insert만 처리되고 생성된 PK 값을 알 필요가 없는 경우 : ①
// insert문이 실행되고, 생성된 PK 값을 알아야 하는 경우 : ②
public interface BookStoreMapper {
//	@Select("select * from tbl_board where bno > 0 order by bno desc")
	
	
	
	public void register(Bs_BookVO vo) throws Exception;
	
	public List<Bs_BookVO> productList(PaginationPD pagination) throws Exception;
	
	public int productListCnt(SearchPD search) throws Exception;
	
	public void stockAdd(@Param("stockAdd") int stockAdd, @Param("bkNum") int bkNum) throws Exception;
	
	public List<Bs_OrderVO> orderList(SearchPD search) throws Exception;
	
	public int orderListCnt(SearchPD search) throws Exception;
	
	public void delivery(@Param("cNum") int cNum, @Param("oNum") int oNum) throws Exception;
	
	public void delBook(@Param("bkNum") int bkNum) throws Exception;
	
	public List<Bs_UserVO> memberList(SearchPD search) throws Exception;
	
	public int memberListCnt(SearchPD search) throws Exception;

	public void addAddress(@Param("userID") String userid, @Param("name") String name, @Param("addr") String addr, @Param("phone") int phone);
	
	public List<Bs_AddrVO> addrList(String userID) throws Exception;
	
	public Bs_OrderList payList(int bk_num) throws Exception;
	
	public void payContent(Bs_PayInfoVo vo) throws Exception;
	
	public void addBookSel(Bs_PayInfoVo vo) throws Exception;
	
	public void minuStock(Bs_PayInfoVo vo) throws Exception;
	
	public void delCart(Bs_PayInfoVo vo) throws Exception;
	
	public void minuPoint(Bs_PayInfoVo vo) throws Exception;
	
	public void infoPayment(Bs_PayInfoVo vo) throws	Exception;
	
	public void payInfoShipPC(@Param("userID") String userID ,@Param("shipPrice") int shipPrice, @Param("user_point") int user_point);
	
	public void shipPrice(@Param("userID") String userID ,@Param("shipPrice") int shipPrice);
	
	public Integer user_amount(String userID);
	
	public void upgrade_VIP(String userID);
	
	public void upgrade_VVIP(String userID);
	
	
}

