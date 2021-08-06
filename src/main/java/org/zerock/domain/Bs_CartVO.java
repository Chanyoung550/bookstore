package org.zerock.domain;

import lombok.Data;

@Data
public class Bs_CartVO {
	
	private int cart_num;		//장바구니의 Index 값
	private int bk_num;			//책의 Index 값
	private String user_id;		//장바구니의 유저아이디
	private int od_num;		//장바구니의 닮긴 수량
	
	private String pickurl;
	private String bk_name;
	private int bk_price;
	
}
