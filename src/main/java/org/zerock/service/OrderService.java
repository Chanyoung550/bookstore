package org.zerock.service;

import java.util.List;

import org.zerock.domain.Bs_OrderVO;
import org.zerock.domain.OrderSerchPD;



public interface OrderService {
	public List<Bs_OrderVO> read(String user_id);
	public List<Bs_OrderVO> searchlist(OrderSerchPD orderList);
	public int searchlistcnt(OrderSerchPD orderList);
		
}
