package org.zerock.service;


import java.util.List;


import org.springframework.stereotype.Service;
import org.zerock.domain.Bs_PointVO;
import org.zerock.domain.PointSerchPD;
import org.zerock.mapper.PointMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PointServiceImpl implements PointService {
	
	private final PointMapper mapper;
	
	
	@Override
	public List<Bs_PointVO> read(String user_id) {
	
		
		return mapper.read(user_id);
	}

	@Override
	public void insert(Bs_PointVO pVo) {
		mapper.insert(pVo);
		
	}

	@Override
	public List<Bs_PointVO> dateRead(PointSerchPD pointPD) {
		
		return mapper.dateRead(pointPD);
		
	}

	@Override
	public int dateReadCnt(PointSerchPD pointPD) {
		
		return mapper.dateReadCnt(pointPD);
	}
	
}




