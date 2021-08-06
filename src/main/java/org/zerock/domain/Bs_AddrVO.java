package org.zerock.domain;

import lombok.Data;

@Data
public class Bs_AddrVO {
	private int addr_num;		//주소 Index값
	private String user_id;		//등록한 주소의 아이디
	private String rec_addr;	//결제창에서 등록한 주소
	private String rec_name;
	private String rec_phone;
	private String receiver_name;
	private int user_phone;
	
	
	
}
