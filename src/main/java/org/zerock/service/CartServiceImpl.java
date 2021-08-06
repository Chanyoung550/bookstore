package org.zerock.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Bs_CartVO;
import org.zerock.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	@Override
	public List<Bs_CartVO> read(String user_id) {
		
		List<Bs_CartVO> cart_list = mapper.read(user_id);
		//log.info("cart_list"+ cart_list);
		
		return cart_list;
	}
	
	

	@Override
	public void insert(Bs_CartVO cart) {
		

	}



	@Override
	public int delete(String cNum) {
		int result;
		
		try {
			mapper.delete(cNum);
			result = 1;
			
		}catch(Exception e) {
			
			result = 0;
		}
		
		log.info("result : "+ result);
		
		
		
		return result;
		
	}

}




