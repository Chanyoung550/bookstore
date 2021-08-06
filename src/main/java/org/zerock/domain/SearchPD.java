package org.zerock.domain;

import lombok.Data;

@Data
public class SearchPD extends PaginationPD{

	private String searchType;
	private String keyword;
	private int code;
	private int newbook;
	private int best;
	private int bk_num;
	
}
