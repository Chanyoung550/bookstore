<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							<div id="top_logo">
								<a><img src="resources/img/mcthe2.png"></a>
							</div>
							<c:if test="${myid != null}">
								<div>
									회원님의 아이디는 : <strong class=text-primary>${myid }</strong> 입니다
								</div>
							</c:if>
							
							<c:if test="${mypasid != null}">
								<form class="login__input" action="/pasupdate" method="post" id="pasFrm" name="pasFrm">
									<div>
										수정 할 비밀번호를 입력해주세요 
									</div>
									<div id="main_id" class="form-floating mb-3">
										<input type="text" name="user_id" class="form-control"  required="required"  id="user_id"  placeholder="ID" value="${mypasid }" readonly="readonly">
										<label for="floatingInput">아이디</label>
									</div>
									<div id="main_pw" class="form-floating mb-3">
										<input type="password" name="memberPw" class="form-control" id="login_pw" placeholder="PW">
										 <label for="floatingPassword">새 비밀번호</label>
									</div>
									<div id="main_pw_ch" class="form-floating mb-3">
										<input type="password" name="memberPw_ch" class="form-control" id="login_pw_ch" placeholder="PW"> 
										<label for="floatingPassword">새 비밀번호 확인</label>
									</div>
									<button type="button" class="btn btn-primary" id="pasUp" value="비빌번호변경">비빌번호변경</button>
								</form>
							</c:if>
							
							
							
						</div>
						<!--회원가입 폼end-->
						<br/>
						<!--계정이 있으신가요?-->
						<div class="login__register">
							<a href="/login">
								<button type="button" id="loginBtn" class="btn btn-danger">로그인하러 가기</button>
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
		
		
		$('#pasUp').click(function() {
			
			var user_id = $("#user_id").val();
			var user_pw = $("#login_pw").val();
			
			
			if ($("#login_pw").val() != $("#login_pw_ch").val() ) {
				alert("비밀번호가 같지 않습니다");
				$('#login_pw').focus();
				return;
			} 
		
			
			$.ajax({
		        
		        type : "POST",
		        url : "${pageContext.request.contextPath}/pasupdate",
		        data:  {
		        	"user_id" : user_id,
		        	"user_pw" : user_pw,
		        	
		        },
		       	success:function(data){
		       		alert("비밀번호가 변경 되었습니다 ");
		       		
		       		location.href="${pageContext.request.contextPath}/login";
		       	},
		       	error:function(request,status,error){
		            alert("서버 오류 다시 시도해주세요 ,"); // 실패 시 처리
		        }

		                
		    }); 
			
		});

	

});
</script>
</html>