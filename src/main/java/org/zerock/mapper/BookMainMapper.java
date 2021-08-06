package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zerock.domain.Bs_BookVO;
import org.zerock.domain.Bs_CartVO;
import org.zerock.domain.Bs_CodeVO;
import org.zerock.domain.Bs_ReviewVO;
import org.zerock.domain.Bs_UserVO;
import org.zerock.domain.PaginationPD;
import org.zerock.domain.SearchPD;



// 2가지 방법
// 방법 1 : 자바 인터페이스에서 SQL을 작성하는 방법
// 방법 2 : 자바 인터페이스 + XML mapper(SQL)을 사용하는 방법

// insert만 처리되고 생성된 PK 값을 알 필요가 없는 경우 : ①
// insert문이 실행되고, 생성된 PK 값을 알아야 하는 경우 : ②
public interface BookMainMapper {
//	@Select("select * from tbl_board where bno > 0 order by bno desc")


	public List<Bs_BookVO> dateselect();
	//출간일 순서대로 10개의 책을 가져옴
	
	public List<Bs_BookVO> cateselect(int code);
	
	public Bs_UserVO login(Bs_UserVO vo);
	//유저아이디에 관련된 유저정보를 가져옴.
	
	public int idCheck(String vo);
	//유저아이디가 존재하는지 체크.
	
	public void register(Bs_UserVO vo);
	//회원가입하는 정보를 데이터베이스에 저장.
	
	public void addcart(Bs_CartVO vo);
	//책에대한 정보와 유저아이디를 데이터베이스에 저장.
	
	public int count() throws Exception;
	
	public Bs_BookVO detail(int bk_num);
	//책번호를 넘겨서 책에대한 정보를 가져옴.
	
	public void comment(Bs_ReviewVO vo);
	//댓글을 데이터베이스에 저장.
	
	public List<Bs_ReviewVO> selectcomment(int vo);
	//책번호를 넘겨서 책에대한 댓글을 댓글이 작성된 순서대로 가져옴
	
	public int ordCheck(Bs_ReviewVO vo);
	//유저아이디와 책번호를 넘겨서 로그인된 유저가 책을 구매했는지 확인.
	
	public double selectsum(int bk_num);
	//책번호를 넘겨서 책에대한 평점을 더함(책에대한 평점이 없으면 0)
	
	public int rankcount(int bk_num);
	//책번호를 넘겨서 책에대한 평점을 카운트함
	
	public void commentdelete(Bs_ReviewVO vo);
	//댓글번호를 넘겨서 댓글 삭제
	
	public void commentupdate(Bs_ReviewVO vo);
	//댓글번호를 넘겨서 댓글 업데이트
	
	public int getBookListCnt(SearchPD search) throws Exception;
	//카테고리를 넘겨서 카테고리 전체 수를 가져옴.
	
	public List<Bs_BookVO> getBookList(SearchPD code) throws Exception;
	//카테고리를 넘겨서 10권씩 가져옴.
	
	public List<Bs_BookVO> searchlist(SearchPD search) throws Exception;
	//검색된 타입과 키워드를 넘겨서 10권씩 가져옴.
	
	public int searchlistcnt(SearchPD search) throws Exception;
	//검색된 타입과 키워드를 넘겨서 검색된 책의 총 개수를 가져옴.
	
	public void revupdate(@Param("rank")double rank , @Param("bk_num")int bk_num)throws Exception;
	//책테이블에 책평균평점을 업데이트해줌.
	
	public void userupdate(Bs_UserVO vo);
	//가져온 파라미터로 유저정보로 업데이트.
	
	public void userpointupdate(Bs_UserVO vo);
	//유저아이디와 유저포인트를 가져와서 유저정보를 업데이트.
	
	public List<Bs_BookVO> rankselect();
	//평점 순서대로 10권을 가져옴.
	
	public int revranklistcnt() throws Exception;
	//판매순서대로 카운트값을 가져옴.
	
	public List<Bs_BookVO> revranklist(SearchPD best) throws Exception;
	//판매순서대로 10권씩 가져옴.
	
	public int newbooklistcnt() throws Exception;
	//출간일 순서대로 카운트값을 가져옴.
	
	public List<Bs_BookVO> newbooklist(SearchPD best) throws Exception;
	//출간일 순서대로 10권씩 가져옴.
	
	public int decommentcnt(SearchPD bk_num) throws Exception;
	//책번호를 넘겨서 책에 관련된 댓글의 전체카운트를 가져옴.
	
	public List<Bs_ReviewVO> decomment(SearchPD bk_num) throws Exception;
	//책번호를 넘겨서 책에 관련된 댓글을 10개씩 가져옴.
	
	public List<Bs_BookVO> bestselect();
	//판매순서대로 10권을 가져옴.
	
	public int check(String userId) throws Exception;
	public void regiUser(@Param("userId") String userId, @Param("userNickName") String userNickName) throws	Exception;
	public Bs_UserVO infoUser(String userId) throws Exception;
	
	public Bs_UserVO selectPoint(String vo);
	
	public Bs_UserVO mailCheck (Bs_UserVO vo);		//유저 아이디 찾기를 위한 추가 
	public int mailCheckCnt (Bs_UserVO vo);			//유저 아이디 찾기를 위한 추가 
	public Bs_UserVO pasmailCheck (Bs_UserVO vo);		//유저 비밀번호 찾기를 위한 추가 
	public int pasmailCheckCnt (Bs_UserVO vo);			//유저 비밀번호 찾기를 위한 추가 
	
}

