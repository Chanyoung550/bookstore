<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%
	    String[] cateArray = {"소설", "시/에세이", " 경제/경영", "자기계발 ", "인문", " 역사/문화", " 종교", " 정치/사회", " 예술/대중문화", " 과학", " 기술/공학", " 컴퓨터/IT"};
	    pageContext.setAttribute("cateArray", cateArray);     
	  	
	    // owl슬라이드가 실행되기 이전에 실행되어야 하기 때문에 스크립트 문에서 jstl배열로 변경 
	%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<link rel="stylesheet" href="resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="resources/js/main.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="resources/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/slick-theme.css"/>

<script type="text/javascript" src="resources/js/slick.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="770076919086-eq6fgbjuq59078luff512ol07ifc52h8.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- 별점 style -->
<style>
	.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}


</style>

</head>
<body>

<!-- header인클루드 -->
<jsp:include page="include/header.jsp"></jsp:include>


<div id="main_contents">

	<div id="main_section" class="mt-3">
	
	
		<div id="main_container_">
			
		
			
		
			<section class="hero-section">
				<div id="slideWrap" class="carousel slide" data-ride="carousel">
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
					  </ol>
					  <!-- 광고 -->
					  <div class="carousel-inner owl-drag">
					    <div class="carousel-item active">
					      <a href="/detail?num=189"><img class="w-100" src="http://image.kyobobook.co.kr/ink/images/prom/2020/banner/200123/bnN_01.jpg"></a>
					    </div>
					    <div class="carousel-item">
					      <a href="/detail?num=190"><img class="w-100" src="http://image.kyobobook.co.kr/ink/images/prom/2020/banner/200221/bnA_a03.jpg"></a>
					    </div>
					    <div class="carousel-item">
					      <a href="/detail?num=191"><img class="w-100" src="http://image.kyobobook.co.kr/ink/images/prom/2020/banner/200221/bnA_a06.jpg"></a>
					    </div>
					     <div class="carousel-item">
					      <a href="/detail?num=188"><img class="w-100" src="http://image.kyobobook.co.kr/ink/images/prom/2020/banner/200123/bnN_03.jpg"></a>
					    </div>
					     <div class="carousel-item">
					      <a href="/detail?num=192"><img class="w-100" src="http://image.kyobobook.co.kr/ink/images/prom/2020/banner/200221/bnA_a04.jpg"></a>
					    </div>
					  </div>
					  <!-- 이전버튼 -->
					  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <!-- 다음버튼 -->
					  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
				</div>
			</section>
			
			
			<section class="categories-section mt-5">
				<div class="container">
					<div class="row mb-3">
						<div class="col-lg-6 col-md-6">
							<div class="section-title">
								<h2>베스트 셀러</h2>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="right-btn">
								<a href="#" class="primary-btn" style="color:#fff;">VIew all</a>
							</div>
						</div>
					</div>
					
					<div class="categories-slider owl-carousel" id="best_slide">
						<c:forEach items="${bestlist}" var="bestlist" varStatus="i"><!-- 베스트셀러를 순차적으로 출력 -->
							<div class="cs-item" >
								<a href="detail?num=${bestlist.bk_num}"><!-- 베스트셀러 책 번호를 가지고 상세페이지로 이동.-->
									<div class="cs-pic set-bg" ><img class="h-100" src="<c:out value="${bestlist.bk_thumbUrl}" />"></div><!-- 베스트셀러의 이미지 출력 -->
									<div class="cs-text">
										<h4>${bestlist.bk_name }</h4><!-- 베스트셀러의 책이름 출력 -->
										<span class="main2_1_box_con_cate " id="cate${i.getIndex() }">
											${cateArray[(bestlist.bk_category - 1 )] } <!-- 베스트셀러의 카테고리 출력 -->
										</span>
										<c:if test="${bestlist.bk_rank!=0}"><!-- 리뷰가 작성되어있으면 실행. -->
										<!-- 별점. -->
											<div class="starRev mt-1" id="revStar${i.getIndex() }" style="width:62%; margin:0 auto;">
												<div>
													<span class="starR1 d-inline-block <c:if test="${bestlist.bk_rank >= 0.5}">on</c:if>" id="star0" value="0.5">별1_왼쪽</span>
													<span class="starR2 d-inline-block <c:if test="${bestlist.bk_rank >= 1 }">on</c:if>" id="star1" value="1">별1_오른쪽</span>
													<span class="starR1 d-inline-block <c:if test="${bestlist.bk_rank >= 1.5 }">on</c:if>" id="star2" value="1.5">별2_왼쪽</span>
													<span class="starR2 d-inline-block <c:if test="${bestlist.bk_rank >= 2 }">on</c:if>" id="star3" value="2">별2_오른쪽</span>
													<span class="starR1 d-inline-block <c:if test="${bestlist.bk_rank >= 2.5 }">on</c:if>" id="star4" value="2.5">별3_왼쪽</span>
													<span class="starR2 d-inline-block <c:if test="${bestlist.bk_rank >= 3 }">on</c:if>" id="star5" value="3">별3_오른쪽</span>
													<span class="starR1 d-inline-block <c:if test="${bestlist.bk_rank >= 3.5 }">on</c:if>" id="star6" value="3.5">별4_왼쪽</span>
													<span class="starR2 d-inline-block <c:if test="${bestlist.bk_rank >= 4 }">on</c:if>" id="star7" value="4">별4_오른쪽</span>
													<span class="starR1 d-inline-block <c:if test="${bestlist.bk_rank >= 4.5 }">on</c:if>" id="star8" value="4.5">별5_왼쪽</span>
													<span class="starR2 d-inline-block <c:if test="${bestlist.bk_rank >= 5 }">on</c:if>" id="star9" value="5">별5_오른쪽</span>
												</div>
												<span class="d-inline-block">(${bestlist.bk_rank})</span>
												<input type="hidden" id="star_rank" value="${bestlist.bk_rank}">
											</div>
											
										</c:if>
										<c:if test="${bestlist.bk_rank==0}"><!-- 등록된 리뷰가 없으면 실행. -->
											<span>평점 없음</span>
										</c:if>
										<input type="hidden" id="catenum${i.getIndex() }" value="${bestlist.bk_category }">
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			
			
			
			
			
			
			<section class="categories-section mt-5">
				<div class="container">
					<div class="row mb-3">
						<div class="col-lg-6 col-md-6">
							<div class="section-title">
								<h2>신간</h2>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="right-btn">
								<a href="#" class="primary-btn" style="color:#fff;">VIew all</a>
							</div>
						</div>
					</div>
					
					<div class="categories-slider owl-carousel" id="best_slide">
						<c:forEach items="${list}" var="list" varStatus="i"><!-- 신간도서를 순차적으로 출력 -->
							<div class="new_box_list cs-item" >
								<a href="detail?num=${list.bk_num}"><!-- 책번호를 가지고 상세페이지로 이동. -->
									<div class="cs-pic set-bg" ><img class="h-100" src="<c:out value="${list.bk_thumbUrl}" />"></div><!-- 신간도서 이미지 출력. -->
									<div class="cs-text">
										<h4>${list.bk_name}</h4><!-- 신간도서 책이름 출력 -->
										<span class="main2_1_box_con_cate"id="newcate${i.getIndex() }" >
											${cateArray[(list.bk_category - 1 )] } <!-- 신간도서 카테고리 출력 -->
										</span>
										<span class="main2_1_box_con_year mb-2">${list.bk_pdate}</span><!-- 신간도서 출간일 출력 -->
										<input type="hidden" id="newcatenum${i.getIndex() }" value="${list.bk_category }">
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			
			
			
			
			<section class="categories-section mt-5 mb-5">
				<div class="container">
					<div class="row mb-3">
						<div class="col-lg-6 col-md-6">
							<div class="section-title">
								<h2>평점순</h2>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="right-btn">
								<a href="#" class="primary-btn" style="color:#fff;">VIew all</a>
							</div>
						</div>
					</div>
					
					<div class="categories-slider owl-carousel" id="best_slide">
						<c:forEach items="${ranklist}" var="ranklist" varStatus="i"><!-- 평점순서대로 출력 -->
							<div class="new_box_list cs-item" >
								<a href="detail?num=${ranklist.bk_num}"><!-- 책번호를 가지고 상세페이지로 이동. -->
									<div class="cs-pic set-bg" ><img class="h-100" src="<c:out value="${ranklist.bk_thumbUrl}" />"></div><!-- 평점순으로 이미지 출력 -->
									<div class="cs-text">
										<h4>${ranklist.bk_name }</h4><!-- 평점순대로 책제목 출력 -->
										<span class="main2_1_box_con_cate"id="newcate${i.getIndex() }" >
											${cateArray[(ranklist.bk_category - 1 )] } <!-- 카테고리 출력   -->
										</span>
										
										<!-- 리뷰가 작성되어있으면 실행. -->
										<c:if test="${ranklist.bk_rank!=0}">
										<!-- 별점 -->
											<div class="starRev mt-1" id="starRev${i.getIndex() }" style="width:62%; margin:0 auto;">
												<span class="starR1 <c:if test="${ranklist.bk_rank >= 0.5}">on</c:if>" id="star0" value="0.5">별1_왼쪽</span>
												<span class="starR2 <c:if test="${ranklist.bk_rank >= 1 }">on</c:if>" id="star1" value="1">별1_오른쪽</span>
												<span class="starR1 <c:if test="${ranklist.bk_rank >= 1.5 }">on</c:if>" id="star2" value="1.5">별2_왼쪽</span>
												<span class="starR2 <c:if test="${ranklist.bk_rank >= 2 }">on</c:if>" id="star3" value="2">별2_오른쪽</span>
												<span class="starR1 <c:if test="${ranklist.bk_rank >= 2.5 }">on</c:if>" id="star4" value="2.5">별3_왼쪽</span>
												<span class="starR2 <c:if test="${ranklist.bk_rank >= 3 }">on</c:if>" id="star5" value="3">별3_오른쪽</span>
												<span class="starR1 <c:if test="${ranklist.bk_rank >= 3.5 }">on</c:if>" id="star6" value="3.5">별4_왼쪽</span>
												<span class="starR2 <c:if test="${ranklist.bk_rank >= 4 }">on</c:if>" id="star7" value="4">별4_오른쪽</span>
												<span class="starR1 <c:if test="${ranklist.bk_rank >= 4.5 }">on</c:if>" id="star8" value="4.5">별5_왼쪽</span>
												<span class="starR2 <c:if test="${ranklist.bk_rank >= 5 }">on</c:if>" id="star9" value="5">별5_오른쪽</span>
												
												<input type="hidden" id="star_rank" value="${ranklist.bk_rank}">
												<span>(${ranklist.bk_rank})</span>
											</div>
										</c:if>
										<!-- 리뷰가 작성되어있지 않으면 실행. -->
										<c:if test="${ranklist.bk_rank==0}">
											<span>평점 없음</span>
										</c:if>
										
										<input type="hidden" id="rankcatenum${i.getIndex() }" value="${ranklist.bk_category }">
									</div>
								</a>
							</div>
						</c:forEach>
						
					</div>
				</div>
			</section>
			
			
			
		</div>
	</div>
	<!-- 푸터 인클루드 -->
	<jsp:include page="include/footerBox.jsp"></jsp:include>
	</div>
	
	
	
<script>
	//가져온 value값 만큼 별점을 출력  
	//owl슬라이드가 실행되기 이전에 실행되어야 하기 때문에 스크립트 문에서 c:if문으로 변경 
	
	/* $(document).ready(function(){
	
		for(var i =0; i < ${bestlist.size() } * 2 ; i++){
			var idx = $("#revStar"+i).find("input").val() ; 
			idx = ( idx - 0.5 )*2
			idx = Math.floor(idx);
			$('#revStar'+i).find('#star'+idx).addClass(' on').prevAll('span').addClass(' on');	
		}  

		
	}); */ 
</script>
<script>
	//가져온 value값 만큼 별점을 출력
	//owl슬라이드가 실행되기 이전에 실행되어야 하기 때문에 스크립트 문에서 c:if문으로 변경 
	/* $(document).ready(function(){

		for(var i =0; i < ${ranklist.size()} * 2  ; i++){
			var idx = $("#starRev"+i).find("input").val() ; 
			idx = ( idx - 0.5 )*2
			idx = Math.floor(idx);
			$('#starRev'+i).find('#star'+idx).addClass(' on').prevAll('span').addClass(' on');
		}
	
	}); */
</script>



<style type="text/css">
.categories-slider.owl-carousel .owl-nav button {
    font-size: 24px;
    color: #ffffff;
    height: 35px;
    width: 35px;
    line-height: 36px;
    text-align: center;
    background: rgba(0, 0, 0, 0.3);
    border-radius: 50%;
    position: absolute;
    left: 30px;
    top: 210px;
}

.carousel-indicators .active {
	background-color: #009603;
}

</style>
</body>
</html>