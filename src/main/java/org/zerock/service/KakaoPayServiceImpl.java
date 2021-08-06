package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.KakaoPayVO;
import org.zerock.mapper.KakaoPayMapper;


@Service
public class KakaoPayServiceImpl implements KakaoPayService{

	@Autowired
	private KakaoPayMapper paymapper;
	
	//가져온 유저아이디와 충전된 전체포인트를 업데이트
	@Override
	public void pointupdate(KakaoPayVO vo) {
		paymapper.pointupdate(vo);
		
	}

	//유저아이디와 충전된포인트와 충전 후 포인트를 데이터베이스에 저장.
	@Override
	public void insert(KakaoPayVO vo) {
		paymapper.insert(vo);
		
	}

}
