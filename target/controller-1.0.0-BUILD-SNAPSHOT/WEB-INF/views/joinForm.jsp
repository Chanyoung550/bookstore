<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Photogram</title>
<!--  CSS Link -->
<link rel="stylesheet" href="resources/css/join.css">
<!-- Bootstrap CSS Link -->
<link rel="stylesheet" href="resources/bootstraps/css/bootstrap.css">
</head>
<body>

	<div class="main_title">
		<div class="container">
			<main class="loginMain">
				<!--회원가입섹션-->
				<section class="login">
					<article class="login__form__container">
	
						<!--회원가입 폼-->
						<div class="login__form">
							<!--로고-->
							<div class="book_logo mt-5 mb-2" style="    width: 280px;">
	               <a href="/main"> <img src="/resources/img/bk_store2.png" alt="">
	               </a>
	            </div>
							<!--로고end-->
							<!--회원가입 인풋-->
							<form class="login__input" action="/join" method="post" id="signFrm" name="signFrm">
							<!-- <input type="text" name="user_id" placeholder="유저네임" required="required" id="user_id"> -->
								<div id="main_id" class="form-floating mb-3">
									<input type="text" name="user_id" class="form-control"  required="required"  id="user_id"  placeholder="ID">
									<label for="floatingInput">아이디</label>
								</div>
								<!-- <input type="button" id="check" value="중복체크"> -->
								<button type="button"  id="check" value="중복체크" class="btn btn-success">중복체크</button>
								<br />
								
								<!-- <input type="password" name="user_pw" placeholder="패스워드" required="required"	id="user_pw"> -->
								<br />
								<div id="main_pw" class="form-floating">
									<input type="password" name="user_pw" class="form-control" id="user_pw" placeholder="PW" required="required">
									<label for="floatingPassword">비밀번호</label>
								</div>
								
								
								<!-- <input type="text" name="user_name" placeholder="이름" required="required" id="user_name"> -->
								<br />
								<div id="main_pw" class="form-floating">
									<input type="text" name="user_name" class="form-control" id="user_name" placeholder="NAME" required="required">
									<label for="floatingInput">이름</label>
								</div>
								
								<!-- <input type="text" name="user_phone" placeholder="핸드폰 번호" required="required" id="user_phone"> -->
								<br />
								<div id="main_pw" class="form-floating">
									<input type="text" name="user_phone" class="form-control" id="user_phone" placeholder="PW" required="required">
									<label for="floatingInput">전화번호</label>
								</div>
								
								<br />
								<div class="form-floating mb-3">
									<div id="mail_sign" class="form-floating mb-3">
										<input type="text" name="user_email" class="form-control" id="user_email" placeholder="PW" required="required">
										<label for="floatingInput">이메일 </label>
									</div>
									<button type="button" id="mail_check" value="이메일인증받기" class="btn btn-success">메일인증</button>
								</div>
								<div id="mail_sign_ch" class="form-floating mb-3 d-none">
									<input type="text" class="form-control mb-3" id="user_mail_check" placeholder="PW" required="required">
									<label for="floatingInput">인증번호 입력  </label>
									<button type="button" id="mail_num_sign" value="인증번호확인" class="btn btn-success">인증번호확인</button>
								</div>
								<br />
								<!-- <input type="button" id="signUp" value="회원가입"> -->
								<button type="button" class="btn btn-primary" id="signUp" value="회원가입">회원가입</button>
							</form>
							<!--회원가입 인풋end-->
						</div>
						<!--회원가입 폼end-->
						<br/>
						<!--계정이 있으신가요?-->
						<div class="login__register">
							<span>계정이 있으신가요?</span>
							<a href="/login">
								<button type="button" id="loginBtn" class="btn btn-danger">로그인</button>
							</a>
						</div>
					</article>
				</section>
			</main>
		</div>
	</div>
	

	<!-- Option 1: Bootstrap Bundle with Popper -->
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
</body>
<script type="text/javascript">
	$(document).ready(function(e) {

		var idx = false;
		var check_main_num ;
		var check_main_num_ck;
		var check_same_mail;
		
		
		$('#signUp').click(function() {
			if ($.trim($('#user_id').val()) == "") {//아이디 텍스트가 비어있으면 실행.
				alert("아이디 입력.");
				$('#user_id').focus();
				return;
			} else if ($.trim($('#user_pw').val()) == '') {//비밀번호 텍스트가 비어있으면 실행.
				alert("패스워드 입력.");
				$('#user_pw').focus();
				return;
			} else if ($.trim($('#user_phone').val()) == '') {//폰번호 텍스트가 비어있으면 실행.
				alert("핸드폰 입력.");
				$('#user_phone').focus();
				return;
			} else if (check_main_num_ck == '' || check_main_num_ck == null) {//메일인증이 안되어 있으면 실행.
				alert("이메일 인증을해주세요.");
				$('#user_mail').focus();
				return;
			} else if ($.trim($('#user_name').val()) == '') {//이름 텍스트가 안되어 있으면 실행.
				alert("이름 입력.");
				$('#user_name').focus();
				return;
			} else if ($("#user_email").val() != check_same_mail ) {//메인인증이 실패하면 실행.
				alert("인증한 메일과 현재 이메일이 같지 않습니다 확인 부탁드립니다.");
				$('#user_mail').focus();
				return;
			}
			
			if (idx == false) {//아이디가 중복체크가 안되더있으면 실행.
				alert("아이디 중복체크를 해주세요.");
				return;
			} else {//전부다 완료되었으면 실행.
				$('#signFrm').submit();
			}
		});
		
		//아이디 중복체크
		$('#check').click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/idCheck",
				type : "GET",//get방식
				data : {
					"user_id" : $('#user_id').val()//유저아이디 텍스트창에 있는 value값을 변수에 저장.
				},
				success : function(data) {
					if (data == 0 && $.trim($('#user_id').val()) != '') {//유저아이디가 중복되지 않으면 실행.
						idx = true;
						alert("사용 가능한 아이디 입니다.")
					} else {//유저아이디가 중복되었으면 실행.
						alert("사용 불가능한 아이디 입니다.")
					}
				},
				error : function() {//ajax에러가 발생한 경우 실행.
					alert("서버에러");
				}
			});
		});
	


	/* 인증번호 이메일 전송 */
	$("#mail_check").click(function(){
		var email = $("#user_email").val();      
		var cehckBox = $("#mail_sign");        // 인증번호 입력란
		var boxWrap = $(".mail_check_input_box");   // 인증번호 입력란 박스
		check_same_mail = $("#user_email").val();
		
		if(email == '') {
			alert("이메일 확인 부탁드립니다.");
			$('#user_mail').focus();
			
			return false;
		}
		
		
		$("#mail_check").slideUp();
   		$("#mail_sign_ch").removeClass("d-none");
   		
   		
   		
   		
		$.ajax({
	        
	        type : "GET",
	        url : "${pageContext.request.contextPath}/emailCheck?email=" + email ,
	       	success:function(data){
	       		//console.log("data : " + data);
	       		
	       		check_main_num = data;
	       	}
	                
	    });
	    
	    
	});
	
	/* 인증번호 이메일 전송 */
	$("#mail_num_sign").click(function(){
		
		if(check_main_num == $("#user_mail_check").val()) {
			alert("인증완료");
			check_main_num_ck = "mail_check";
		}else {
			alert("인증번호 오류");
		}
			
	    
	});

});
</script>
</html>