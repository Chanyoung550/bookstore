package org.zerock.domain;

import lombok.Data;

@Data
public class Bs_BookVO {
	private int bk_num;			//책 인덱스 값
	private String bk_name;		//책 이름
	private int bk_price;		//책 가격
	private String bk_pblsher;	//책 출판사
	private String bk_intro;	//책 소개
	private String bk_writer;	//책 작가
	private int bk_category;	//책 카테고리
	private int bk_stock;		//책 보유 수량(주문 후 차감.)
	private String bk_pictureUrl;	//사진 url
	private String bk_thumbUrl;		//사진 썸네일 url
	private String bk_pdate;		//출판일
	private double bk_rank;
}
