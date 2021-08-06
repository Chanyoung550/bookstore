package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.KakaoPayVO;


public interface KakaoPayService {
	public void pointupdate(KakaoPayVO vo);
	//가져온 유저아이디와 충전된 전체포인트를 업데이트
	
	public void insert(KakaoPayVO vo);
	//유저아이디와 충전된포인트와 충전 후 포인트를 데이터베이스에 저장.
}
