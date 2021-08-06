<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<!-- <link rel="stylesheet" href="../resources/css/pay/payment.css"> -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="../resources/js/preBuy.js" type="text/javascript"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- <script src="../resources/js/detail.js" type="text/javascript"></script> -->
<style>
* {
	margin: 0;
	padding: 0
}

.allWrap {
	width: 800px;
	margin: 0 auto;
}

.tabBox {
	margin: 20px 0;
}

.tab-link {
	width: 47%;
	display: inline-block;
	padding: 10px;
	text-align: center;
	background-color: #929090;
	border-radius: 20px;
	color: #fff;
	cursor: pointer;
}

.tab-link.current {
	background-color: #de4c4c;
	font-weight: 600;
}

.tab-content {
	display: none;
}

.tab-content.current {
	display: block;
	width: 100%;
	height: 600px;
	background-color: white;
	font-size: 30px;
	text-align: left;
	line-height: 30px;
}

/* 구매품 리스트 */
#main_list {
}

#main_list>table {
	width: 100%;
	border-bottom: #ddd solid 2px;
	border-top: black solid 2px;
	border-collapse: collapse;
}

#main_list>table>thead>tr {
	border-bottom: 1px solid #e7e7e7;
	background: #fbfbfb;
	height: 50px;
}

#main_list>table>tbody>tr {
	border-bottom: 1px solid #e7e7e7;
	height: 110px;
}

#main_list>table>tbody>tr {
	border-top: 1px solid #e7e7e7r;
}

.main_list_head_col1 {
	width: 60%;
}

main_list_head_col2 {
	width: 40%;
}

.main_list_col1 {
	width: 15%;
}

.main_list_col2 {
	width: 45%;
	border-right: 1px solid #e7e7e7;
}

.main_list_col3 {
	width: 40%;
	text-align: center;
}

/* 할인적립 */
#main_buy_point {
	margin-top: 50px;
}

#main_buy_point>table {
	width: 100%;
	height: 130px;
	border-top: solid black 2px;
	border-bottom: solid #ddd 1px;
}

#main_buy_point>table>tr>th {
	border-right: 1px solid #ddd;
	background-color: #fbfbfb;
}

/* 마일리지 모두사용/ 취소버튼 */
#point_btn1 {
	display: inline-block;
	width: 85px;
	border: 1.5px solid black;
	height: 30px;
	text-align: center;
	line-height: 28px;
	font-weight: 900;
	border-radius: 4px;
	background-color: #eae2e2;
	cursor: pointer;
}

#point_btn2 {
	display: inline-block;
	width: 85px;
	border: 1.5px solid black;
	height: 30px;
	text-align: center;
	line-height: 28px;
	font-weight: 900;
	border-radius: 4px;
	background-color: #eae2e2;
	cursor: pointer;
}

/* 결제수단 선택 */
#main_buy {
	margin-top: 50px;
}

/* 최종결제 div */
#main_right {
	width: 536px; //
	height: 500px;
	margin: auto;
	/* 	position : absolute; */ right : 0;
	top: 0; //
	background-color: blue;
	border: black 1px solid;
	right: 0
}

#main_right ul {
	list-style: none;
}

#final_buy_info {
	padding: 15px 20px;
}

#final_buy_info>ul>li {
	margin-top: 13px;
}

#label {
	float: left;
}

#label_result {
	float: right;
}

.total_li {
	border-top: 1px solid #ddd;
	padding-top: 20px;
}

.total_li strong>#number {
	font-size: 30px;
	color: red;
}

#final_buy_point {
	border-top: 1px solid #ddd;
}

#point_btn2 {
	display: none;
}

#final_buy_point {
	padding: 20px 20px;
	border-top: 1px solid #ddd;
}

#final_buy_check {
	padding: 20px 20px;
	border-top: 1px solid #ddd;
}

#final_buy_check>input[type="checkbox"] {
	width: 30px;
	height: 30px;
	margin-right: 10px;
}

#final_buy_check>strong {
	color: #c33838;
	font-size: 25px;
}

#final_buy_button {
	padding: 20px 20px;
	border-top: 1px solid #ddd;
}

.liston {
	width: 20px;
	height: 20px;
	margin-left: 5px;
}

.order_cli {
	margin-top: 20px;
	margin-bottom: 20px;
}

#main_buy_info {
	margin-top : 100px;
}

.btn-outline-primary {
	margin-bottom: 5px;
}

</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>

	<!-- 상단부(로고, 검색창, 로그인창) -->



	<div id="main_wrap">
		<form method="post" action="/pay/LastPayment" id="buy_form">
			<div id="main_left">
				<div class="allWrap">
					<div id="main_buy_info">
						<div>
							<strong><h2>구매자 정보</h2></strong>
						</div>
						<hr/>
						<table>
							<colgroup>
								<col width="30%">
								<col width="*">
							</colgroup>
							<div class="order_cli">
								<h2>주문자 </h2>
								<hr/>
								<h3>${login.user_name} ${login.user_phone }</h3>
							</div>
							<hr/>
						
							<div>
								<input type="hidden" id="userId" value="${login.user_id}">
							</div>
							<div>
								<input type="hidden" id="userPoint" value="${login.user_point}">
							</div>
						</table>
					</div>
					<div id="main_buy_addr">
						<div>
							<strong><h3>배송정보</h3></strong>
						</div>
						<hr/>
						<div class="tabBox">
							<p class="tab-link current" data-tab="tab-1">저장 정보</p>
							<p class="tab-link" data-tab="tab-2">직접 입력</p>
						</div>




						<div id="tab-1" class="tab-content current">
							<p>배송지 선택(최근 배송지)</p>
							<c:forEach var="addrList" items="${addList}" varStatus="vs">
								<br/>
								<div class="arrdGroup alert alert-dismissible alert-warning">
									<div><input type="radio" name="addrconfirm" id="liston${vs.getIndex()}" class="liston" value="click${vs.getIndex()}">
									<span>받는 사람 : ${addrList.rec_name }</span>
										<hr />
										<input type="hidden" name="receiver_name"
											id="receiver_name${vs.getIndex()}"
											value="${addrList.rec_name }" class="nameValue">
										<h4>주소 : ${addrList.rec_addr }</h4>
										<input type="hidden" name="rec_addr"
											id="rec_addr${vs.getIndex()}" value="${addrList.rec_addr }"
											class="addrValue">
										<hr />
										<h4>휴대전화 : ${addrList.rec_phone }</h4>
										<input type="hidden" name="user_phone"
											id="user_phone${vs.getIndex()}"
											value="${addrList.rec_phone }" class="phoneValue">
									</div>
								</div>
							</c:forEach>
						</div>
					</div>

					<div id="tab-2" class="tab-content">
						<form id="" method="">
							<table >
								<colgroup>
									<col width="30%">
									<col width="*">
								</colgroup>
								<tr class="" >
									<th>받는이</th>
									<td><input type="text" name="orderRec" id="orderRec">
									</td>
								</tr>
								<tr class="">
									<th>휴대전화</th>
									<td><input type="text" name="orderPhone" id="orderPhone">
									</td>
								</tr>
<!-- 								<div class="address name">주소</div> -->
								<!-- <span type="text" class="btn btn-outline-primary">주소</span> -->
								<div class="address_imput_1_wrap">
									<div class="address_input_1_box">
										<input class="address_input_1" name="memberAddr1"
											id="memberAddr1" readonly="readonly">
									</div>
									<div class="address_button" onclick="execution_daum_address()">
									<br/>
									<span type="text" class="btn btn-outline-primary">주소 찾기</span>
									<div class="clearfix"></div>
								</div>
									</div>
								<div class="address_imput_2_wrap">
									<div class="address_input_2_box">
										<input class="address_input_2" name="memberAddr2"
											id="memberAddr2" readonly="readonly">
									</div>
								</div>
								</div>
								<div class="address_imput_3_wrap">
									<div class="address_input_3_box">
										<input class="address_input_3" name="memberAddr3"
											id="memberAddr3" readonly="readonly">
									</div>
								</div>
								<br/>
								<input type="hidden" id="user_id" value="${login.user_id}">
<!-- 								<input type="button" id="addAddr" value="등록"> -->
								<input type="button" class="btn btn-outline-primary"" id="addAddr" value="등록">
							</table>
						</form>
					</div>

					<div id="main_list">
						<h2>주문상품</h2>
						<table>
							<thead>
								<tr id="firstrow">
									<td class="main_list_head_col1" colspan="2">상품정보</td>
									<td class="main_list_head_col2">판매가</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list" varStatus="vs">
									<tr>
										<td class="main_list_col1"><img
											src="${list.bk_thumbUrl }"
											style="width: 100px; height: 110px"></td>
										<td class="main_list_col2">${list.bk_name }<input
											type="hidden" id="bkName${vs.getIndex()}"
											value="${list.bk_name }"> <input type="hidden"
											id="bkNum${vs.getIndex()}" value="${list.bk_num }">

										</td>
										<td class="main_list_col3"><fmt:formatNumber
												value="${list.bk_price}" pattern="#,###" /> 원 | 수량
											${list.bk_ordercnt } 개 <input type="hidden"
											id="bkPrice${vs.getIndex()}" value="${list.bk_price}">
											<input type="hidden" id="bkOdcnt${vs.getIndex()}"
											value="${list.bk_ordercnt }"> <input type="hidden"
											id="cartNum${vs.getIndex()}" value="${list.cart_num }">
											<c:choose>
												<c:when test="${login.user_rank == '0'}">
													<input type="hidden" id="totalPrice${vs.getIndex()}"
														value="${list.bk_price*list.bk_ordercnt }">
												</c:when>
												<c:when test="${login.user_rank == '1'}">
													<input type="hidden" id="totalPrice${vs.getIndex()}"
														value="${(list.bk_price*list.bk_ordercnt)*0.97 }">
												</c:when>
												<c:otherwise>
													<input type="hidden" id="totalPrice${vs.getIndex()}"
														value="${(list.bk_price*list.bk_ordercnt)*0.95 }">
												</c:otherwise>
											</c:choose> 
											<c:set var="total"
												value="${total + (list.bk_price*list.bk_ordercnt)}" /> <!-- 각 제품의 할인된가격 총합 -->
											<c:set var="discountPrice" value="0" /> <!-- 할인된가격 * 수량 -->
											<c:set var="discountPriceStock" value="0" /> <!-- 받을 포인트 -->
											<c:set var="point" value="0" />
											
									   <script>
											 
											$(document).ready(function(){
												
												var phone;
												var name;
												var addr;
												
												var finalTotalPrice = Math.floor($('#finalTotalPrice').val());
												var total = ${total};
												console.log("total : "+total);
												console.log("totalPrice : "+ finalTotalPrice);
												
												
												$('.liston').click(function(){
													
													 phone = $(this).parent().find('.phoneValue').val();
													 name = $(this).parent().find('.nameValue').val();
													 addr = $(this).parent().find('.addrValue').val();	
												
											
													console.log("name : "+name);									      
													console.log("phone : "+phone);									      
													console.log("addr : "+addr);
											
													
													
												
												});	
									
											
											$("#lastPayment").click(function(evt){							
											
												
												if(!$("input:radio[name='addrconfirm']").is(":checked")){
													
													alert("배송지를 선택해주세요.");
											    	
											    	evt.stopImmediatePropagation();
											    	
												} else if(!$("input:checkbox[name='checkbox']").is(":checked")) {
													
													alert("결제 동의가 필요합니다.");
											    	
											    	evt.stopImmediatePropagation();
												
												} else if(${login.user_point} < finalTotalPrice) {
													
													alert("point 잔액이 부족합니다.");
													
													evt.stopImmediatePropagation();
												}  
												  
												else {
													
													var userId = $('#userId').val();
													var userPoint = $('#userPoint').val();
													var bkName = $('#bkName${vs.getIndex()}').val();
													var bkNum = $('#bkNum${vs.getIndex()}').val();
													var bkPrice = $('#bkPrice${vs.getIndex()}').val();
													var bkOdcnt = $('#bkOdcnt${vs.getIndex()}').val();
													var cartNum = $('#cartNum${vs.getIndex()}').val();
													//var totalPrice = Math.floor($('#totalPrice${vs.getIndex()}').val());
													var totalPrice = Math.floor($('#finalTotalPrice').val());
													var saleBkPrice = Math.floor($('#totalPrice${vs.getIndex()}').val());
													
													userPoint = userPoint - totalPrice;
													
													
													console.log("name : "+name);									      
													console.log("phone : "+phone);									      
													console.log("addr : "+addr);									      
													console.log("userId : "+userId);									      
													console.log("bkName : "+bkName);									      
													console.log("bkNum : "+bkNum);									      
													console.log("bkPrice : "+bkPrice);									      
													console.log("bkOdcnt : "+bkOdcnt);									      
													console.log("totalPrice : "+totalPrice);									      
													console.log("saleBkPrice : "+saleBkPrice);									      
																						      
																					      
											
											    $.ajax({			
														url: "LastPayment",
														type: "POST",
														data:{
															"reci_name" : name,						      
															"reci_phone" : phone,									      
															"reci_addr" : addr,									      
															"userId" : userId,
															"userPoint" : userPoint,											
															"bkName" : bkName,									      
															"bkNum" : bkNum,									      
															"bkPrice" : bkPrice,									      
															"bkOdcnt" : bkOdcnt,
															"cartNum" : cartNum,
															"totalPrice" : totalPrice,
															"saleBkPrice" : saleBkPrice
															
																      
																												
													},
													success: function(data) {
														
														location.href="../mypage/order";
														
															
														
													}
											
												});
													
													}
												});
										});								
											
									
										
											</script>
								</c:forEach>
							</tbody>

							<script>
							
							$(document).ready(function(e){
								
								var shipPrice = $('#shipPrice').val();
								
								
								$("#lastPayment").click(function(){		
									
									var userPoint = $('#userPoint').val();
									var totalPrice = Math.floor($('#finalTotalPrice').val());
									
									userPoint = userPoint - totalPrice;
									console.log("shipPrice : "+shipPrice);
									
									
										
								    $.ajax({			
										url: "LastPayment",
										type: "GET",
										data:{
											"shipPrice" : shipPrice,
											"user_point" : userPoint
																				
									},
									success: function(data) {								
											
										
									}
							
										});											      
									});
								});
								
							
						 
						</script>
						</table>
					</div>
					<div id="main_buy">
						<h2>결제정보</h2>
					</div>
					<br/>
				</div>
				<div id="main_right">
					<div id="final_buy_info">
						<ul>
							<li class="totalPrice"><!-- <span id="label">상품금액</span> -->
							<span type="button" class="btn btn-light">상품금액</span>
							<span
								id="label_result">${total}원</span>
								<div class="clearfix"></div></li>
							<li class="shipPrice"><c:if test="${total >= 30000}">
									<c:set var="shipPrice" value="0" />
								</c:if> <c:if test="${total < 30000}">
									<c:set var="shipPrice" value="3500" />
								</c:if> 
								<span id="label" class="btn btn-light">배송비[주문 금액 30,000원 이상 무료]</span>
								<!-- <span type="button" class="btn btn-light">상품금액</span> -->
								 <span id="label_result">${shipPrice}원</span> <input type="hidden"
								name="shipPrice" id="shipPrice" value="${shipPrice }">
								<div class="clearfix"></div></li>
							<li class="sale_price"><c:choose>
									<c:when test="${login.user_rank == '0'}">
										<c:set var="sale_price" value="0" />
										<c:set var="customerInfo" value="일반고객  할인율 없음" />
									</c:when>
									<c:when test="${login.user_rank == '1'}">
										<c:set var="sale_price" value="${total*0.03 }" />
										<c:set var="customerInfo" value="VIP고객  상품 금액 할인율 3%" />
									</c:when>
									<c:otherwise>
										<c:set var="sale_price" value="${total*0.05 }" />
										<c:set var="customerInfo" value="VVIP고객  상품 금액 할인율 5%" />
									</c:otherwise>
								</c:choose>
								<span id="label" class="btn btn-light">할인금액 [${customerInfo}]</span>
								
								<span
								id="label_result"><span id="number"> </span> <fmt:formatNumber
										value="${sale_price}" pattern="#,###" />원</span> <input
								type="hidden" id="sale_priceInput" name="usePoint" value="0">
								<div class="clearfix"></div></li>
									<c:set var="finalTotalPrice" value="${(total+shipPrice)-sale_price }" />
									<span id="label" class="btn btn-light">최종 결제금액</span>
									<strong id="label_result">
									<span id="number">
										<fmt:formatNumber value="${finalTotalPrice}" pattern="#,###" />
									</span>원</strong>
									<input type="hidden" id="finalTotalPrice" value="${finalTotalPrice}">

								<div class="clearfix"></div></li>

						</ul>
					</div>
					<div id="final_buy_check">
						<input type="checkbox" name="checkbox" class="btn btn-light"> 주문내역 확인 동의<strong><필수></strong>
					</div>
					<div id="final_buy_button">
						<input type="button" id="lastPayment" class="btn btn-outline-danger" value="결제하기">
					</div>
				</div>
				<br/>
				<div class="clearfix"></div>
			</div>
	</div>
	
   	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>

	<!-- Bootstrap JS Script -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<!-- Bootstrap jQuery Script -->
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<!-- 에러시 여길볼것 -->
	<script>
						$('.tab-link').click(function () {
					        var tab_id = $(this).attr('data-tab');
					 
					        $('.tab-link').removeClass('current');
					        $('.tab-content').removeClass('current');
					 
					        $(this).addClass('current');
					        $("#" + tab_id).addClass('current');
					
					    });
						</script>

	<div id="main_buy_addr_info2" class=""></div>
	</div>




	</form>
	</div>




	<jsp:include page="../include/footerBox.jsp"></jsp:include>


	</div>

</body>

<!-- 카카오 지도 api  -->
<script type="text/javascript">

function execution_daum_address(){
	 
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 주소변수 문자열과 참고항목 문자열 합치기
                addr += extraAddr;
            
            } else {
            	addr += ' ';
            }

            $(".address_input_1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $(".address_input_2").val(addr);
            //$("[name=memberAddr2]").val(addr);            // 대체가능
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $(".address_input_3").attr("readonly",false);
             $(".address_input_3").focus();
 
        }
    }).open();    
 
}



// 배송지 등록 이벤트
$(document).ready(function(e){
	
	$("#addAddr").click(function(){
		
		const userID = $('#user_id').val();
		const name = $('#orderRec').val();
		const phone = $('#orderPhone').val();
		const addr = $('#memberAddr1').val() + $('#memberAddr2').val()
		
	 
			console.log("userID : "+userID);									      
			console.log("name : "+name);									      
			console.log("phone : "+phone);									      
			console.log("addr : "+addr);									      
	
        $.ajax({			
				url: "regiaddr",
				type: "POST",
				data:{
					"userID" : userID,						      
					"name" : name,									      
					"phone" : phone,									      
					"addr" : addr		      
																		
			},
			success: function(data) {
				alert("배송지가 등록되었습니다.");
				location.reload();
				
					
				
			}
		});
	});
	
});

</script>



</html>