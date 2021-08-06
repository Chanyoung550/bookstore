<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! Book Store!</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="../resources/css/admin/bookList.css">
<script integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
      crossorigin="anonymous"></script>
<script src="../resources/js/admin/authorList.js" type="text/javascript"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
<script src="../resources/bootstraps/css/bootstrap.css"></script>
</head>
<body>
   <div id="wrap">
      <!-- 상단부(로고, 검색창, 로그인창) -->
      <div id="main" class="categories-section mt-3">
         <div id="main_wrap" class="container">
      			<div class="book_logo mt-5 mb-2" style="    width: 280px;">
	               <a href="/main"> <img src="/resources/img/bk_store2.png" alt="">
	               </a>
	            </div>
            <div id="main_subject">
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
                     <p>회원 리스트</p>
                  </div>
                  <div id="main_content_1">
                     <table class="table table-hover" style="margin-top: 25px">
                        <colgroup>
                           <col width="2px">
                        </colgroup>
                        <thead>
                           <tr class="table-success">
                              <th scope="col">아이디</th>                              
                              <th scope="col">이름</th>
                              <th scope="col">전화번호</th>
                              <th scope="col">가입일</th>
                              <th scope="col">보유 포인트</th>                              
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${list}" var="list" varStatus="vs">
                              <tr id="">
                                 <th>${list.user_id}</th>                                 
                                 <th>${list.user_name}</th>
                                 <th>${list.user_phone}</th>
                                 <th>${list.user_regidate}</th>
                                 <th><fmt:formatNumber value="${list.user_point}" pattern="#,###"/></th>                                 
                              </tr>
                        <script>
                           //이전 버튼 이벤트                           
                           function fn_prev(page, range, rangeSize) {                           
                                 var page = ((range - 2) * rangeSize) + 1;                           
                                 var range = range - 1;                           
                                 var url = "${pageContext.request.contextPath}/admin/memberList";
                                 url = url + "?page=" + page;
                                 url = url + "&range=" + range;
                                 location.href = url;
                              }
                             //페이지 번호 클릭
                              function fn_pagination(page, range, rangeSize, searchType, keyword) {
                                 var url = "${pageContext.request.contextPath}/admin/memberList";
                                 url = url + "?page=" + page;
                                 url = url + "&range=" + range;
                                 url = url + "&searchType=" + searchType;
                                 url = url + "&keyword=" + keyword;
                                 location.href = url;   
                              }
                              //다음 버튼 이벤트
                         function fn_next(page, range, rangeSize) {
                                  var page = parseInt((range * rangeSize)) + 1;
                                 var range = parseInt(range) + 1;
                                 var url = "${pageContext.request.contextPath}/admin/memberList";
                                 url = url + "?page=" + page;
                                 url = url + "&range=" + range;
                                 location.href = url;
                              }
                           //검색 버튼 이벤트
                           $(document).on('click', '#btnSearch', function(e){
                              e.preventDefault();
                              var url = "${pageContext.request.contextPath}/admin/memberList";
                              url = url + "?searchType=" + $('#searchType').val();
                              url = url + "&keyword=" + $('#keyword').val();
                              location.href = url;
                              console.log(url);
                           });
                        
                        </script>
                     </c:forEach>
                      </tbody>
                 </table>
                  </div>
               
                  
					<!-- paging -->
					 <ul class="pagination justify-content-center" >
                     <c:if test="${pagination.prev}">
                        <li class="page-item"><a class="page-link" href="#"
                           onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
                     </c:if>
                     <c:forEach begin="${pagination.startPage}" end="${pagination.endPage }" var="idx">
                        <li
                           class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
                           class="page-link" href="#"
                           onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchType }','${pagination.keyword }')">
                              ${idx} </a></li>
                     </c:forEach>
                     <c:if test="${pagination.next}">
                        <li class="page-item"><a class="page-link" href="#"
                           onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
                     </c:if>

                  </ul>

               </div>

       <!-- search -->          
      <div style="margin-left: 430px; margin-top: 50px; margin-bottom: 100px">

         <div class="w100 float_left" style="padding-right:10px; float:left;">

            <select class="form-control form-control-sm" name="searchType" id="searchType">

               <option value="userID">유저 아이디</option>

               <option value="user_name">유저 이름</option>            

            </select>

         </div>

         <div class="w300  float_left" style="padding-right:10px; float:left;">

            <input type="text" class="form-control form-control-sm" name="keyword" id="keyword" >

         </div>

         <div class="float_left" style=" float:left;">

            <button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>

         </div>
         <div class="clear_fix" style="clear:both;"></div>
      </div>

      <!-- search{e} -->

            </div>
         </div>
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
	
	<jsp:include page="../include/footerBox.jsp"></jsp:include>



   </div>


</body>





</html>