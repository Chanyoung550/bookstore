package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class Bs_ReviewVO {
	private int rev_num;		//리휴의 Index 값
	private double rev_rank;		//책의 평점
	private String user_id;		//리뷰를 남긴 유저아이디
	private int bk_num;			//책의 Index 값
	private String rev_comment;	//댓글
	private String rev_date;	//리뷰를 남긴 날짜
}