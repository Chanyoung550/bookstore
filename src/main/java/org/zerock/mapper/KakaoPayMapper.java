package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zerock.domain.Bs_BookVO;
import org.zerock.domain.Bs_CartVO;
import org.zerock.domain.Bs_CodeVO;
import org.zerock.domain.Bs_ReviewVO;
import org.zerock.domain.Bs_UserVO;
import org.zerock.domain.KakaoPayVO;
import org.zerock.domain.PaginationPD;
import org.zerock.domain.SearchPD;


public interface KakaoPayMapper {

	public void pointupdate(KakaoPayVO vo);
	public void insert(KakaoPayVO vo);
}

