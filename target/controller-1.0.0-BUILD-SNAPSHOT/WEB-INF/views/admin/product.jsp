
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! Book Store!</title>
<link rel="stylesheet" href="../resources/css/admin/bookEnroll.css">
<link rel="stylesheet" href="../resources/bootstraps/css/bootstrap.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="../resources/js/admin/bookEnroll.js" type="text/javascript"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
<script src="../resources/bootstraps/css/bootstrap.css"></script>





</head>
<body>
<div id="wrap_">
	<!-- 상단부(로고, 검색창, 로그인창) -->

	
	<div id="main" class="categories-section mt-3">
		<div id="main_wrap" class="container">
		<div class="book_logo mt-5 mb-2" style="    width: 280px;">
	               <a href="/main"> <img src="/resources/img/bk_store2.png" alt="">
	               </a>
	            </div>
		<div id="main_subject" >
			<p>관리자페이지</p>
		</div>
			<!-- 메인 네비게이션 -->
         	<div id="side_menu">
				<jsp:include page="../include/admin_menu.jsp"></jsp:include>
			</div>
			<!-- 메인  컨텐츠-->
			<div id="main_content_wrap">
				<div id="main_content">
					<div id="main_content_subject">
						<p>상품 등록</p>
					</div>
					<form id="book_reg" method="post" enctype="multipart/form-data" action="/admin/bregister">						
						<div id="main_content_1">
							<span id="main_content_1_1" class="col-sm-2 col-form-label" >Title</span>
								<div class="col-sm-7">
									<input type="text" class="form-control" name="bk_name" id="title">
								</div>							
							<span id="main_content_1_1" class="col-sm-2 col-form-label" >Publisher</span>
							    <div class="col-sm-7">
							    <input type="text" class="form-control" name="bk_pblsher" id="publisher">
							    </div>
							<span id="main_content_1_1" class="col-sm-2 col-form-label">Author</span>
								<div class="col-sm-7">
								<input type="text" class="form-control" name="bk_writer" id="authorName">
								</div>							
							<span id="main_content_1_1" class="col-sm-2 col-form-label">BookStock</span> 
								<div class="col-sm-7">
								<input type="text" class="form-control" name="bk_stock" id="bookStock">
								</div>
							<span id="main_content_1_1" class="col-sm-2 col-form-label">Category</span> 
								<div class="col-sm-7"> 
								<select name="bk_category" id="cate" class="form-select">
									<option value="1">소설</option>
									<option value="2">시/에세이</option>
									<option value="3">경제/경영</option>
									<option value="4">자기계발</option>
									<option value="5">인문</option>
									<option value="6">역사/문화</option>
									<option value="7">종교</option>
									<option value="8">정치/사회</option>
									<option value="9">예술/대중문화</option>
									<option value="10">과학</option>
									<option value="11">기술/공학</option>
									<option value="12">컴퓨터/IT</option>
								</select>
								</div>
							<span id="main_content_1_1" class="col-sm-2 col-form-label">Publishing Date</span>
								<div class="col-sm-7">   
								<input type="text" class="form-control" name="bk_pdate" id="publeYear">
								<p>"oooo-oo-oo 형식으로 입력 해주십시오.</p>
								</div>							
							<span id="main_content_1_1" class="col-sm-2 col-form-label">Price</span>
								<div class="col-sm-7">   
							    <input type="text" name="bk_price" id="bookPrice" value="0" class="form-control">
								</div>
							<span id="main_content_1_1" class="col-sm-2 col-form-label">Contents</span>
								<div class="col-sm-7">   
								<textarea rows="" cols="" id="contents" name="bk_intro" class="form-control"></textarea>
								</div>
						</div>
						<div id="main_content_2"> 
							<span id="main_content_1_1" class="col-sm-2 col-form-label">BookCover</span>
							<div class="col-sm-7"> 
							<input type="file" name='file' id="input_img" class="form-control">
							</div>
							<div class='uploadResult'>
							 	<div class="upload-img">
                        			<img src="" alt="" id="img-preview" >
                   			    </div>
							</div>
							<div id="button_wrap" >
								<button id="signUp" class="btn btn-lg btn-primary">Register</a>
							</div>
						</div>
						</div>
					</form>
				</div>		
			</div>
			<div class="clearfix">
			</div>
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
	
</body>
<script type="text/javascript">

	   // 이미지 업로드 미리보기
	  $("#input_img").change(function(){
   	   if(this.files && this.files[0]) {
   	    var reader = new FileReader;
   	    reader.onload = function(data) {
   	     $("#img-preview").attr("src", data.target.result).width(400);        
   	    }
   	    reader.readAsDataURL(this.files[0]);
   	   }
   	  });
	
	     $(document).ready(function(e){
			
			var idx = false;
			
			$('#signUp').click(function(){
				if($.trim($('#title').val()) == ''){
					alert("제목을 입력해주세요.");
					$('#title').focus();
					return false;
				}else if($.trim($('#publisher').val()) == ''){
					alert("출판사를 입력해주세요.");
					$('#publisher').focus();
					return false;
				}else if($.trim($('#authorName').val()) == ''){
					alert("작가를 입력해주세요.");
					$('#authorName').focus();
					return false;
				}else if($.trim($('#bookStock').val()) == ''){
					alert("재고를 입력해주세요.");
					$('#bookStock').focus();
					return false;			
				}else if($.trim($('#publeYear').val()) == ''){
					alert("출판일을 입력해주세요.");
					$('#publeYear').focus();
					return false;
				}else if($.trim($('#bookPrice').val()) == ''){
					alert("도서가격을 입력해주세요.");
					$('#bookPrice').focus();
					return false;
				}else if($.trim($('#contents').val()) == ''){
					alert("도서내용을 입력해주세요.");
					$('#contents').focus();
					return false;
				}else {
					$('#book_reg').submit();
				}
				
			});
		}); 
		
	
	

</script>
</html>
