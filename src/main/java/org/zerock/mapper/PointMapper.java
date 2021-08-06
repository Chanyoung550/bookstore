package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Bs_PointVO;
import org.zerock.domain.PointSerchPD;

public interface PointMapper {
	public List<Bs_PointVO> read(String user_id);
	public List<Bs_PointVO> dateRead(PointSerchPD pointPD);
	public int dateReadCnt(PointSerchPD pointPD);
	public void insert(Bs_PointVO pVo);
	
}
