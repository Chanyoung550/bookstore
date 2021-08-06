<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!--  CSS Link -->
<link rel="stylesheet" href="resources/css/loginMain.css">
<!-- Bootstrap CSS Link -->
<link rel="stylesheet" href="resources/bootstraps/css/bootstrap.css">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="770076919086-eq6fgbjuq59078luff512ol07ifc52h8.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

</head>
<body>
	<div id="main">
		<div class="main_title">
			<div class="book_logo mt-5 mb-2" style="    width: 280px;">
	               <a href="/main"> <img src="/resources/img/bk_store2.png" alt="">
	               </a>
	            </div>
			<!-- 로그인 -->
			<form class="login__input" action="/login" method="post"
				id="loginFrm" name="loginFrm">
				<div class="form-group">
					<label class="form-label mt-4">로그인</label>
					<div id="main_id" class="form-floating mb-3">
						<input type="text" name="memberId" class="form-control"
							id="login_id" placeholder="ID"> <label
							for="floatingInput">아이디</label><!-- 아이디를 입력하는 텍스트 창. -->
					</div>
					<div id="main_pw" class="form-floating">
						<input type="password" name="memberPw" class="form-control"
							id="login_pw" placeholder="PW"> <label
							for="floatingPassword">비밀번호</label><!-- 비밀번호를 입력하는 텍스트 창. -->
					</div>
					  <a href="https://kauth.kakao.com/oauth/authorize?client_id=22968e372ff6eb359a4c50fa6ac2ad49&redirect_uri=http://localhost:8080/kakaoLogin&response_type=code">
           				 <img src="resources/img/kakao_login_medium_narrow.png" style="margin: 20px">
     			      </a>
     			      <div style="margin-left: 20px; margin-bottom: 10px" id="button" class="g-signin2" data-onsuccess="onSignIn"></div>
     			     
					<c:if test="${not empty cookie.user_check}">
						<c:set value="checked" var="checked" />
					</c:if>
				</div>
			</form>
			<a href="/idsearch"> <span class="badge bg-dark" style="margin-top: 10px">아이디찾기</span></a><br /><!-- 아이디를 찾기위한 태그 -->
			<a href="/passearch"> <span class="badge bg-dark">비밀번호찾기</span></a><!-- 비밀번호를 찾기위한 태그 -->
			<div class="join_btn">
				<a href="/join">
					<button type="button" class="btn btn-primary">회원가입</button><!-- 회원가입 페이지로 이동 -->
				</a>
					<button type="button" id="loginBtn" class="btn btn-danger">로그인</button><!-- form태그에서 가져온 아이디/비밀번호를 확인 후 메인페이지로 이동 -->
				<br /> <br />
			</div>
		</div>
	</div>

	
	<script>
	  function onSignIn(googleUser) {
		
		  var profile = googleUser.getBasicProfile();
	    
	    var profile;
	    var email;
	    var userName;
	    
	    email =  profile.getEmail();
	    userName = profile.getName();

	    console.log("email: " + email);
	    console.log('userName: ' + userName);
	    
	    $.ajax({			
			url: "googleLogin",
			type: "POST",
			data:{
				"email" : email,						      
				"userName" : userName    
													
		},
		success: function(data) {
			console.log("data: " + data);
			
			if(data === "suc") {		
			alert("로그인 성공.");
			
			location.href="main";
			}
				}
	    
		});
	 

	  }

	</script>

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

<script>
	$(document).ready(function() {

		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		var key = getCookie("key");
		$("#login_id").val(key);

		if ($("#login_id").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
			$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}

		$("#idSaveCheck").change(function() { // 체크박스에 변화가 있다면,
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
				setCookie("key", $("#login_id").val(), 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("key");
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("#login_id").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				setCookie("key", $("#login_id").val(), 7); // 7일 동안 쿠키 보관
			}
		});

	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>

<script>
	$(function() {

		let chk1 = false;
		let chk2 = false;
		$('#login_id').on('keyup', function() {
			if ($('#login_id').val() === "") {
				chk1 = false;
			} else {
				chk1 = true;
			}
		});
		$('#login_pw').on('keyup', function() {
			if ($('#login_pw').val() === "") {
				chk2 = false;
			} else {
				chk2 = true;
			}
		});

		$('#loginBtn').click(function(e) {//#loginBtn 클릭시 실행.

			console.log("check 통과 - true");

			if (chk1 && chk2) {//아이디, 비밀번호가 입력되어 있으면 실행.

				console.log("if 진입");

				const user_id = $('#login_id').val();//아이디 텍스트창에 value값을 변수에 저장.
				const user_pw = $('#login_pw').val();//비밀번호 텍스트창에 value값을 변수에 저장.

				const userInfo = {//json객체에 담기.
					user_id : user_id,//변수에 저장된 유저아이디.
					user_pw : user_pw//변수에 저장된 패스워드.
				};

				$.ajax({
					type : "POST",//post방식으로 전달.
					url : "/loginCheck",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					data : JSON.stringify(userInfo),//json.stringfy타입으로 userInfo에 저장된 값을 전달.
					dataType : "text",//반환되는 타입은 text
					success : function(result) {//ajax가 성공하면 실행.
						console.log(result);
						const resultSet = $.trim(result);//전달된 result값의 띄어쓰기 없애기
						console.log("resultSet:" + resultSet);

						if (resultSet === "idFail") {//result값이 idFail이면 실행
							$('#login_id').focus();
							alert('아이디/패스워드가 틀렸습니다.')//alert실행.

						} else if (resultSet === "loginSuccess") {//result값이 loginSuccess면 실행.
							$('#loginFrm').submit();//form 태그 실행.
						}
					}

				});

			} else {//아이디, 비밀번호가 입력되어있지 않으면 실행.
				alert('입력 정보를 다시 확인하세요');
			}
		});
	});
</script>
</html>