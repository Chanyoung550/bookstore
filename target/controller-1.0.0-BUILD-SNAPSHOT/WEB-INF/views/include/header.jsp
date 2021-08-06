<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="/resources/css/include/searchBox.css">
<meta name="description" content="Phozogy Template">
<meta name="keywords" content="Phozogy, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="770076919086-eq6fgbjuq59078luff512ol07ifc52h8.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<style>

header {
   margin: 0 auto;
}

#top_mini_1>ul>li {
   display: inline-block;
   box-sizing: border-box;
   padding: 20px 8px 30px;
}
 
#top_mini_1>ul>li>a {
   font-size: 13px;
   color: #000;
   font-weight: 100;
   display: block;
   padding: 14px 6px 14px 6px;
}

#top_mini_1 {
   width: auto;
   margin: auto;
   clear: both;
   position: absolute;
   right: 0;
   top: 0;
}

#top_mini_1>ul {
   float: right;
   list-style: none;
   position: relative;
   width: 100%;
}

#top_1_logo_1 {
   width: 100%;
   text-align: center;
   padding-top: 7px;
}

#top_1_logo_1 {
   width: 100%;
}

.book_logo {
   text-align: center;
}
.nav-menu {
    float: left;
    /* text-align: center; */
    /* margin: auto; */
    amrgin: 0 auto;
    margin-left: 200px;
}
.book_logo {
    text-align: left;
    margin-left: 200px;
}
    
</style>

<!-- Google Font -->
<link
   href="https://fonts.googleapis.com/css?family=Quantico:400,700&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700&display=swap"
   rel="stylesheet">

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="resources/bootstraps/css/bootstrap.min.css"
   type="text/css">
<link rel="stylesheet"
   href="resources/bootstraps/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="resources/bootstraps/css/elegant-icons.css"
   type="text/css">
<link rel="stylesheet"
   href="resources/bootstraps/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet"
   href="resources/bootstraps/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="resources/bootstraps/css/slicknav.min.css"
   type="text/css">
<link rel="stylesheet" href="resources/bootstraps/css/style.css"
   type="text/css">



<!-- Header Section Begin -->
<header class="header-section">
   <div class="container-fluid">
      <div class="row">
         <div class="col-lg-12">
         	<div class="row">
	            <div class="book_logo mt-5 mb-2" style="    width: 280px;">
	               <a href="/main"> <img src="/resources/img/bk_store2.png" alt="">
	               </a>
	            </div>
	            <form action="/search" method="get" style="margin: 110px 0 0 180px;">
	               <div id="top_1_selection_1_search">
	            
	                  <div class="keyword_box">
	                  	<!-- 검색할 타입을 선택할수있는 option -->
	                     <select name="searchType" id="searchType">
	                        <option value="title">제목 검색</option>
	                        <option value="content">작가 검색</option>
	                     </select> <input type="text" name="keyword" class="keyword" id="keyword"><!-- 검색하는 키워드를 담을 텍스트 -->
	                     <input type="submit" value="검색" class="key_btn" id="btn_Search"><!-- 검색버튼 -->
	            
	                  </div>
	                  <div class="clearfix"></div>
	               </div>
	            </form>
            .</div>

				<nav class="nav-menu mobile-menu">
					<ul>
						<!-- 카테고리 검색 -->
						<li class="active"><a href="#">Category</a>
							<ul class="dropdown">
								<li><a href="/search?cateCode=1">소설</a></li>
								<li><a href="/search?cateCode=2">시/에세이</a></li>
								<li><a href="/search?cateCode=3">경제/경영</a></li>
								<li><a href="/search?cateCode=4">자기계발</a></li>
								<li><a href="/search?cateCode=5">인문</a></li>
								<li><a href="/search?cateCode=6">역사/문화</a></li>
								<li><a href="/search?cateCode=7">종교</a></li>
								<li><a href="/search?cateCode=8">정치/사회</a></li>
								<li><a href="/search?cateCode=9">예술/대중문화</a></li>
								<li><a href="/search?cateCode=10">과학</a></li>
								<li><a href="/search?cateCode=11">기술/공학</a></li>
								<li><a href="/search?cateCode=12">컴퓨터/IT</a></li>
							</ul></li>
						<li><a href="/search?best=1">Best</a></li><!-- 베스트셀러 검색 -->
                 		<li><a href="/search?newbook=1">New</a></li><!-- 신간도서 검색 -->
					</ul>
				</nav>
				<!-- 로그인 회원가입 마이페이지 -->
				<div id="top_mini_1">
					<ul class="clearfix">
						<!-- 로그인이 되어있지 않으면 실행. -->
						<c:if test="${login==null }">	
							<li><a href="/login">로그인</a></li><!-- 로그인 페이지로 이동. -->
							<li><a href="/join">회원가입</a></li><!-- 회원가입 페이지로 이동. -->
						</c:if>
						<!-- 로그인이 외어있으면 실행. -->
						<c:if test="${login!=null }">
							<li><p>${login.user_name}님</p></li><!-- 유저이름 출력. -->
							<li><p id="userrank"></p></li><!-- user등급 출력 -->
							<li><a href="/mypage/paylist">보유포인트 : ${login.user_point }</a></li><!-- 유저포인트 출력 -->
							<li><a href="/mypage/cart">마이페이지</a></li><!-- 마이페이지로 이동. -->
							<c:set var="String" value="${login.user_id }"/>
							<c:choose>
							<c:when test="${fn:contains(String, 'gmail')}">
								<li><a href="#" onclick="signOut();">로그아웃</a></li>
							</c:when>
							<c:otherwise>
							<li><a href="/logout">로그아웃</a></li>
							</c:otherwise>
							</c:choose>
							<!-- 관리자 로그인일 경우 실행. -->
							<c:if test="${login.user_grade==1 }">
								<li><a href="/admin/product">관리자 페이지</a></li>
							</c:if>
						</c:if>
					</ul>
					<script type="text/javascript">
						  function onLoad() {
						      gapi.load('auth2', function() {
						        gapi.auth2.init();
						      });
						    }  
						
						  function signOut() {
							    var auth2 = gapi.auth2.getAuthInstance();
							    auth2.signOut().then(function () {
							    	location.href="logout";
							    });
							    auth2.disconnect();  
							    
							  /*  gapi.auth2.getAuthInstance().disconnect();
							    location.href="logout" */
							  }
					</script>	
					<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
					
					<!-- 로그인 회원가입 마이페이지 -->
					<div id="mobile-menu-wrap"></div>
				</div>
			</div>
		</div>
	</div>
</header>
<script>
	//세션에 있는 유저 등급을 user_grade함수에 넣어 가져온 result값을  #userrank의 text에 넣어줌.
   $(document).ready(function(){ 
      var grade = ${login.user_rank };
      var usergrade = user_grade(grade);
      $('#userrank').text(usergrade);
   });
</script>
<script>//값을 받아 받은 값의 result값을 전달해주는 함수
   function cateSwitch(val) {
      var result = "";
      switch(val){
         case 1:
            result = "소설";
            break;
         case 2:
            result = "시/에세이";
            break;
         case 3:
            result = "경제/경영";
            break;
         case 4: 
            result = "자기계발";
            break;
         case 5: 
            result = "인문";
            break;
         case 6: 
            result = "역사/문화";
            break;
         case 7: 
            result = "종교";
            break;
         case 8: 
            result = "정치/사회";
            break;
         case 9: 
            result = "예술/대중문화";
            break;
         case 10: 
            result = "과학";
            break;
         case 11: 
            result = "기술/공학";
            break;
         case 12: 
            result = "컴퓨터/IT";
            break;
      }
      return result;
   }
</script>
<script>//값을 받아 받은 값의 result값을 전달해주는 함수
   function user_grade(val) {
      var result = "";
      switch(val){
         case 0:
            result = "일반";
            break;
         case 1:
            result = "VIP";
            break;
         case 2:
            result = "VVIP";
            break;
      }
      return result;
   }
</script>
<!-- Header End -->