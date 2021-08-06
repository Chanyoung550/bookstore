package org.zerock.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.zerock.domain.Bs_BookVO;
import org.zerock.domain.Bs_CartVO;
import org.zerock.domain.Bs_CodeVO;
import org.zerock.domain.Bs_ReviewVO;
import org.zerock.domain.Bs_UserVO;
import org.zerock.domain.PaginationPD;
import org.zerock.domain.SearchPD;
import org.zerock.mapper.BookMainMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookMainServiceIpml implements BookMainService{
	
	private final BookMainMapper mapper;

	//출간일 순서대로 10개의 책을 가져옴
	@Override
	public List<Bs_BookVO> dateselect() {
		return mapper.dateselect();
	}

	@Override
	public List<Bs_BookVO> cateselect(int code) {
		return mapper.cateselect(code);
	}
	
	//유저아이디에 관련된 유저정보를 가져옴.
	@Override
	public Bs_UserVO login(Bs_UserVO vo) {
		return mapper.login(vo);
	}

	//유저아이디가 존재하는지 체크.
	@Override
	public int idCheck(String vo) {
		return mapper.idCheck(vo);
	}

	//회원가입하는 정보를 데이터베이스에 저장.
	@Override
	public void register(Bs_UserVO vo) {
		mapper.register(vo);
		
	}

	//책에대한 정보와 유저아이디를 데이터베이스에 저장
	@Override
	public void addcart(Bs_CartVO vo) {
		mapper.addcart(vo);
		
	}

	
	@Override
	public int count() throws Exception {
		return mapper.count();
	}

	//책번호를 넘겨서 책에대한 정보를 가져옴.
	@Override
	public Bs_BookVO detail(int bk_num) {
		return mapper.detail(bk_num);
	}

	//댓글을 데이터베이스에 저장.
	@Override
	public void comment(Bs_ReviewVO vo) {
		mapper.comment(vo);
		
	}

	//책번호를 넘겨서 책에대한 댓글을 댓글이 작성된 순서대로 가져옴
	@Override
	public List<Bs_ReviewVO> selectcomment(int vo) {
		return mapper.selectcomment(vo);
	}

	//유저아이디와 책번호를 넘겨서 로그인된 유저가 책을 구매했는지 확인
	@Override
	public int ordCheck(Bs_ReviewVO vo) {
		return mapper.ordCheck(vo);
	}

	//책번호를 넘겨서 책에대한 평점을 더함(책에대한 평점이 없으면 0)
	@Override
	public double selectsum(int bk_num) {
		return mapper.selectsum(bk_num);
	}

	//책번호를 넘겨서 책에대한 평점을 카운트함
	@Override
	public int rankcount(int bk_num) {
		return mapper.rankcount(bk_num);
	}

	//댓글번호를 넘겨서 댓글 삭제
	@Override
	public void commentdelete(Bs_ReviewVO vo) {
		mapper.commentdelete(vo);
		
	}

	//댓글번호를 넘겨서 댓글 업데이트
	@Override
	public void commentupdate(Bs_ReviewVO vo) {
		mapper.commentupdate(vo);
		
	}

	//카테고리를 넘겨서 카테고리 전체 수를 가져옴.
	@Override
	public int getBookListCnt(SearchPD code) throws Exception {
		return mapper.getBookListCnt(code);
	}

	//카테고리를 넘겨서 10권씩 가져옴.
	@Override
	public List<Bs_BookVO> getBookList(SearchPD code) throws Exception {
		return mapper.getBookList(code);
	}

	//검색된 타입과 키워드를 넘겨서 10권씩 가져옴.
	@Override
	public List<Bs_BookVO> searchlist(SearchPD search) throws Exception {
		return mapper.searchlist(search);
	}

	//검색된 타입과 키워드를 넘겨서 검색된 책의 총 개수를 가져옴.
	@Override
	public int searchlistcnt(SearchPD search) throws Exception {
		return mapper.searchlistcnt(search);
	}
	
	//가져온 파라미터로 유저정보로 업데이트.
	@Override
	public void userupdate(Bs_UserVO vo) {
		mapper.userupdate(vo);
		
	}

	@Override
	public void userpointupdate(Bs_UserVO vo) {
		mapper.userpointupdate(vo);
		
	}
	
	//책테이블에 책평균평점을 업데이트해줌.
	@Override
	public void revupdate(@Param("rank")double rank, @Param("bk_num")int bk_num) throws Exception {
		mapper.revupdate(rank, bk_num);
		
	}

	//평점 순서대로 10권을 가져옴.
	@Override
	public List<Bs_BookVO> rankselect() {
		return mapper.rankselect();
	}

	//판매순서대로 카운트값을 가져옴.
	@Override
	public int revranklistcnt() throws Exception {
		return mapper.revranklistcnt();
	}

	//판매순서대로 10권씩 가져옴.
	@Override
	public List<Bs_BookVO> revranklist(SearchPD best) throws Exception {
		return mapper.revranklist(best);
	}

	//출간일 순서대로 카운트값을 가져옴.
	@Override
	public int newbooklistcnt() throws Exception {
		return mapper.newbooklistcnt();
	}

	//출간일 순서대로 10권씩 가져옴.
	@Override
	public List<Bs_BookVO> newbooklist(SearchPD best) throws Exception {
		return mapper.newbooklist(best);
	}

	//책번호를 넘겨서 책에 관련된 댓글의 전체카운트를 가져옴.
	@Override
	public int decommentcnt(SearchPD bk_num) throws Exception {
		return mapper.decommentcnt(bk_num);
	}

	//책번호를 넘겨서 책에 관련된 댓글을 10개씩 가져옴.
	@Override
	public List<Bs_ReviewVO> decomment(SearchPD bk_num) throws Exception {
		return mapper.decomment(bk_num);
	}

	//판매순서대로 10권을 가져옴.
	@Override
	public List<Bs_BookVO> bestselect() {
		return mapper.bestselect();
	}
	
	@Override
	public int check(String userId) throws Exception {
			
		return mapper.idCheck(userId);
	}
	
	@Override
	public void regiUser(String userId, String userNickName) throws Exception {
		
		mapper.regiUser(userId, userNickName);
		
	}
	
	@Override
	public Bs_UserVO infoUser(String userId) throws Exception {
		
		return mapper.infoUser(userId);
	}

	@Override
	public Bs_UserVO selectPoint(String vo) {
		return mapper.selectPoint(vo);
	}

	
		
	
	@Override
	public Bs_UserVO mailCheck(Bs_UserVO vo) {		//유저 아이디 찾기를 위한 추가 
	
		return mapper.mailCheck(vo);
	}

	@Override
	public int mailCheckCnt(Bs_UserVO vo) {			//유저 아이디 찾기를 위한 추가 

		return mapper.mailCheckCnt(vo);
	}

	@Override
	public Bs_UserVO pasmailCheck(Bs_UserVO vo) {	// 유저 비밀번호 찾기를 위한 추가
	
		return mapper.pasmailCheck(vo);
	}

	@Override
	public int pasmailCheckCnt(Bs_UserVO vo) {		// 유저 비밀번호 찾기를 위한 추가
		
		return mapper.pasmailCheckCnt(vo);
	}





}
