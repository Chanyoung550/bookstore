package org.zerock.domain;

import lombok.Data;

@Data
public class Bs_PicurlVO {
	private String bk_uuid;		//책 사진 업로드 고유 아이디
	private int bk_num;			//책 사진 업로드 인덱스
	private String bk_picurl;	//책 사진 업로드 url
	private String bk_size;		//책 사진 업로드 파일 크기
	private String bk_picname;	//책 사진  업로드 원래 책 이름.
}
