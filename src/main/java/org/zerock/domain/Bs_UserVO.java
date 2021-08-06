package org.zerock.domain;

import lombok.Data;

@Data
public class Bs_UserVO {
	private String user_id;			//유저아이디
	private String user_pw;			//유저 패스워드
	private String user_name;		//유저 이름
	private String user_phone;		//유저 핸드폰 번호
	private String user_addr;
	private String user_regidate;   //유저 등록일
	private int user_point;         //유저 보유 포인트
			//유저 주소
	private String user_grade;		//관리자, 사용자
	
	private int user_rank;          // 유저 등급
	private String user_email;		// 유저 이메일 추가 
}
