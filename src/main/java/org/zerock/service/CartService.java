package org.zerock.service;

import java.util.List;

import org.zerock.domain.Bs_CartVO;

public interface CartService {
	public List<Bs_CartVO> read(String user_id);
	public void insert(Bs_CartVO cart);
	public int delete(String cNum);
		
}
