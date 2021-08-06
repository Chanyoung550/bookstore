package org.zerock.domain;



import java.util.Date;

import lombok.Data;

@Data
public class PointSerchPD extends PaginationPD {
	
	private String user_id;
	private String searchType;	//페이징 추가 
	private String keyword;	//페이징 추가 
	private String startDate;	//페이징 추가 
	private String endDate;	//페이징 추가 
	
}
