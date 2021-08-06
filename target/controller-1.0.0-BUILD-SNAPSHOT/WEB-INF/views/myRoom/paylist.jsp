<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<link rel="stylesheet" href="../resources/css/myRoom/myorder.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="../resources/js/myRoom/exit.js" type="text/javascript"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
<script src="../resources/bootstraps/css/bootstrap.css"></script>

</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>

<div id="wrap">
	
	
	
	<div id="main" class="mt-3">
		<div id="main_wrap">
		<div id="main_subject">
			<p>마이페이지</p>
		</div>
			
			<jsp:include page="../include/mypage_menu.jsp"></jsp:include>
			<!-- 메인  컨텐츠-->
			<div id="main_content_wrap">
				<div id="main_content">
					<div id="main_content_subject">
						<p>포인트 사용내역 / 조회</p>
					</div>
					<div id="main_content_1">
						<div class="form-group row justify-content-left" style="margin: 10px">
						<p style="margin-right: 10px"> 조회기간:
							<div class="w100 float_left" style="padding-right:10px; float:left;">
						    <input type="text" id="datepicker1" class="form-control form-control-sm">
						    </div> ~
						    <div class="w100 float_left" style="padding-right:10px; float:left;">
						    <input type="text" id="datepicker2" class="form-control form-control-sm">
						    </div>
							<p>
								<input type="submit" value="검색" class="btn btn-sm btn-primary" id="pointSearch">
							</p>
						</div>
						
					
						<table id="point_table">
							<thead>
							
								<tr style="background-color: #e9e9e9;">
									<td id="th_td_year">일자</td>
									<td id="th_td_info" style="width: 22%;">내용</td>
									<td id="th_td_stae" style=" width: 22%;">충천포인트</td>   
									<td id="th_td_stae" style=" width: 22%;">사용포인트</td>
									<td id="th_td_btn" style=" width: 22%;">남은포인트</td>
								</tr>
							
							</thead>
							
							<tbody>
								
								<c:forEach items="${paylist}" var="list" varStatus="i" >
								<tr>
									<td id="tb_td_year" class="tb_td_year">${list.point_date }</td>
									<td  class="tb_td_info">
										<c:if test="${list.point_charge != '0'}">
											충전
										</c:if>
										<c:if test="${list.point_payment != '0'}">
											포인트사용
										</c:if>
									</td>
									<td class="tb_td_state"><fmt:formatNumber value="${list.point_charge}" pattern="#,###"/></td>
									<td class="tb_td_state"><fmt:formatNumber value="${list.point_payment}" pattern="#,###"/></td>
									<td class="tb_td_btn"><fmt:formatNumber value="${list.point}" pattern="#,###"/></td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
						
						<div id="paginationBox" class="mb-5" style="text-align: center; margin-top: 20px">
								<ul class="pagination justify-content-center" >
								<c:if test="${pagination.prev}">
									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType }','${pagination.keyword }', '${pagination.startDate}', '${pagination.endDate}')">Previous</a></li>
								</c:if>
								
								
								<c:forEach begin="${pagination.startPage}" end="${pagination.endPage }" var="idx">
									<li
										class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
										class="page-link" href="#"
										onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType }','${pagination.keyword }', '${pagination.startDate}', '${pagination.endDate}')">
											${idx} </a></li>
								</c:forEach>
								<c:if test="${pagination.next}">
									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType }','${pagination.keyword }', '${pagination.startDate}', '${pagination.endDate}')">Next</a></li>
								</c:if>
								</ul>
							</div>
					</div>
				</div>		
			</div>
			<div class="clearfix">
			</div>
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
	
	<jsp:include page="../include/footerBox.jsp"></jsp:include>

	</div>
	
	<script>
		//이전 버튼 이벤트									
		function fn_prev(page, range, rangeSize, searchType, keyword, startDate, endDate) {									
				var page = ((range - 2) * rangeSize) + 1;									
				var range = range - 1;								
				var url = "${pageContext.request.contextPath}/mypage/paylist";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				url = url + "&keyword=" + $('#order_keyword').val();
				url = url + "&startDate=" + startDate;
				url = url + "&endDate=" + endDate;
				location.href = url;
			}
		  //페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword, startDate, endDate) {
				var url = "${pageContext.request.contextPath}/mypage/paylist";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				url = url + "&searchType=" + searchType;
				url = url + "&keyword=" + keyword;
				url = url + "&startDate=" + startDate;
				url = url + "&endDate=" + endDate;
				location.href = url;	
			}
			//다음 버튼 이벤트
		 function fn_next(page, range, rangeSize, searchType, keyword, startDate, endDate) {
			    var page = parseInt((range * rangeSize)) + 1;
				var range = parseInt(range) + 1;
				var url = "${pageContext.request.contextPath}/mypage/paylist";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				url = url + "&keyword=" + $('#order_keyword').val();
				url = url + "&startDate=" + startDate;
				url = url + "&endDate=" + endDate;
				location.href = url;
			}
		
		  $(document).on('click', '#pointSearch', function(e){
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/mypage/paylist?";
				
				if($(datepicker1).val() != null && $(datepicker1).val() != '') {
					url = url + "startDate=" + $('#datepicker1').val();
					url = url + "&endDate=" + $('#datepicker2').val();
				}
				
				
				location.href = url;
				console.log(url);
			});
									
								
		</script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
						<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
						<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
						<script>
							
							var today = new Date().toLocaleDateString();
						
							
						
						  $.datepicker.setDefaults({
						    dateFormat: 'yy-mm-dd',
						    prevText: '이전 달',
						    nextText: '다음 달',
						    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
						    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
						    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
						    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
						    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
						    showMonthAfterYear: true,
						    yearSuffix: '년',
						    maxDate: new Date(),
						    onClose : function( selectedDate ) { 
			                      if( selectedDate != "" ) {
			                        
			                          $("#datepicker1").datepicker("option", "maxDate", $("#datepicker2").val());
			                          $("#datepicker2").datepicker("option", "minDate", $("#datepicker1").val());
			                      }
			                  } // 데이터 피커를 닫을때 각 날짜값을 받아 maxDate와   mainDate를 설정해준다 날짜 btewen 값이 틀어지는 것을 막기위함 

						    
						  });
						
						  $(function() {	  
							$("#datepicker1").datepicker();
						 	$("#datepicker2").datepicker();
						  });
						  
						  
						
						  
						  
						
						</script>
						

	
</body>
</html>