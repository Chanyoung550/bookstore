<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<link rel="stylesheet" href="../resources/css/myRoom/modify.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="../resources/js/myRoom/modify.js" type="text/javascript"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
<script src="../resources/bootstraps/css/bootstrap.css"></script>




</head>
<body>
<div id="wrap">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="main" class="mt-3">
		<div id="main_wrap">
		<div id="main_subject">
			<p>마이페이지</p>
		</div>
			<!-- 메인 네비게이션 -->
		<jsp:include page="../include/mypage_menu.jsp"></jsp:include>
			<!-- 메인  컨텐츠-->
			<div id="main_content_wrap">
				<div id="main_content">
					<div id="main_content_subject">
						<p>비밀번호 변경</p>
					</div>
					<div id="main_content_1">
						<div id="main_content_1_1">
							 <!--회원가입 인풋-->
		                        <form class="login__input" action="/mypage/modify" method="post" id="signFrm" name="signFrm">
			                        
			                        	<label class="form-label mt-4">아이디</label>
			                        	<div class="col-sm-10">
			                            <input type="text" class="form-control" name="user_id" placeholder="유저네임" required="required"id="user_id" value="${login.user_id }" readonly="readonly">
			                            </div>
			                            <label class="form-label mt-4">패스워드</label>
			                        	<div class="col-sm-10">
			                            <input class="form-control" type="password" name="user_pw" placeholder="패스워드" required="required"id="user_pw">
			                            </div>
			                            <label class="form-label mt-4">이름</label>
			                        	<div class="col-sm-10">
			                            <input class="form-control" type="text" name="user_name" placeholder="이름" required="required"id="user_name" value="${login.user_name }" >
			                            </div>
			                            <label class="form-label mt-4">핸드폰 번호</label>
			                        	<div class="col-sm-10">
			                            <input class="form-control" type="text" name="user_phone" placeholder="핸드폰 번호"required="required" id="user_phone" value="${login.user_phone }">
			                            </div>
			                            <label class="form-label mt-4">주소지</label>
			                        	<div class="col-sm-10">
			                            <input class="form-control" type="text" name="user_addr" placeholder="주소지"required="required" id="user_addr" value="${login.user_addr }">
			                            </div>
			                            <br>
			                            <div class="col-sm-10" style="align-content: center;">			                            
			                            <input class="btn btn-lg btn-primary" type = "submit" id = "signUp" value = "회원정보수정">
			                      		</div>
		                        </form>
		                        <!--회원가입 인풋end-->
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

	
</body>
</html>