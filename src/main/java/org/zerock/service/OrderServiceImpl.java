package org.zerock.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Bs_OrderVO;
import org.zerock.domain.OrderSerchPD;
import org.zerock.mapper.OrderMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;
	
	@Override
	public List<Bs_OrderVO> read(String user_id) {
		
		List<Bs_OrderVO> order_list = mapper.read(user_id);
		log.info("order_list"+ order_list);
		
		return order_list;
	}

	@Override
	public List<Bs_OrderVO> searchlist(OrderSerchPD orderList) {
		
		
		return mapper.searchlist(orderList);
	}

	@Override
	public int searchlistcnt(OrderSerchPD orderList) {
		
		return mapper.searchlistcnt(orderList);
	}


	

}




