package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Bs_OrderVO;
import org.zerock.domain.OrderSerchPD;


public interface OrderMapper {
	public List<Bs_OrderVO> read(String user_id);
	public List<Bs_OrderVO> searchlist(OrderSerchPD orderPD);
	public int searchlistcnt(OrderSerchPD orderPD);

}
