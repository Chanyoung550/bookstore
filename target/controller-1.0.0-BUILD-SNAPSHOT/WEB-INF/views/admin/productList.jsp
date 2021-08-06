<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                     <p>도서 목록</p>
                  </div>
                  <br>
                  <div id="main_content_1">
                     <table class="table table-hover">
                     <colgroup>
					        <col width="5%"/>
					        <col width="10%"/>
					        <col width="10%"/>
					        <col width="5%"/>
					        <col width="20%"/>					   
					    </colgroup>                   
                        <thead>
                           <tr class="table-success">
                              <th scope="col">도서 제목</th>
                              <th scope="col">작가</th>
                              <th scope="col">출판년도</th>
                              <th scope="col">재고</th>
                              <th scope="col">재고 추가</th>                                                        
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${list}" var="list" varStatus="vs">
                              <tr id="">
                                 <th>${list.bk_name}</th>
                                 <th>${list.bk_writer}</th>
                                 <th>${list.bk_pdate}</th>
                                 <th>${list.bk_stock}</th>                           
                                 <th><form id="addSt" method="get">   
                                    <input type="hidden" id="bk_num${vs.getIndex()}" name="bk_num" value="${list.bk_num }">
                                    <input type="text" id="stockAdd${vs.getIndex()}" name="stockAdd">개
                                     <input type="button" class="btn btn-outline-secondary" id="add${vs.getIndex()}" value="추가">
                                     <input type="button" class="btn btn-outline-secondary" id="delete${vs.getIndex()}" value="삭제">
                                 
                                 </form></th>
                              </tr>
                        <script>
                           //도서 재고 추가 이벤트         
                           $(document).ready(function(e){
                              const aa = ${vs.getIndex()};
                               
                              $("#add${vs.getIndex()}").click(function(){
                                 const stockAdd = $('#stockAdd${vs.getIndex()}').val();
                                 const bkNum = $('#bk_num${vs.getIndex()}').val();
                                 console.log("stockAdd : "+stockAdd);
                                   console.log("bkNum : "+bkNum);
                           
                                   $.ajax({         
                                       url: "/admin/stockAdd",
                                       type: "GET",
                                       data:{
                                       "stockAdd" : stockAdd,
                                       "bk_num" : bkNum         
                                    },
                                    success: function(data) {
                                       alert('재고추가완료')
                                       location.reload();
                                    }
                                 });
                              }); 
                              
                              $("#delete${vs.getIndex()}").click(function(){
                              
                                 const bkNum = $('#bk_num${vs.getIndex()}').val();
                                 
                                   console.log("bkNum : "+bkNum);
                           
                                   $.ajax({         
                                       url: "/admin/delBook",
                                       type: "GET",
                                       data:{                                    
                                       "bk_num" : bkNum         
                                    },
                                    success: function(data) {
                                       alert('삭제 완료')
                                       location.reload();
                                    }
                                 });
                              });
                           
                           });
                        </script>
                     </c:forEach>
                      </tbody>
                 </table>
                 
                  </div>
               
  
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

               <option value="title">제목</option>

               <option value="writer">작가</option>            

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
   
   </div>
   
	<script type="text/javascript">
	
	      function fn_prev(page, range, rangeSize) {                           
	               var page = ((range - 2) * rangeSize) + 1;                           
	               var range = range - 1;                           
	               var url = "${pageContext.request.contextPath}/admin/productList";
	               url = url + "?page=" + page;
	               url = url + "&range=" + range;
	               location.href = url;
	            }
	           //페이지 번호 클릭
	            function fn_pagination(page, range, rangeSize, searchType, keyword) {
	               var url = "${pageContext.request.contextPath}/admin/productList";
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
	               var url = "${pageContext.request.contextPath}/admin/productList";
	               url = url + "?page=" + page;
	               url = url + "&range=" + range;
	               location.href = url;
	            }
	      		 //검색 버튼 이벤트
	         $(document).on('click', '#btnSearch', function(e){
	            e.preventDefault();
	            var url = "${pageContext.request.contextPath}/admin/productList";
	            url = url + "?searchType=" + $('#searchType').val();
	            url = url + "&keyword=" + $('#keyword').val();
	            location.href = url;
	            console.log(url);
	         });
	         
	  </script>
                           
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



</html>