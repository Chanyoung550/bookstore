
package org.zerock.domain;

import lombok.Data;

@Data
public class Bs_OrderVO {


	private int cart_num;      // 카트넘 추가 
	private String chkBox;
	private int od_num;				//주문 Index 값
	private int bk_num;				//책 Index 값
	private String user_id;			//주문한 유저 아이디
	private String user_addr;		//주문한 유저 주소
	private int bk_price;			//주문한 책 가격
	private String bk_pick;			//주문한 책 가격
	private String bk_name;			//주문한 유저 주소
	private String od_date;			//주문한 날짜
	private String bk_ordercnt;		//주문한 수량
	private String od_dv;			//주문한 책의 배송상태
	
	private int od_totalprice;   //db 추가 
	
	private String user_name;       // 구매자 도서리스트 사용을 위한 추가(이주영 2021 07 06)
	private int bk_salePrice;
	
}
