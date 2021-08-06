<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bs_Store</title>
<link rel="stylesheet" href="resources/css/detail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
</head>
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
</style>
<style>
	.tab-button-outer {
		display: none;
	    font-size: 30px;
	    text-align: center;
		
	}
	@media screen and (min-width: 640px) {
		.tab-button-outer {
			display: block;
		}
		.tab-select-outer {
			display: none;
		}
	}
	table.type02 {
	  border-collapse: separate;
	  border-spacing: 0;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	  margin: 20px 60px;
	  font-size:20px;
	}
	table.type02 th {
	  width: 370px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	  border-top: 1px solid #fff;
	  border-left: 1px solid #fff;
	  background: #eee;
	}
	table.type02 td {
	  width: 700px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	}
	td, th {
	    padding-right: 100px;
	    font-size: 20px;
	}
	#tab-area {
		width:1200px;
		margin:0 auto;
	}
</style>
<!-- 댓글 스타일 -->
<style>
	.reply-list {margin-bottom:30px; list-style:none; border-bottom:1px solid #e9e9e9}
	.reply-list li {padding:20px 0; border-top:1px solid #e9e9e9}
	.reply-list li:after {display:block; clear:both; content:''}
	.reply-list li .thumb {float:left; width:10%; text-align:center}
	.reply-list li .thumb img {border-radius: 50%;}
	.reply-list li .reply-content {float:right; width:90%}
	.reply-list li .reply-content:after {display:block; clear:both; content:''}
	.reply-list li .reply-content ul {}
	.reply-list li .reply-content ul li {border:0; padding:0}
	.reply-list li .reply-content .info {float:left;}
	.reply-list li .reply-content .info li {display:inline-block}
	.reply-list li .reply-content .info li.date {font-size:0.75em; color:#bbb} 
	.reply-list li .reply-content .control {float:right}
	.reply-list li .reply-content .control li {display:inline-block; margin-right:10px}
	.reply-list li .reply-content .control li a {color:#ff8149; font:normal 0.75em 'NanumBarunGothic', 'Noto Sans', sans-serif;}
	.reply-list li .reply-content .control li a .fa {color:#ff8149;}
	.reply-list li .reply-content .control li a.reply-url, .reply-list li .reply-content .control li a.reply-url .fa {color:#999;}
	.reply-list li .reply-content .control li a.reply-modify, .reply-list li .reply-content .control li a.reply-modify .fa {color:#ed145b}
	.reply-list li .reply-content .text {clear:both; padding:10px 0 0; color:#777; font:normal 0.875em 'NanumBarunGothic', 'Noto Sans', sans-serif; line-height:1.5em}
	/* @ 비밀글 */ .reply-list li.rp_secret .reply-content .text {color:#999}
	/* @ 일반 */   .reply-list li.rp_general {}
	/* @ 관리자 */ .reply-list li.rp_admin .reply-content .nickname a {color:#ff8149}

</style>
<body>
	<div id="wrap">
		<!-- 헤더 인클루드 -->
		<jsp:include page="include/header.jsp"></jsp:include>


		<div id="detail_middle" class="categories-section mt-3">
			<div class="container">
				<div id="detail_middle_container" class="clearfix">

					<div id="cover">
						<div id="image">
							<!-- 책 이미지 출력 -->
							<img class="img_size" src="${book.bk_thumbUrl}">
						</div>
					</div>
					<div id="title">
						<strong><input type="hidden" id="catenum" value="${book.bk_category }"></strong>
						<table>
							<tbody class="detail_intro2">
								<tr><!-- 카테고리 출력 -->
									<th scope="row">카테고리</th>
									<td id="cate"></td>
								</tr>
								<tr><!-- 책제목 출력 -->
									<th scope="row">책제목</th>
									<td>${book.bk_name}</td>
								</tr>
								<tr><!-- 작가출력 -->
									<th scope="row">작가</th>
									<td>${book.bk_writer}</td>
								</tr>
								<tr><!-- 출판사 출력 -->
									<th scope="row">출판사</th>
									<td>${book.bk_pblsher}</td>
								</tr>
								<tr><!-- 출간일 출력 -->
									<th scope="row">출간일</th>
									<td>${book.bk_pdate}</td>
								</tr>
								<tr><!-- 판매가격 출력 -->
									<th scope="row">판매가</th>
									<td style="color: red; font-size: 20px;"><fmt:formatNumber
											value="${book.bk_price}" pattern="#,###" /> 원</td><!-- 가격임을 나타태기위해 0,000 붙여줌 -->
								</tr>
							</tbody>
						</table>
					</div>
					<div id="purchase">
						<br> <span style="font-size: 25px; margin-left: 40px;">${book.bk_name}</span><!-- 책이름 출력 -->
						<span id="purchase_money1" style="margin-right: 20px"> 
							<fmt:formatNumber value="${book.bk_price}" pattern="#,###" /> 원<!-- 가격임을 나타태기위해 0,000 붙여줌 -->
						</span>
						<div class="btn_count"><!-- 수량 입력 -->
							<label><strong>수량</strong> <input type="text" value="0" maxlength="3" id="cartStock" class="input_style02" name="cartStock" readonly="readonly"> </label> <!-- 입력된 수량 출력 -->
								<a class="btn_plus" id="btn_plus">수량 더하기</a> <!-- 수량더하기 -->
								<a class="btn_minus" id="btn_minus">수량 빼기</a><!-- 수량 빼기 -->
						</div>
						<br>
						<div id="purchase_btn">
							<br /> <br /> <br />
							<form method="post" action="/pay/payment" id="payfrm"><!-- 바로구매 버튼을 눌렀을때 전송되는 데이터 -->
								<input type="hidden" name="Orderlist[0].chkBox" value="on">
								<input type="hidden" name="Orderlist[0].bk_price" id="bk_price" value="${book.bk_price }"> 
								<input type="hidden" name="Orderlist[0].bk_num" id="bnum" value="${book.bk_num}">
								<input type="hidden" name="Orderlist[0].bk_ordercnt" id="odcount" value="cartStock"> <input type="hidden" name="Orderlist[0].bk_totalprice" id="bk_totalprice" value="">
								<span id="purchase_money3">합계금액&nbsp; <span
									style="color: red;" id="allprice"> 0</span>원
								</span>
								<div style="float: right;" class="detail_btn">
									<input class="btn btn-success" type="button" id="cart_btn"value="장바구니"> <!-- 장바구니 버튼 -->
									<input class="btn btn-success"type="button" id="buy_btn" value="바로구매"><!-- 바로구매 버튼 -->
								</div>
							</form>
						</div>
					</div>
				</div>
				<script>
					$(document).ready(function() {//cateSwitch 에서 받아온 result값을 #cate에 넣어줌.
						var cateCodeNum = $('#catenum').val();
						var cateNum = parseInt(cateCodeNum);
						var category = cateSwitch(cateNum);
						$('#cate').text(category);
					});
					$(document).ready(function() {//cateSwitch 에서 받아온 result값을 #cate2에 넣어줌.
						var cateCodeNum = $('#catenum').val();
						var cateNum = parseInt(cateCodeNum);
						var category = cateSwitch(cateNum);
						$('#cate2').text(category);
					});
				</script>
				<div class="tabs mt-3 mb-5" id="tab-area">
						<div id="tab01" class="tab-pane active">
							<div id="detail_main">
								<div id="detail_main_container">
									<div id="book_intro_wrapper">
										<div id="book_intro_subject">
											<span>책소개</span>
										</div>
										<table class="type02">
											<tbody class="detail_intro">
												<tr><!-- 카테고리 출력 -->
													<th scope="row">카테고리</th>
													<td id="cate2"></td>
												</tr>
												<tr><!-- 책제목 출력 -->
													<th scope="row">책제목</th>
													<td>${book.bk_name}</td>
												</tr>
												<tr><!-- 작가출력 -->
													<th scope="row">작가</th>
													<td>${book.bk_writer}</td>
												</tr>
												<tr><!-- 출한사 출력 -->
													<th scope="row">출판사</th>
													<td>${book.bk_pblsher}</td>
												</tr>
												<tr><!-- 출간일 출력 -->
													<th scope="row">출간일</th>
													<td>${book.bk_pdate}</td>
												</tr>
											</tbody>
										</table>
										<div id="book_intro_con">
											<h2><!-- 인드로 출력 -->
												<strong>INTRO</strong>
											</h2>

										</div><!-- 책 소개 출력 -->
										<div id="book_intro_con2">${book.bk_intro}</div>
									</div>


								</div>
							</div>
						</div>


						<div id="tab02" class="tab-pane">
							<div id="detail_reply">
								<div id="detail_reply_container">
									<div id="detail_reply_container_subject">
										<span>평점/리뷰</span>
									</div>
									<br />
									<!-- 평점이 없을경우 출력 -->
									<c:if test="${rank==0 }">
										<div style="text-align: center;">
											<h2>
												<strong>등록된 평점이 없습니다.</strong>
											</h2>
										</div>
									</c:if>
									<!-- 평점이 있을경우 실행 -->
									<c:if test="${rank !=0 }">
										<div style="text-align: center;">
											<h2 style="display: inline-block; margin: 20px;">
												<strong>책 평점</strong>
											</h2><!-- 별점 -->
											<div class="starRev" id="revStar"
												style="display: inline-block;">
												<span class="starR1" id="star0" value="0.5">별1_왼쪽</span> <span
													class="starR2" id="star1" value="1">별1_오른쪽</span> <span
													class="starR1" id="star2" value="1.5">별2_왼쪽</span> <span
													class="starR2" id="star3" value="2">별2_오른쪽</span> <span
													class="starR1" id="star4" value="2.5">별3_왼쪽</span> <span
													class="starR2" id="star5" value="3">별3_오른쪽</span> <span
													class="starR1" id="star6" value="3.5">별4_왼쪽</span> <span
													class="starR2" id="star7" value="4">별4_오른쪽</span> <span
													class="starR1" id="star8" value="4.5">별5_왼쪽</span> <span
													class="starR2" id="star9" value="5">별5_오른쪽</span> <input
													type="hidden" id="star_rank" value="${rank}">
											</div>
											<h2 style="display: inline-block; margin: 20px;">(${rank })</h2>
										</div>
									</c:if>
									<br />
									<hr>
									<br />
									<c:forEach items="${comment }" var="com" varStatus="i"><!-- 책에 대한 댓글들을 출력 -->
										<c:if test="${com.rev_rank == 0.0}"><!-- 책에대한 리뷰가 없으면 실행 -->
											<p>등록된 리뷰가 없습니다.</p>
										</c:if>
										<c:if test="${com.rev_num!=null }"><!-- 책에대한 리뷰가 있으면 실행 -->
											<s_rp_container>
											<ul class="reply-list">
												<s_rp_rep>
												<div id="book_reply" class="comment_reply">
													<li id="[##_rp_rep_id_##]" class="[##_rp_rep_class_##]">
														<div class="reply-content" style="font-size: 20px;">
															<ul class="info">
																<li>
																<!-- 각 댓글에 대한 평점 -->
																	<div class="starRev" id="starRev${i.getIndex() }">
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
																		<span>(${com.rev_rank})</span> <input type="hidden"
																			id="star_rank" value="${com.rev_rank}">
																	</div>
																</li>
																<li class="nickname">${com.user_id }</li><!-- 댓글 작성자. -->
																<li class="date">[${ com.rev_date}]</li><!-- 댓글 작성 날짜. -->
															</ul>
															<p class="text">${com.rev_comment}</p><!-- 작성한 댓글 -->
															<input type="hidden" id="comment${i.getIndex()}" value="${com.rev_comment }"> 
															<input type="hidden" id="comrank${i.getIndex() }" value="${com.rev_rank }"> 
															<input type="hidden" id="commentnum${i.getIndex()}" value="${com.rev_num }">
															<ul class="control">
																<c:set var="louserid" value="${login.user_id}" />
																<c:set var="couserid" value="${com.user_id}" />
																<!-- 로그인된 유저아이디와 댓글작성자가 같으면 실행 -->
																<c:if test="${louserid==couserid }">
																	<button type="button" id="comment_delete${i.getIndex()}" value="${com.rev_num}" class="btn btn-success">삭제</button><!-- 댓글 삭제 버튼 -->
																	<button type="button" data-toggle="modal" data-target="#myModal" id="comment_update${i.getIndex()}" 
																	value="${com.rev_num}" class="btn btn-danger">수정</button><!-- 댓글 수정 버튼 누르면 모달로 이동. -->
																</c:if>
															</ul>
														</div>
													</li>
												</div>
												</s_rp_rep>
											</ul>
											</s_rp_container>
										</c:if>
										<script>
										//댓글삭제버튼이 클릭되면 실행.
						               	$("#comment_delete${i.getIndex()}").click(function(){
						                  const revnum=$('#comment_delete${i.getIndex()}').val();//댓글 번호를 변수에 저장.
						                  const userid="${login.user_id}";//세션에 저장되어있는 유저아이디를 변수에 저장.
						                  console.log("comment_revnum${i.getIndex()} : "+revnum);
						                  if(userid!=null&&userid!=""&&userid!=0){//로그인이 되어있으면 실행.
						                     $.ajax({
						                        type:"GET",//get방식
						                        url:"/commentDelete",
						                        data: {
						                           rev_num : revnum//댓글번호를 넘겨줌.
						                        },
						                        success:function(result){//ajax가 성공하면 실행됨
						                           console.log("result")
						                           alert('댓글이 삭제되었습니다.');//alert창 실행.
						                           location.reload();//reload
						                        }
						                     })
						                  }
						                  else{//로그인이 안되어있으면 실행.
						                     alert('로그인을 해주세요')
						                  }
						               	});
						               	$(document).ready(function() {
						                  $('#myModal').on('show.bs.modal', function(event) {//modal창이 실행되면 실행
						                     var idx = $("#rankStar").find("input").val() ; //#rank 의 input의 value값을 찾아서 변수에 저장.
						                     idx = ( idx - 0.5 )*2//변수에서 0.5를 빼고 2를 곱해서 변수에 넣는다.
						                     idx = Math.floor(idx);//나온수를 내림해서 변수에 넣는다.
						                     $('#rankStar').find('#star'+idx).addClass(' on').prevAll('a').addClass(' on');//#star+idx의 값에 class명에 on을 더하고 그보다 낮은값의 class를 on으로 바꾼다.
						                        $('#commentUpdate').click(function(e){//모달창안에 있는 업데이트 버튼이 클릭되면 실행.
						                           const revRank=$('#revRank').val();//모달안에 평점 value값을 변수에 저장.
						                           const revnum=$('#comnum').val();//모달안에 댓글번호 value값을 변수에 저장.
						                           const revcomment=$('#revcom').val();//모달안에 댓글 value값을 변수에 저장.
						                           console.log("revnum : "+revnum);
						                           console.log("revRank : "+revRank);
						                           console.log("revcomment : "+revcomment);
						                              $.ajax({
						                                 type:"POST",//post방식
						                                 url:"/commentUpdate",
						                                 data: {
						                                    rev_rank : revRank,//평점
						                                    rev_num : revnum,//댓글 번호
						                                    rev_comment : revcomment//댓글
						                                 },
						                                 dataType: "text",
						                                 success:function(result){//ajax가 성공하면 실행.
						                                    location.reload();//reload
						                                 }
						                              });
						                        });
						                     
						                  });
						               });
						            </script>
									<script>
						               $('#comment_update${i.getIndex()}').click(function(e){//업데이트 버튼 클릭시 실행
						                  const valuenum = $('#comment_update${i.getIndex()}').val();//댓글번호의value값을 변수에 저장.
						                  const valuecom = $('#comment${i.getIndex()}').val();//댓글의  value값을 변수에 저장.
						                  const valuerank = $('#comrank${i.getIndex() }').val();//평점의 value값을 변수에 저장.
						         
											$('#comnum').val(valuenum);// 댓글번호를 모달창 value값에 저장
											$('#revcom').text(valuecom);//  댓글을 모달창 text값에 저장
											$('#revRank').val(valuerank);// 별점을 모달창 value값에 저장
										});
										</script>

									</c:forEach>
									<div id="paginationBox"><!-- 페이징 -->
										<ul class="pagination justify-content-center">
											<c:if test="${pagination.prev}"><!-- 이전페이징 -->
												<li class="page-item"><a class="page-link" href="#"
													onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
												</li>
											</c:if>
											<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx"><!-- 현재 페이징 -->
												<li
													class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
													<a class="page-link" href="#"
													onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
														${idx} </a>
												</li>
											</c:forEach>
											<c:if test="${pagination.next}"><!-- 다음페이징 -->
												<li class="page-item"><a class="page-link" href="#"
													onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a>
												</li>
											</c:if>
										</ul>
									</div>

									<c:if test="${login== null}"><!-- 로그인이 되어있지 않으면 실행 -->
										<div id="replyWarning">
											<div id="replyWarning_subject">평점/리뷰 등록</div>
											<div id="replyWarning_content">로그인후 리뷰 등록 가능합니다.</div>
										</div>

									</c:if>

									<c:if test="${login != null}"><!-- 로그인이 되어 있으면 실행 -->
										<div id="replyRegist">
											<div id="replyRegist_content">
												<div id="replyRegist_content_likeStar">
													평점 :
													<div class="starRev">
													<!-- 별점 -->
														<a class="starR1 on" value="0.5">별1_왼쪽</a> 
														<a class="starR2" value="1">별1_오른쪽</a> 
														<a class="starR1" value="1.5">별2_왼쪽</a>
														<a class="starR2" value="2">별2_오른쪽</a>
														<a class="starR1" value="2.5">별3_왼쪽</a> 
														<a class="starR2" value="3">별3_오른쪽</a> 
														<a class="starR1" value="3.5">별4_왼쪽</a>
														<a class="starR2" value="4">별4_오른쪽</a> 
														<a class="starR1" value="4.5">별5_왼쪽</a> 
														<a class="starR2" value="5">별5_오른쪽</a>
													</div>
													<br /> <span>리뷰 : </span> <br> <span style="float: left; width: 660px;"> 
														<textarea rows="3px" cols="140px" name="repCon" id="revdate"></textarea>
														<input type="hidden" name="user_id" id="userid" value="${login.user_id }"> 
														<input type="hidden" name="bknum" id="bknum" value="${book.bk_num }"> 
														<input type="button" id="reply_btn" value="등록" class="btn btn-success">
													</span>
												</div>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					
				</div>
			</div>
		</div>
	</div>
<script>
function fn_prev(page, range, rangeSize) {//이전페이징 함수
   var page = ((range - 2) * rangeSize) + 1;
   var range = range - 1;
   var url = "/detail";
   url = url + "?num=" + ${bk_num};//책번호를 url에  추가
   url = url + "&page=" + page;	//현재페이지를 url에 추가
   url = url + "&range=" + range;	//끝페이지를 url에 추가
   
   location.href = url;//위에 추가되 url로 이동.
}


function fn_pagination(page, range, rangeSize) {//현재페이징 함수
   var url = "/detail";
   url = url + "?num=" + ${bk_num};//책번호를 url에  추가
   url = url + "&page=" + page;//현재페이지를 url에 추가
   url = url + "&range=" + range;//끝페이지를 url에 추가
   
   location.href = url;//위에 추가되 url로 이동.
}
function fn_next(page, range, rangeSize) {//다음페이징 함수
   var page = parseInt((range * rangeSize)) + 1;
   var range = parseInt(range) + 1;
   var url = "/detail";
   url = url + "?num=" + ${bk_num};//책번호를 url에  추가
   url = url + "&page=" + page;//현재페이지를 url에 추가
   url = url + "&range=" + range;//끝페이지를 url에 추가
   
   location.href = url;//위에 추가되 url로 이동.
}
</script>
	<!-- 푸터 인클루드 -->
      <jsp:include page="include/footerBox.jsp"></jsp:include>
<script>
   $(function(){//카트 버튼을 클릭하면 실행.
      $("#cart_btn").click(function(e){
      const odcount=$('#odcount').val();//담는 수량을 변수에 저장.
      const bknum=$('#bnum').val();//책번호를 변수에 저장.
      const userid="${login.user_id}";//세션에 저장되어있는 유저아이디를 변수에 저장.
      console.log("odcount : "+odcount);
      console.log("bknum : "+bknum);
      console.log("userid : "+userid);
         if(userid!=null&&userid!=""&&userid!=0){//로그인이 되어있으면 실행
            if(odcount > 0){//수량이 1이상이면 실행
               console.log("carInfo");
               $.ajax({
                  type:"POST",//post방식
                  url:"/addcart",
                  data: {
                     od_num : odcount,//수량
                     bk_num : bknum,//책번호
                     user_id : userid//로그인된 유저아이디
                  },
                  dataType:"text",
                  success:function(result){//ajax가 성공하면 실행
                     const resultSet = $.trim(result);//result값의 띄어쓰기를 없앰.
                     if(result==="success"){//result값이 success면 실행
                        var msg='장바구니에 담겼습니다.'
                        location.reload();//reload
                        alert(msg);//alert창 띄우기
                     }
                     else if(result==="fail"){//result값이 fail이면 실행
                        var msg='실패했습니다.'
                           alert(msg);//alert창 띄위기
                     }
                  }
               });
            }
            else{//수량이 0이하이면 실행
               alert('수량을 선택해주세요');
            }
         }
         else{//로그인이 되어 있지 않으면 실행.
            alert('로그인 해주세요')
         }
      });
   });
   $(document).ready(function(){
	   //수량 추가
      $("#btn_plus").click(function(e){//수량 더하기 버튼이 클릭되면 실행
         var value = parseInt($('#cartStock').val());//수량의 value값을 integer값으로 형변환한 후 변수에 저장.
         var bkprice=${book.bk_price };//책의 가격을 변수에 저장.
         value = value + 1;//value값이 추가되면 +1을 시켜서 변수에 저장
         $('#cartStock').val(value);//수량텍스트 value값에 변수를 저장
         $('#odcount').val(value);//#odcount값에 변수를 저장
         var allprice = value*bkprice;//선택된 수량과 책의 가격을 곱해서 총 수량을 구해서 변수에 저장.
         $('#allprice').text(comma(allprice));//#allprice의 text값에 comma의 함수가 실행된 allprice의 값을 저장.
      });
	   //수량 감소
      $("#btn_minus").click(function(e){//수량 빼기 버튼이 클릭되면 실행
         var value = parseInt($('#cartStock').val());//수량의 value값을 integer값으로 형변환한 후 변수에 저장.
         var bkprice=${book.bk_price };//책의 가격을 변수에 저장.
         if(value <= 0){//value값이 0이하면 return.
            return;
         }
         value = value - 1; //value값이 빼면 -1을 시켜서 변수에 저장.
         $('#cartStock').val(value);//수량텍스트 value값에 변수를 저장
         $('#odcount').val(value);//#odcount값에 변수를 저장
         var allprice = value*bkprice;//선택된 수량과 책의 가격을 곱해서 총 수량을 구해서 변수에 저장.
         $('#allprice').text(comma(allprice));//#allprice의 text값에 comma의 함수가 실행된 allprice의 값을 저장.
      });
   });
</script>
<script>
   $('#buy_btn').click(function(){//바로구매 버튼이 클릭되면 실행.
      var user = "${login.user_id}"//세션에 저장되어있는 유저아이디를 변수에 저장.
      console.log(user);
      if(user===null){//로그인이 되어있지 않으면 실행
         alert('로그인해주세요');
      }
      else{//로그인이 되어있으면 실행
         var bkprice = parseInt($('#bk_price').val());//책가격을 integer값으로 형변환해서 변수에저장.
         var odcount = parseInt($('#odcount').val());//수량을 integer값으로 형변환해서 변수에저장.
         var bk_totalprice = (bkprice*odcount);//수량과 책가격을 곱해서 변수에 저장.
         $('#bk_totalprice').val(bk_totalprice);//#bk_totalprice의 value값에 저장.
         if(odcount>0){//수량이 1이상이면 실행.
            $('#payfrm').submit();//form 태그 실행.
         }
         else{//수량이 0이하이면 실행
            alert('수량을 입력하세요')
         }
         
      }
   });
</script>

<script>
$(function(){
   $("#reply_btn").click(function(e){//댓글버튼 클릭시 실행.
   const userid=$('#userid').val();//유저아이디를 변수에 저장.
   const bknum=$('#bknum').val();//책번호를 변수에 저장.
   const revcomment=$('#revdate').val();//댓글을 변수에 저장.
   const revRank=$('#revRank').val();//별점을 변수에 저장.
      if(userid!=null&&userid!=""&&userid!=0){//로그인이 되어었으면 실행.
         if(revcomment!=null&&revcomment!=""){//댓글이 비어있지않으면 실행.
            $.ajax({
               type:"POST",//post방식
               url:"/comment",
               data: {
                  rev_rank : revRank,//별점
                  user_id : userid,//유저아이디
                  bk_num : bknum,//책번호
                  rev_comment : revcomment//댓글
               },
               dataType: "text",
               success:function(result){//ajax가 성공하면 실행.
                  const resultSet = $.trim(result);//result값의 띄어쓰기를 없앰
	                  if(resultSet==="notorder"){//result값이 notorder이면 실행
	                     alert('구매 후 리뷰 작성이 가능합니다.')
	                     location.reload();//reload
	                  }
	                  else if(resultSet==="order"){//result값이 order이면 실행.
	                     console.log('성공');
	                     location.reload();//reload
	                  }
                  
               }
            });
         }
         else{//댓글이 비어있으면 실행
            alert('댓글을 입력해주세요');
         }
      }
      else{//로그인이 되어있지 않으면 실행.
         alert('로그인 해주세요')
      }
   });
 	//별점이 클릭되면 실행.
   $('.starRev a').click(function(){ 
      $(this).parent().children("a").removeClass("on");
      $(this).addClass("on").prevAll("a").addClass("on"); 
      value=$(this).attr("value");
      $('#revRank').val(value);
      console.log($(this).attr("value")); 
   });
   
});
</script><!-- 모달창 -->
<div class="modal fade" id="myModal" role="dialog">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title">리뷰 수정</h4>
            <button type="button" class="close" data-dismiss="modal">×</button>
         </div>
            <div class="modal-body">
               <div class="starRev" id="rankStar">
               	  <!-- 별점 -->
                  <a class="starR1" id="star0" value="0.5">별1_왼쪽</a>
                  <a class="starR2" id="star1" value="1">별1_오른쪽</a>
                  <a class="starR1" id="star2" value="1.5">별2_왼쪽</a>
                  <a class="starR2" id="star3" value="2">별2_오른쪽</a>
                  <a class="starR1" id="star4" value="2.5">별3_왼쪽</a>
                  <a class="starR2" id="star5" value="3">별3_오른쪽</a>
                  <a class="starR1" id="star6" value="3.5">별4_왼쪽</a>
                  <a class="starR2" id="star7" value="4">별4_오른쪽</a>
                  <a class="starR1" id="star8" value="4.5">별5_왼쪽</a>
                  <a class="starR2" id="star9" value="5">별5_오른쪽</a>
                  
                  <input type="hidden" id="revRank" value="">
               </div>
               <br/><br/>
            <textarea rows="4px" cols="50px" id="revcom"></textarea><!-- 댓글을 쓰는 텍스트 창 -->
            <input type="hidden" id="comnum" value="">
         </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal" id="commentUpdate">수정</button><!-- 수정 버튼 -->
            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button><!-- 닫기 버튼 -->
         </div>
      </div>
   </div>
</div>
<script>
	//별점출력
   $(document).ready(function(){
      for(var i =0; i <10; i++){
         var idx = $("#starRev"+i).find("input").val() ; //#starRev 의 input의 value값을 찾아서 변수에 저장.
         idx = ( idx - 0.5 )*2//변수에서 0.5를 빼고 2를 곱해서 변수에 넣는다.
         idx = Math.floor(idx);//나온수를 내림해서 변수에 넣는다.
         $('#starRev'+i).find('#star'+idx).addClass(' on').prevAll('span').addClass(' on');//#star+idx의 값에 class명에 on을 더하고 그보다 낮은값의 class를 on으로 바꾼다.
      }
   });
</script>
<script>
//별점출력
   $(document).ready(function(){
      var idx = $("#revStar").find("input").val() ; //#revStar 의 input의 value값을 찾아서 변수에 저장.
      idx = ( idx - 0.5 )*2//변수에서 0.5를 빼고 2를 곱해서 변수에 넣는다.
      idx = Math.floor(idx);//나온수를 내림해서 변수에 넣는다.
      $('#revStar').find('#star'+idx).addClass(' on').prevAll('span').addClass(' on');//#star+idx의 값에 class명에 on을 더하고 그보다 낮은값의 class를 on으로 바꾼다.
   });
</script>

<script>//가격을 나타내기 위해 , 를 찍어주는  함수
		function comma(num){
	    var len, point, str;  
	       
	    num = num + "";  
	    point = num.length % 3 ;
	    len = num.length;  
	   
	    str = num.substring(0, point);  
	    while (point < len) {  
	        if (str != "") str += ",";  
	        str += num.substring(point, point + 3);  
	        point += 3;  
	    }  
	    return str;
	 
		}
</script>

</body>
</html>