package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Bs_CartVO;

public interface CartMapper {
	public List<Bs_CartVO> read(String user_id);
	public void insert(Bs_CartVO cart);
	public void delete(String cNum);
	
}
