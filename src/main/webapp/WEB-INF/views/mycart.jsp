<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<link rel="stylesheet" href="/resources/css/cart.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="resources/js/cart.js" type="text/javascript"></script>

</head>

<body>

<div id="wrap">
	
	
	<jsp:include page="include/header.jsp"></jsp:include>
	
	
	<div id="main" class="mt-3">
		<div id="main_wrap">
		<div id="main_subject">
			<p>마이페이지</p>
		</div>
	
	<div class="categories-section mt-3">
		<div id="content" class="container">
			<div id="side_menu">
				<jsp:include page="include/mypage_menu.jsp"></jsp:include>
			</div>
			<style>
				#content #main_contents {
			    width: calc(100% - 235px);
			
			    float: right;
			}
			</style>
			
			<div id="main_contents">
			<div id="main_content_subject">
				<p>장바구니</p>
			</div>
				<div id="nav_main">
					<div id="nav_main_1">
						<form role="form" action="/pay/payment" method="post">
						
						<div id="nav_main_1_cart">
							
							<div id="nav_main_1_cart_check" class="allCheck">
								<input type="checkbox" id="allCheck" checked="checked">전체선택 
								<script>
									
									
									
									// 전체선택 클릭시 모든 cheked버튼 동시 전체선택 동시 전체선택해제 
									$("#allCheck").click(function(){
										var check = $('#allCheck').prop("checked");
										if(check){
											//alert($('.chkBox').length);
											$(".chkBox").prop("checked", true);
										} else{
											//alert($('.chkBox').length);
											$(".chkBox").prop("checked", false);
										}
										callpriceSum();
									});
									
									
								</script>
								
							</div>
							
							 
							
							
							
								<div id="del_btn">
									<button type="button" class="btn btn-secondary selectDelete_btn">선택삭제</button>
									<script>
							
										// 삭제버튼 클릭시 선택한  cheked 버튼을 찾아 배열로 만들고 그 배열을 아젝스로보내 데이터를 삭제한다 
										$(".selectDelete_btn").click(function(){
											var confirm_val = confirm("선택한 상품을 삭제하시겠습니까?");
											
											if(confirm_val){
												var checkArr = new Array();
												$("input[class='chkBox']:checked").each(function(){
													checkArr.push($(this).attr("data-cartId"));
												});
												
												
												$.ajax({
													url : "/mypage/cartdel",
													type : "post",
													traditional : true,
													data : {"chkbox" : checkArr},
													success : function(result){
														if(result == 1){
															location.href = "cart";	
														} else{
															alert(result);
															alert("삭제 실패")
														}
													},error:function(result){
													    alert("error");
													  }
												});
												
											}
										});
									
								</script>
								</div>
							
								<div id="nav_main_1_cart_info" class="mt-3">	
									<table>
									
										<thead>
										<tr id="firstrow">
											<td id="c_product_info"colspan="3">상품정보</td>
											<td id="c_price">판매가</td>
											<td id="c_amount">수량</td>
											<td id="c_sum">합계</td>
										</tr>
										</thead>
										<tbody>
											<c:forEach items="${myCartList}" var="clist" varStatus="i">
												<tr>
														<td id="r_cproduct_check">
															<input type="checkbox" id="chkBox${i.getIndex()}" name="Orderlist[${i.getIndex()}].chkBox" class="chkBox" data-cartId="${clist.cart_num}"  checked="checked">
															<input type="hidden" id="cartId${i.getIndex()}" value="${clist.cart_num}" checked="checked">
															<input type="hidden" id="cart_num${i.getIndex()}" name="Orderlist[${i.getIndex()}].cart_num" value="${clist.cart_num}">
															체크
														</td>
													<td id="r_cproduct_image${i.getIndex() }" class="r_cproduct_image">
														<input type="hidden" id="bookId${i.getIndex()}" value="${clist.bk_num }" name="Orderlist[${i.getIndex()}].bk_num">
														<img src="${clist.pickurl}">
													</td>
													<td id="r_cproduct_info">
														<div class="title">
															<a>
																<strong> ${clist.bk_name} </strong>
															</a>
														</div> 
													</td>
													<td id="r_cprice">
														판매가 :	<strong id="r_cprice${i.getIndex() }" class="bk_price"><fmt:formatNumber value="${clist.bk_price}" pattern="#,###"/></strong> 원    
														<input type="hidden" value="${clist.bk_price}" name="Orderlist[${i.getIndex()}].bk_price">
													</td>
													<td id="r_camount">수량 : 
														<input type="hidden" value="${clist.od_num}" maxlength="3" id="origin_qty${i.getIndex()}" class="odNum_input" name="Orderlist[${i.getIndex()}].bk_ordercnt">
														<div class="qty_change">
															<input type="text" value="${clist.od_num}" maxlength="3" id="qty${i.getIndex()}" class="input_style02 od_input" name="Orderlist[${i.getIndex()}].cartStock" readonly="readonly">
															<a class="btn_plus" id="btn_plus${i.getIndex()}">수량 더하기</a>
															<a class="btn_minus" id="btn_minus${i.getIndex()}">수량 빼기</a>
														</div>
														
													
													</td>
													<c:set var="clist_sum_price" value="${clist.bk_price * clist.od_num}" />
													<input type="hidden" value="${clist.bk_price * clist.od_num}" id="price_sum_input${i.getIndex()}" class="price_sum_input" name="Orderlist[${i.getIndex()}].bk_price">
													<td id="r_csum" class="price_sum"><span class="price_sum${i.getIndex()}">
														
														<fmt:formatNumber value="${clist_sum_price}" pattern="#,###"/></span>원
													</td>
													
													
												</tr>
												<script>
														var prSum = ${clist.bk_price};
															
														// 화살표 버튼 클릭시 책 물량을 +1 하고  총구매값을 input에 넣어준다 
														$("#btn_plus${i.getIndex()}").click(function(){
															
															var odNum = document.getElementById("origin_qty${i.getIndex()}").value;
															
															//if(odNum <= 재고량 ) { 
															//	return;
															//}
															
															odNum = Number(odNum) + 1;
																
															document.getElementById('origin_qty${i.getIndex()}').value = odNum;
															document.getElementById('qty${i.getIndex()}').value = odNum;
															
															$('.price_sum${i.getIndex()}').text(comma(prSum * odNum));
															$('#price_sum_input${i.getIndex()}').val(prSum * odNum);
															
															callpriceSum();
				
														});
														
														// 화살표 버튼 클릭시 책 물량을 더하고 총구매값을 input에 넣어준다 
														$("#btn_minus${i.getIndex()}").click(function(){
															
															var odNum = document.getElementById("origin_qty${i.getIndex()}").value;
															if(odNum <= 1) {
																return;
															}
															odNum = Number(odNum) - 1;
																
															document.getElementById("origin_qty${i.getIndex()}").value = odNum;
															document.getElementById('qty${i.getIndex()}').value = odNum;
															
															$('.price_sum${i.getIndex()}').text(comma(prSum * odNum));
															$('#price_sum_input${i.getIndex()}').val(prSum * odNum);
															
															callpriceSum();
														});
														
														
														
												
											</script>	
											
											
												
											</c:forEach>
											
											
											
										</tbody>
										
									</table>
										<script>
												// 숫자길이를 구해 3번째마다 ,를 찍어주는 함수 
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
								</div>	
						</div>
						<div id="nav_main_1_result">
							<!-- <div id="nav_main_1_result_head">
								<input type="checkbox"><h1>전체선택</h1>
							</div> -->
			
							<form id="buy_form" method="post" action="pay/payment">
			
							<div id="nav_main_1_result_info">
								<div id="nav_main_1_result_info_hidden"></div>
								<table>
									<thead>
										<tr>	
											<td>상품금액/<span id="bookKinds"></span>종(<span id="bookAmount"></span>개)</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="result_info_price">
											<input type="hidden" id="priceTotal_input" name="Orderlist.od_totalprice">
												<h1><span id="priceTotal"> 0 </span></h1><h3>원</h3>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						
							<div id="nav_main_1_result_btn">
								<input type="submit" value="결제하기" id="pay_button" class="btn btn-secondary mt-3">
								
							</div>
							
						</div>
						<script>
						
							
							// 책개수와 책가격을 곱해 #priceTotal과 input에 담아주는 함수  
							function callpriceSum() {
								var bookAmount = 0;	
								var chck = $("input[class='chkBox']:checked").length;
								
								if(chck <= 0) {
									$('#priceTotal').text("0");
									return;
								}
								
								$("input[class='chkBox']:checked").each(function(){
									
									var bkPrice = $(this).closest("tr").find(".bk_price").text();
									bkPrice = bkPrice.replace(/,/g, "");
									var odNum = $(this).closest("tr").find(".odNum_input").val();
									
									
									bookAmount = bookAmount + ( bkPrice * odNum );
									
									
								});
								
								
							
								
								$('#priceTotal').text(comma(bookAmount));
								$('#priceTotal_input').val(bookAmount);
							
								
							}
							
							window.onload = function(){
								callpriceSum();
							}
							
							$(".chkBox").click(function(){
								callpriceSum();
							});
			
								
						
							
						
						</script>
						
						
						
						
									
						
						</form>
					</div>
				</div>
				
				
				
				</div>
		
		
		</div>
	
		
	</div>
	</div>
	</div>
	
	
	<jsp:include page="include/footerBox.jsp"></jsp:include>
	
	
	<!-- <div id="side_left_ad"><h1>side left85 703</h1></div> -->
	</div>

	<!-- <div id="side_right_ad"><h1>side right 63 362</h1></div> -->
</body>
</html>