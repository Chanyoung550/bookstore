<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<link rel="stylesheet" href="resources/css/search.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="resources/js/search.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="resources/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/slick-theme.css"/>
<!-- 별점 스타일 -->
<style>
	.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

.starR1 {
   
    margin-top: -6px;
}

.starR2 {
	 margin-top: -6px;

}
</style>
</head>
<body>

<!-- 헤더 인클루드 -->	
<jsp:include page="include/header.jsp"></jsp:include>

<div id="main_contents">
	
	<div id="main_section" class="mt-3">
		<div id="main_container_">
			
			<section class="categories-section mt-5">
				
		

				<div id="main2_1" class="container">
				<!-- 테스트 -->
					<!-- 검색된 결과가 없으면 실행. -->
					<c:if test="${listCnt==0}">
						<br/>
						<br/>
							<div style="text-align:center;">
								<h1>검색된 결과가 없습니다.</h1>
							</div>
						<br/>
						<br/>
					</c:if>
					 	
					 <table>
							<c:forEach items="${bookList}" var="book" varStatus="i"><!-- 검색된 순서대로 출력 -->
								
								<tr>
									<td class="table_image" ><!-- 검색된 책의 이미지를 출력 -->
										<img src="${book.bk_thumbUrl}" style="width: 130px;height: 195px;">
									</td>
									
									<td id="table_info">
										<div class="title">
											<a href="detail?num=${book.bk_num}"><!-- 검색된 책의번호를 가지고 상세페이지로 이동.-->
												<strong class="mr-1">[<span class="main2_1_box_con_cate" id="cate${i.getIndex() }"></span>]</strong><!-- 카테고리 출력 -->
												<input type="hidden" id="catenum${i.getIndex() }" value="${book.bk_category }">
												<strong> ${book.bk_name} </strong><!-- 책이름 출력 -->
											</a>
										</div>
										<script>
											//카테고리 번호를 받아서 함수를 돌려 result값을 추출하여 text에 넣어줌.
											$(document).ready(function(){ 
												var cateCodeNum = $('#catenum${i.getIndex() }').val();
												var cateNum = parseInt(cateCodeNum);
												var category = cateSwitch(cateNum);
												$('#cate${i.getIndex() }').text(category);
											});
										</script>
										<div class="author">
											<a>${book.bk_writer}</a> 지음 <!-- 글쓴이 출력 -->
											<span class="line">|</span>
											<a> ${book.bk_pblsher}</a>	<!-- 출판사 출력 -->
											<span class="line">|</span>
											${bk_pdate}<!-- 출간일 출력 -->
										
										</div>
										<div class="likeStar">
											<!-- 리뷰가 없으면 출력 -->
											<c:if test="${book.bk_rank == 0}">
												<span> 평점 없음</span>
											</c:if>
											<!-- 리뷰가 있으면 출력 -->
											<c:if test="${book.bk_rank != 0}">
												<!-- 별점. -->
												<strong style="font-size:22px;"> 평점 : </strong>
												<div class="starRev d-inline-block" id="starRev${i.getIndex() }" >
													<span class="starR1" id="star0" value="0.5">별1_왼쪽</span>
													<span class="starR2" id="star1" value="1">별1_오른쪽</span>
													<span class="starR1" id="star2" value="1.5">별2_왼쪽</span>
													<span class="starR2" id="star3" value="2">별2_오른쪽</span>
													<span class="starR1" id="star4" value="2.5">별3_왼쪽</span>
													<span class="starR2" id="star5" value="3">별3_오른쪽</span>
													<span class="starR1" id="star6" value="3.5">별4_왼쪽</span>
													<span class="starR2" id="star7" value="4">별4_오른쪽</span>
													<span class="starR1" id="star8" value="4.5">별5_왼쪽</span>
													<span class="starR2" id="star9" value="5">별5_오른쪽</span>
													
													<input type="hidden" id="star_rank" value="${book.bk_rank}">
													<!-- 별점 출력 -->
													<span style="font-size: 22px;  margin-top: -11px; display: inline-block;">&nbsp;(${book.bk_rank})</span>
												</div>
											</c:if>
										</div>
									</td>
									<td id="table_price">
										<div class="org_price">
											<strong style="color:red; font-size:20px;">
											 	<fmt:formatNumber value="${book.bk_price}" pattern="#,###"/> 원<!-- 책가격 출력 -->
											 </strong>
										</div>
									</td>
									<td id="table_info3">
										<form id="buy_form${i}" method="post">
											<div class="check">
												<span class="btn_count">
													<label><strong>수량</strong>  <!-- 선택한 수량 출력 -->
														<input type="text" value="0" maxlength="3" id="cartStock${i.getIndex()}" class="input_style02" name="cartStock" readonly="readonly">
													</label>
													<a class="btn_plus" id="btn_plus${i.getIndex()}">수량 더하기</a><!-- 수량 더하기 -->
													<a class="btn_minus" id="btn_minus${i.getIndex()}">수량 빼기</a><!-- 수량 빼기 -->
												</span>
											</div>
											<div class="button"><!-- 장바구니에 넣어줄 정보. -->
												<input type = "hidden" name = "user_id" id = "user_id${i.getIndex()}" value = "${login.user_id }">
												<input type = "hidden" name = "bnum" id = "bnum${i.getIndex()}" value = "${book.bk_num}">
												<input type = "hidden" name = "cartStock" id="odcount${i.getIndex()}"value="cartStock${i.getIndex()}">
												<input type = "button" id = "cart_btn${i.getIndex()}" class="btn btn-block btn-dark" value = "장바구니"><!-- 장바구니에 넣는 버튼 -->
											</div>
										</form>
									</td>
								</tr>
								<script>
									$(function(){
										//장바구니 버튼을 클릭한면 실행.
										$("#cart_btn${i.getIndex()}").click(function(e){
										const odcount=$('#odcount${i.getIndex()}').val();//선택한 수량을 변수에 넣어줌
										const bknum=$('#bnum${i.getIndex()}').val();//책번호를 변수에 넣어줌
										const userid=$('#user_id${i.getIndex()}').val();//유저아이디를 변수에 넣어줌
										console.log("odcount : "+odcount);
										console.log("bknum : "+bknum);
										console.log("userid : "+userid);
											if(userid!=null&&userid!=""&&userid!=0){//로그인이 되어있는 경우 실행	
												if(odcount > 0){//선택한 수량이 0보다 클경우 실행.
												console.log("carInfo");
												$.ajax({
													type:"POST",//post방식
													url:"/addcart",
													data: {
														od_num : odcount,//선택한 수량
														bk_num : bknum,//책번호
														user_id : userid//유저아이디
													},
													dataType:"text",
													success:function(result){//ajax가 성공하면 실행
														const resultSet = $.trim(result);//띄어쓰기 없애기
														if(result==="success"){//reuslt값이 success면 실행
															var msg='장바구니에 담겼습니다.'
															alert(msg);//alert창 실행 .
															location.reload();//reload
														}
														else if(result==="fail"){//reuslt값이 fail이면 실행.
															var msg='실패했습니다.'
																alert(msg);//alert 실행.
														}
														
													}
												});
											}
											else{//수량이 0이하인경우
												alert('수량을 선택해주세요');
											}
											}
											else{//로그인이 안되어있는경우
												alert('로그인 해주세요')
											}
										});
									});
									</script>
									<script>
										$(document).ready(function(){
											//수량 추가
											$("#btn_plus${i.getIndex()}").click(function(e){
												var value = parseInt($('#cartStock${i.getIndex()}').val());
												value = value + 1;
												$('#cartStock${i.getIndex()}').val(value);
												$('#odcount${i.getIndex()}').val(value);
											});
											//수량 감소
											$("#btn_minus${i.getIndex()}").click(function(e){
												var value = parseInt($('#cartStock${i.getIndex()}').val());
												if(value <= 0){
													return;
												}
												value = value - 1;
												$('#cartStock${i.getIndex()}').val(value);
												$('#odcount${i.getIndex()}').val(value);
											});
										});
										</script>
										
							</c:forEach>
					</table> <!-- 페이징 -->
						<div id="paginationBox" class="mt-3 mb-5">
							<ul class="pagination justify-content-center" style="list-style:none; text-align:center;">
								<c:if test="${pagination.prev}"><!-- 이전페이지가 있을경우 출력 -->
									<li class="page-item"><a class="page-link" href="#" 
										onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')">Previous</a></li>
								</c:if>
								<!-- 현재페이지의 10개의 페이징 출력 -->
								<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
									<li style="display: inline-block;" class="page-item 
										<c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
										<a class="page-link" href="#" 
										onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')"> ${idx} </a>
									</li>
								</c:forEach>
								<c:if test="${pagination.next}"><!-- 출력되어있는 페이징이후의 페이지가 있을경우 출력 -->
									<li class="page-item"><a class="page-link" href="#" 
										onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType}', '${pagination.keyword}')" >Next</a></li>
								</c:if>
							</ul>
						</div>	
				</div>
			</section>
			
			
			
		</div>
	</div>
	
	<jsp:include page="include/footerBox.jsp"></jsp:include>
	
</div>
<script>
	//이전페이징 실행 함수
	function fn_prev(page, range, rangeSize, searchType, keyword) {
		var cateCode = ${code};//카테고리번호
		var newbook = ${newbook};//신간도서 검색 번호
		var best = ${best};//베스트셀로 검색 번호
		console.log('cateCode');
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "/search";
		url = url + "?cateCode=" + cateCode;//카테고리번호 url추가
 		url = url + "&newbook=" + newbook;//신간도서 검색 번호 url추가
		url = url + "&best=" + best;//베스트셀로 검색 번호 url추가
		url = url + "&page=" + page;//현재페이지 번호 url추가
		url = url + "&range=" + range;//마지막페이지번호 url추가
		url = url + "&searchType=" + searchType;//검색 타입 url추가
		url = url + "&keyword=" + keyword;//검색 키워드 url추가
		
		location.href = url;//위에 추가되 url로 이동.
	}
	//현재페이징 출력 함수
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var cateCode = ${code};//카테고리번호
		var newbook = ${newbook};//신간도서 검색 번호
		var best = ${best};//베스트셀로 검색 번호
		console.log('cateCode');
		console.log('newbook');
		console.log('best');
		var url = "/search";
		url = url + "?cateCode=" + cateCode;//카테고리번호 url추가
 		url = url + "&newbook=" + newbook;//신간도서 검색 번호 url추가
		url = url + "&best=" + best; //베스트셀로 검색 번호 url추가
		url = url + "&page=" + page;//현재페이지 번호 url추가
		url = url + "&range=" + range;//마지막페이지번호 url추가
		url = url + "&searchType=" + searchType;//검색 타입 url추가
		url = url + "&keyword=" + keyword;//검색 키워드 url추가
		
		location.href = url;//위에 추가되 url로 이동.
	}
	//다음페이징 출력함수.
	function fn_next(page, range, rangeSize, searchType, keyword) {
		var cateCode = ${code};//카테고리번호
		var newbook=${newbook};//신간도서 검색 번호
		var best=${best}; //베스트셀로 검색 번호
		console.log('cateCode');
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "/search";
		url = url + "?cateCode=" + cateCode;//카테고리번호 url추가
  		url = url + "&newbook=" + newbook;//신간도서 검색 번호 url추가
		url = url + "&best=" + best;//베스트셀로 검색 번호 url추가
		url = url + "&page=" + page;//현재페이지 번호 url추가
		url = url + "&range=" + range;//마지막페이지번호 url추가
		url = url + "&searchType=" + searchType;//검색 타입 url추가
		url = url + "&keyword=" + keyword;//검색 키워드 url추가
		
		location.href = url;//위에 추가되 url로 이동.
	}
	//검색 버튼이 눌려을 경우 실행
	$(document).on('click', '#btn_Search', function(e){
		e.preventDefault();
		var url = "/search";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;//위에 추가되 url로 이동.
	});
</script>

<script>
	//받아온 value값의 별점을 출력
	$(document).ready(function(){
		for(var i =0; i <10; i++){
			var idx = $("#starRev"+i).find("input").val() ; 
			idx = ( idx - 0.5 )*2
			idx = Math.floor(idx);
			$('#starRev'+i).find('#star'+idx).addClass(' on').prevAll('span').addClass(' on');	
		}
	});
</script>

</body>
</html>