<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<link rel="stylesheet" href="../../resources/css/myRoom/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="../../resources/js/myRoom/main.js" type="text/javascript"></script>
<script src="../../resources/ckeditor/ckeditor.js"></script>




</head>
<body>
<div id="wrap">
	<div id="top_ad">
		<div class="top_ad_right"></div>
		
		<div id="top_ad_img">
			<img src="http://image.kyobobook.co.kr/dwas/images/prom/banner/2020/02/13/bnC_pc_ink_950x65.jpg">
			<button onclick="jQuery('#top_ad').slideUp();"><img src="resources/img/close_button.gif"></button>
		</div>
	</div>
		
	 
	<div id="top_mini">
		
		
	</div>
	
	
	<!-- 상단부(로고, 검색창, 로그인창) -->
	<div id="top">
		<div id="top_1">
			<div id="top_1_logo">
				<div id="top_1_logo_1">
					<a href="main"><img src="/resources/img/logo.png"></a>
				</div>
			</div>
			<div id="top_1_selection">
				<div id="top_1_selection_1">
					<jsp:include page="../include/searchBox.jsp"></jsp:include>
				</div>
			</div>
			
		</div>
	</div>
	
	
	
	
	
	
	<div id="top_nav">
		<div id="top_nav_1">
			<nav>
				<ul class="domestic on"><a href="search" >카테고리 보기</a>
					<div>
						<ul class="search_1 ca_menu">
							<li><a href="/search?cateCode=001">소설</a></li>
							<li><a href="/search?cateCode=002">시/에세이</a></li>
							<li><a href="/search?cateCode=003">경제/경영</a></li>
							<li><a href="/search?cateCode=004">자기계발</a></li>
							<li><a href="/search?cateCode=005">인문</a></li>
							<li><a href="/search?cateCode=006">역사/문화</a></li>
							<li><a href="/search?cateCode=007">종교</a></li>
							<li><a href="/search?cateCode=008">정치/사회</a></li>
							<li><a href="/search?cateCode=009">예술/대중문화</a></li>
							<li><a href="/search?cateCode=010">과학</a></li>
							<li><a href="/search?cateCode=011">기술/공학</a></li>
							<li><a href="/search?cateCode=012">컴퓨터/IT</a></li>
							<li><a href="/search?cateCode=009">예술/대중문화</a></li>
							<li><a href="/search?cateCode=010">과학</a></li>
							<li><a href="/search?cateCode=011">기술/공학</a></li>
							<li><a href="/search?cateCode=012">컴퓨터/IT</a></li>
						</ul>
						
					</div>
				</ul>
				<ul class="forgien"><a href="search">베스트</a>
					<div>
						<p>서비스 준비중입니다.</p>
					</div>
				</ul>
				<ul class="used"><a href="search">신간</a>
					<div>
						<p>서비스 준비중입니다.</p>
					</div>
				</ul>
				<ul class="used"><a href="search">일일</a>
					
				</ul>
					
			</nav>
			
			<div id="top_mini_1">	
			<ul class="clearfix">
				<li><a href="loginMain">로그인</a></li>
				<li><a href="member/joinPage">회원가입</a></li>
				<%-- 로그인 했을떄 보이는 ui  
				<li><a href="mypage">로그아웃</a></li>
				<li><a href="mypage">마이페이지</a></li>
				--%>
			</ul>	
		</div>
		
		</div>
	</div>
	
	
	
	
	<div id="main">
		<div id="main_wrap">
		<div id="main_subject">
			<p>마이룸</p>
		</div>
			<!-- 메인 네비게이션 -->
			<div id="main_nav_wrap">
				<div id="main_nav">
					<ul>
						<li id="main_nav_1"><a href="/myRoom/main">주문/배송조회</a></li>
						<li id="main_nav_1"><a href="/myRoom/main">장바구니</a></li>
						<li id="main_nav_2"><a href="/myRoom/modify">회원정보 수정</a></li>
						<li id="main_nav_3"><a href="/myRoom/exit">포인트 충전</a></li>
					</ul>
				</div>
			</div>
			<!-- 메인  컨텐츠-->
			<div id="main_content_wrap">
				<div id="main_content">
					<div id="main_content_subject">
						<p>주문현황 미리보기</p>
						<p class="text_right"><a href="#">더보기</a> </p>
					</div>
					<div id="main_content_1">
						<table>
							<thead>
							
								<tr>
									<td id="th_td_year">일자</td>
									<td id="th_td_info">상품정보</td>
									<td id="th_td_stae">배송지</td>
									<td id="th_td_btn">배송상태</td>
								</tr>
							
							</thead>
							
							<tbody>
								<c:set var="i" value="0"/>
								<c:forEach items="${myOrderList}" var="list">
								<tr>
									<td id="tb_td_year" class="tb_td_year">${list.od_date }</td>
									<td  class="tb_td_info">
										상품명 :<span id="productName${i }"></span>
										(<span id="amount${i}">${list.bk_ordercnt } </span>개)
										<br>
										금액 : <fmt:formatNumber value="${list.od_totalprice}" pattern="#,###"/>원
										 
									</td>
									<td class="tb_td_state">${list.user_addr}</td>
									<td class="tb_td_btn">
									
										<c:if test="${list.od_dv != '배송완료'}">
											-
										</c:if>
									
										
										<input type="hidden" id="orderId${i }" value="${list.user_id }">
										
										
										
									
									</td>
								</tr>
								
									<input type="hidden" id="orderId${i}" value="${list.od_num}">
									
								<c:set var="i" value="${i+1 }"/>
								</c:forEach>

							</tbody>
						</table>
						
					</div>
				</div>		
			</div>
			<div class="clearfix">
			</div>
		</div>
	</div>
	
	
	
	
	<div id="footer_nav">
		<div id="footer_nav_container">
			<ul>
				<li>회사소개</li>
				<span class="line">|</span>
				<li>이용약관</li>
				<span class="line">|</span>
				<li>고객센터</li>
				<span class="line">|</span>
				<li>광고문의</li>
				<span class="line">|</span>
				<li>채용정보</li>
				<span class="line">|</span>
			</ul>
		</div>
	</div>
	
	<div id="footer">
		<div id="footer_container">
			
			<div id="footer_left">
				<img src="../resources/img/mlogo.png">
			</div>
			<div id="footer_right">
				(주) SJBook  울산광역시 삼산동 그린아카데미  대표이사 : OOO
				<br>
				사업자등록번호 : ooo-oo-ooooo
				<br>
				<strong>대표전화 : oooo-oooo(발신자 부담전화)</strong>
				<br>
				<br>
				COPYRIGHT(C) <strong>SJBook</strong>	ALL RIGHTS RESERVED.
			</div>
			<div class="clearfix"></div>
		</div>
	</div>


	
	
	</div>

	
</body>
</html>