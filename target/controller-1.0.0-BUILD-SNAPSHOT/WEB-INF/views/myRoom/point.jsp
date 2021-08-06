<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<link rel="stylesheet" href="../resources/css/myRoom/modify.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
<script src="../resources/js/myRoom/modify.js" type="text/javascript"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
</head>
<body>
   <jsp:include page="../include/header.jsp"></jsp:include>
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
					<p>포인트 충전</p>
				</div>
               <div id="main_content_1">

                  <div id="main_content_1_1">
                     <!--회원가입 인풋-->
<%--                      <form class="login__input" action="/mypage/point" method="post" id="pointfrm">
                        <input type="hidden" name="user_id" id="user_id" value="${login.user_id }" readonly="readonly">
                        <input type="hidden" name="point_charge" id="" value="0">
                        <input type="hidden" name="point" id="point"> <br>
                        현재 포인트 : <strong id="defaultPoint" class="text-primary">${login.user_point }</strong>
                        <br><br>
                        충전하실 금액 : <input type="text" name="point_charge_sum" id="charge" value=""> <br>
                        <br>
                        충전 된 금액 : <input type="text" name="point_charge_sum" readonly="readonly" id="pointSum"> <br> <br>
                        <input type="submit" value="충전하기">
                     </form>
                     <input type="button" id="addpoint" value="카카오페이 충전"> --%>
                     <!--회원가입 인풋end-->
                     
                     
                     <form class="login__input" action="/mypage/point" method="post" id="pointfrm">
                        <input type="hidden" name="user_id" id="user_id" value="${login.user_id }" readonly="readonly">	<!-- 세션에 있는 유저아이디를 hidden값에 저장. -->
                        <input type="hidden" name="point_charge" id="point_charge" value="0">	<!-- 충전할 금액을 value값에 저장. -->
                        <input type="hidden" name="point" id="point"> <br>	<!-- 충전 후 유저가 가지고 있는 포인트를 value값에 저장. -->
                        현재 포인트 : <strong id="defaultPoint" class="text-primary">${login.user_point }</strong>
                        <br/>
                        
                          <label class="form-label mt-4" for="inputValid">충전하실 금액 </label>
                          <input type="text" value="" class="form-control is-valid"  id="charge"  name="point_charge_sum">
                          <!-- 충전할 금액을 입력하는 텍스트창. -->
                          
                          <label class="form-label mt-4" for="inputValid">충전 된 금액 </label>
                          <input type="text" value="" class="form-control is-valid"  readonly="readonly" id="pointSum" name="point_charge_sum">
                          <!-- 충전 후 보유한  금액을 볼수있는 텍스트창 -->
                          
                          <br/>
                          <input type="submit" class="btn btn-primary" value="충전하기"><!-- 단순 충전 버튼 -->
                     </form>
                     <br/>
                        <input type="button"  id="addpoint" class="btn btn-warning" value="카카오페이 충전"><!-- 카카오페이 충전 버튼 -->
                  </div>
                  
                  
                  
               </div>
               <script>
             	//#charge가 change이벤트가 실행되면 실행
                  $("#charge").change(function() {
                     var charge = $(this).val();//charge벨류값을 변수에 저장.
                     if (isNaN(charge)) {
                        alert("충전하실 금액은 숫자로만 입력 부탁드립니다.");
                        return false;//charge값이 숫자가 아니면 false값을 리턴.
                     }
                     charge = charge.replace(/,/g, "");//charge값에서 특수문자 삭제
                     $('#point_charge').val(charge);//#point_charge의 value값에 charge값을 넣어줌.
                     pointSum();//pointSum 함수를 호출
                  });

                  function pointSum() {
                     var defaultPoint = Number($("#defaultPoint").text());//#defaultPoint의 text값을 number로 형변환하여 변수에 저장.
                     var chargePoint = Number($('#point_charge').val());//#point_chargedml value값을 number로 형변환하여 변수에 저장.

                     $('#point').val(defaultPoint + chargePoint);//#point의 value값에 defaultPoint + chargePoint값을 넣어줌.
                     $('#pointSum').val(defaultPoint + chargePoint);//#pointSum의 value값에 defaultPoint + chargePoint값을 넣어줌.
                  };
               </script>
               <script>
                  $(function() {
                	  //#addpoint가 클릭되면 실행.
                     $('#addpoint').click(function() {
                         var userid = "${login.user_id}";//현재 세션에 저장되어 있는 유저아이디를 변수에 담음.
                         var pointCharge = $('#point_charge').val();//#point_charge의 value값을 변수에 담음.
                         var point = $('#point').val();//#point의 value값을 변수에 담음.
                         if (userid != "") {//로그인 체크
                            if (point != 0) {//충전할 포인트 체크
                               $.ajax({
                                  type : "POST",//post방식
                                  url : '/kakaopay',
                                  data : {
                                     userid : userid,//세션에 저장되어있는 아이디.
                                     pointCharge : pointCharge,//충전 할 포인트.
                                     point : point,//충전 후 포인트.
                                  },
                                  dataType : 'json',//json타입으로 반환.
                                  success : function(data) {//ajax 성공시 실행.
                                     var box = data.next_redirect_pc_url;
                                     window.open(box);//성공한경우 변수에 저장된 url실행.
                                  },
                                  error : function(error) {//ajax 실패시 실행.
                                     alert('error : ' + error);//실패한 경우 alert창 실행.
                                  }
                               });
                            } else {//충전할 포인트가 비어있는경우 실행.
                               alert('충전할 포인트를 입력해주세요.');
                            }
                         } else {//로그인이 되어있지 않을경우 실행.
                            alert('로그인을 해주세요.')
                         }
                      });
                  });
               </script>
            </div>
         </div>
         <div class="clearfix"></div>
      </div>
   </div>
   </div>

   <!-- footer -->
   <jsp:include page="../include/footerBox.jsp"></jsp:include>

</body>
</html>