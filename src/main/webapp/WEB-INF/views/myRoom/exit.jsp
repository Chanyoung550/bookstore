<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<link rel="stylesheet" href="../resources/css/myRoom/exit.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="../resources/js/myRoom/exit.js" type="text/javascript"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>




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
					<a href="/main"><img src="../resources/img/logo.png"></a>
				</div>
			</div>
			<div id="top_1_selection">
				<div id="top_1_selection_1">
					<jsp:include page="../include/searchBox.jsp"></jsp:include>
				</div>
			</div>
			<div id="top_1_login">
				<jsp:include page="../include/top_login.jsp">
					<jsp:param name="member" value="${member}" />
				</jsp:include>	
			</div>
		</div>
	</div>
	<div id="main">
		<div id="main_wrap">
		<div id="main_subject">
			<p>관리자페이지</p>
		</div>
			<!-- 메인 네비게이션 -->
			<div id="main_nav_wrap">
				<div id="main_nav">
					<ul>
						<li id="main_nav_1"><a href="/myRoom/main">주문/배송조회</a></li>
						<li id="main_nav_2"><a href="/myRoom/modify">비밀번호 수정</a></li>
						<li id="main_nav_3"><a href="/myRoom/exit">회원 탈퇴</a></li>
					</ul>
				</div>
			</div>
			<!-- 메인  컨텐츠-->
			<div id="main_content_wrap">
				<div id="main_content">
					<div id="main_content_subject">
						<p>주문/배송조회</p>
					</div>
					<div id="main_content_1">
						<table>
							<thead>
							
								<tr>
									<td id="th_td_year">일자</td>
									<td id="th_td_info">상품정보</td>
									<td id="th_td_year">상태</td>
									<td id="th_td_btn">비고</td>
								</tr>
							
							</thead>
							
							<tbody>
								<c:set var="i" value="0"/>
								<c:forEach items="${list}" var="list">
								<tr>
									<td id="tb_td_year" class="tb_td_year">${list.orderDate }</td>
									<td  class="tb_td_info">
										상품명 :<span id="productName${i }"></span>
										(<span id="cnt${i}"></span> 종 /<span id="amount${i}"></span>개)
										<br>
										금액 : <fmt:formatNumber value="${list.totalPrice}" pattern="#,###"/>원
										 
									</td>
									<td class="tb_td_state">${list.state}</td>
									<td class="tb_td_btn">
									
										<c:if test="${list.state != '배송완료'}">
											-
										</c:if>
									
										<c:if test="${list.state == '배송완료' }">
											<button id="shipClear${i }">구매확정</button>
										</c:if>
										<input type="hidden" id="orderId${i }" value="${list.orderId }">
										
										<script>
										
										//배송출발 버튼
										$('#shipClear${i }').on("click", function(){
											
											var orderId = $('#orderId${i}').val();
											var data = {orderId : orderId}
											$.ajax({
												url : "shipClear",
												type : "post",
												data : data,
												dataType:'json',
												success : function(data){
													location.reload();
												}
											});
										});
										
										
										
										</script>
										
									
									</td>
								</tr>
								
									<input type="hidden" id="orderId${i}" value="${list.orderId}">
									<script>
									
									//책 제목, 종류, 갯수
									(function(){
										//alert("연결");
										var orderId = $('#orderId${i}').val();
										//orderId = String(orderId);
										var data = {orderId : orderId}
										$.ajax({
											url : "repOrder",
											type : "post",
											data : data,
											dataType:'json',
											success : function(data){
												console.log(data.productName);
												$('#productName${i}').html(data.productName);
												$('#cnt${i}').html(data.cnt);
												$('#amount${i}').html(data.amount);
												
											}
										});
									})();
									</script>
								<c:set var="i" value="${i+1 }"/>
								</c:forEach>

							</tbody>
						</table>
						
						
						<div id="book_searchBox">
										<c:if test="${page.prev}">
										    <a href="mainPaging?pageNum=${page.startPage-1}&amount=${page.cri.amount}">이전</a>
										</c:if>
										<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}" >
										      			<a href="mainPaging?pageNum=${num}&amount=${page.cri.amount}">${num}</a>
										</c:forEach>
										<c:if test="${page.next}">
										   <a href="mainPaging?pageNum=${page.endPage+1}&amount=${page.cri.amount}">다음</a>
										</c:if>		
						</div>
						
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