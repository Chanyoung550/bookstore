package org.zerock.domain;

import lombok.Data;

@Data
public class Bs_PayInfoVo {
	private int bkNum;		//포인트의 Index값
	private String bkName; 	//보유한 포인트 계산을 위한 userid
	private int bkPrice;			//userid에 남은 포인트를 저장
	private int bkOdcnt;
	private int cartNum;
	private int totalPrice;
	private String userId;
	private int userPoint;
	private String reci_addr;
	private String reci_name;
	private String reci_phone;
	private int saleBkPrice;
	
}
