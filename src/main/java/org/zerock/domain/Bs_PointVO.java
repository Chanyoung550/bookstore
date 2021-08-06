package org.zerock.domain;

import lombok.Data;

@Data
public class Bs_PointVO {
	private int point_num;		//포인트의 Index값
	private String user_id; 	//보유한 포인트 계산을 위한 userid
	private int point;			//userid에 남은 포인트를 저장
	private String point_date;
	private int point_charge;	//차감/ 충천 금액 
	private int point_payment;
	private int point_count;
}
