package org.zerock.domain;

import lombok.Data;

@Data
public class Bs_CaVO {
	private String user_id;		//로그인 유지를 위한 userid를 저장
	private String bs_cookies;	//로그인 유지르 위한 cookies를 저장
	private String bs_date;		//로그인 유지를 위한 날짜를 저장
}
