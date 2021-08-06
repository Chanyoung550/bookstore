<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Phozogy Template">
<meta name="keywords" content="Phozogy, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>북스토어</title>


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
</head>
<body>
	<!-- 상단부(로고, 검색창, 로그인창) -->
	<header>
		<div id="top">
			<div id="top_1">
				<div id="top_1_logo">
					<div id="top_1_logo_1">
						<a href="main"><img src="resources/img/logo.png"></a>
					</div>
				</div>
				<div id="top_1_selection">
					<div id="top_1_selection_1">
						<jsp:include page="include/searchBox.jsp"></jsp:include>
					</div>
				</div>
				<!-- Page Preloder -->
				<div id="preloder">
					<div class="loader"></div>
				</div>
			</div>
		</div>
	</header>

			<!-- Hero Section Begin -->
			<section class="hero-section">
				<div class="hs-slider owl-carousel">
					<!-- 			<div class="hs-item set-bg" data-setbg="resources/bootstraps/img/hero/hero-1.jpg"> -->
					<div class="hs-item set-bg"
						data-setbg="http://image.kyobobook.co.kr/ink/images/prom/2020/banner/200123/bnN_01.jpg">
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<div class="hs-text">
										<h2>Photography Studio</h2>
										<p>
											Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
											do eiusmod tempor incididunt ut labore et<br /> dolore magna
											aliqua. Quis ipsum suspendisse ultrices gravida accumsan
											lacus vel facilisis.
										</p>
										<a href="#" class="primary-btn">Contact us</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="categories-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="section-title">
								<h2>베스트 셀러</h2>
								<p>
									<br /> <br />
								</p>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="right-btn">
								<a href="#" class="primary-btn">VIew all</a>
							</div>
						</div>
					</div>
					<div class="categories-slider owl-carousel">
						<div class="cs-item">
							<c:forEach items="${bestlist}" var="bestlist" varStatus="i">
								<div class="new_box_list">
									<a href="detail?num=${bestlist.bk_num}">
										<div class="list_img">
											<img class="img_size" src="${bestlist.bk_thumbUrl}">
										</div>
										<div class="main2_1_box_con">
											<strong><span class="main2_1_box_con_cate"
												id="cate${i.getIndex() }"></span></strong> <input type="hidden"
												id="catenum${i.getIndex() }"
												value="${bestlist.bk_category }"> <br> <span
												class="main2_1_box_con_title">${bestlist.bk_name }</span> <br>
											<c:if test="${bestlist.bk_rank!=0}">
												<div class="starRev" id="revStar${i.getIndex() }">
													<span class="starR1" id="star0" value="0.5">별1_왼쪽</span> <span
														class="starR2" id="star1" value="1">별1_오른쪽</span> <span
														class="starR1" id="star2" value="1.5">별2_왼쪽</span> <span
														class="starR2" id="star3" value="2">별2_오른쪽</span> <span
														class="starR1" id="star4" value="2.5">별3_왼쪽</span> <span
														class="starR2" id="star5" value="3">별3_오른쪽</span> <span
														class="starR1" id="star6" value="3.5">별4_왼쪽</span> <span
														class="starR2" id="star7" value="4">별4_오른쪽</span> <span
														class="starR1" id="star8" value="4.5">별5_왼쪽</span> <span
														class="starR2" id="star9" value="5">별5_오른쪽</span> <input
														type="hidden" id="star_rank" value="${bestlist.bk_rank}">
													<span>(${bestlist.bk_rank})</span>
												</div>
											</c:if>
											<c:if test="${bestlist.bk_rank==0}">
												<p>평점 없음</p>
											</c:if>
										</div>
									</a>
								</div>
								<script>
									$(document)
											.ready(
													function() {
														var cateCodeNum = $(
																'#catenum${i.getIndex() }')
																.val();
														var cateNum = parseInt(cateCodeNum);
														var category = cateSwitch(cateNum);
														$(
																'#cate${i.getIndex() }')
																.text(category);
													});
								</script>
							</c:forEach>
							<!-- <div class="cs-pic set-bg" data-setbg="img/categories/cat-1.jpg"></div> -->
							<div class="cs-pic set-bg"
								data-setbg="resources/bootstraps/img/testPic.png"></div>
							<div class="cs-text">
								<h4>Animal</h4>
								<span>120 pictures</span>
							</div>
						</div>
						<!-- <div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-2.jpg"></div>
							<div class="cs-text">
								<h4>Natural</h4>
								<span>325 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-3.jpg"></div>
							<div class="cs-text">
								<h4>Potrait</h4>
								<span>540 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-4.jpg"></div>
							<div class="cs-text">
								<h4>Animal</h4>
								<span>120 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-5.jpg"></div>
							<div class="cs-text">
								<h4>Animal</h4>
								<span>120 pictures</span>
							</div>
						</div> -->
					</div>
				</div>
			</section>
			<!-- Categories Section End -->

			<section class="categories-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="section-title">
								<h2>신간</h2>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do<br />
									eiusmod tempor incididunt ut labore et dolore.
								</p>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="right-btn">
								<a href="#" class="primary-btn">VIew all</a>
							</div>
						</div>
					</div>
					<div class="categories-slider owl-carousel">
						<div class="cs-item">
							<!-- 					<div class="cs-pic set-bg" data-setbg="img/categories/cat-1.jpg"></div> -->
							<!--  -->
							<c:forEach items="${list}" var="list" varStatus="i">
								<div class="new_box_list">
									<a href="detail?num=${list.bk_num}">
										<div class="list_img">
											<img class="img_size" src="${list.bk_thumbUrl}">
										</div>
										<div class="main2_1_box_con">
											<Strong><span class="main2_1_box_con_cate"
												id="newcate${i.getIndex() }"></span></Strong> <input type="hidden"
												id="newcatenum${i.getIndex() }" value="${list.bk_category }">
											<br> <span class="main2_1_box_con_title">${list.bk_name}</span>
											<br> <span class="main2_1_box_con_year">${list.bk_pdate}</span>
										</div>
									</a>
								</div>
								<script>
									$(document)
											.ready(
													function() {
														var cateCodeNum = $(
																'#newcatenum${i.getIndex() }')
																.val();
														var cateNum = parseInt(cateCodeNum);
														var category = cateSwitch(cateNum);
														$(
																'#newcate${i.getIndex() }')
																.text(category);
													});
								</script>
							</c:forEach>
							<!--  -->
							<div class="cs-pic set-bg"
								data-setbg="resources/bootstraps/img/testPic.png"></div>
							<div class="cs-text">
								<h4>Animal</h4>
								<span>120 pictures</span>
							</div>
							f
						</div>
						<!-- <div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-2.jpg"></div>
							<div class="cs-text">
								<h4>Natural</h4>
								<span>325 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-3.jpg"></div>
							<div class="cs-text">
								<h4>Potrait</h4>
								<span>540 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-4.jpg"></div>
							<div class="cs-text">
								<h4>Animal</h4>
								<span>120 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-5.jpg"></div>
							<div class="cs-text">
								<h4>Animal</h4>
								<span>120 pictures</span>
							</div>
						</div> -->
					</div>
				</div>
			</section>
			<!-- Categories Section End -->

			<section class="categories-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="section-title">
								<h2>평점수</h2>
								<p>
									Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do<br />
									eiusmod tempor incididunt ut labore et dolore.
								</p>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="right-btn">
								<a href="#" class="primary-btn">VIew all</a>
							</div>
						</div>
					</div>
					<div class="categories-slider owl-carousel">
						<div class="cs-item">
							<!-- 					<div class="cs-pic set-bg" data-setbg="img/categories/cat-1.jpg"></div> -->
							<div class="cs-pic set-bg"
								data-setbg="resources/bootstraps/img/testPic.png"></div>
							<div class="cs-text">
								<h4>Animal</h4>
								<span>120 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-2.jpg"></div>
							<div class="cs-text">
								<h4>Natural</h4>
								<span>325 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-3.jpg"></div>
							<div class="cs-text">
								<h4>Potrait</h4>
								<span>540 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-4.jpg"></div>
							<div class="cs-text">
								<h4>Animal</h4>
								<span>120 pictures</span>
							</div>
						</div>
						<div class="cs-item">
							<div class="cs-pic set-bg" data-setbg="img/categories/cat-5.jpg"></div>
							<div class="cs-text">
								<h4>Animal</h4>
								<span>120 pictures</span>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Categories Section End -->



			<!-- Portfolio Section Begin -->
			<section class="portfolio-section spad">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="section-title">
								<h2>신간</h2>
							</div>
							<div class="filter-controls">
								<ul>
									<li class="active" data-filter="*">All</li>
									<li data-filter=".fashion">Fashion</li>
									<li data-filter=".lifestyle">Lifestyle</li>
									<li data-filter=".natural">Natural</li>
									<li data-filter=".wedding">Wedding</li>
									<li data-filter=".videos">Videos</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 p-0">
							<div class="portfolio-filter">
								<!-- 						<div class="pf-item set-bg fashion"
							data-setbg="img/portfolio/pf-1.jpg"> -->
								<div class="pf-item set-bg fashion"
									data-setbg="resources/bootstraps/img/testPic.png">
									<!-- 							<a href="img/portfolio/pf-1.jpg" class="pf-icon image-popup"><span
								class="icon_plus"></span></a> -->
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<div class="pf-item large-width large-height set-bg lifestyle"
									data-setbg="resources/bootstraps/img/testPic.png">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<!-- 						<div class="pf-item large-width set-bg natural"
							data-setbg="img/portfolio/pf-3.jpg"> -->
								<div class="pf-item large-width set-bg natural"
									data-setbg="resources/bootstraps/img/testPic.png">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<!-- 						<div class="pf-item large-height set-bg wedding"
							data-setbg="img/portfolio/pf-4.jpg"> -->
								<div class="pf-item large-height set-bg wedding"
									data-setbg="resources/bootstraps/img/testPic.png"">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<!-- 						<div class="pf-item set-bg lifestyle"
							data-setbg="img/portfolio/pf-7.jpg"> -->
								<div class="pf-item set-bg lifestyle"
									data-setbg="resources/bootstraps/img/testPic.png">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<!-- 						<div class="pf-item set-bg natural"
							data-setbg="img/portfolio/pf-8.jpg"> -->
								<div class="pf-item set-bg natural"
									data-setbg="resources/bootstraps/img/testPic.png">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<div class="pf-item set-bg videos"
									data-setbg="resources/bootstraps/img/testPic.png">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<div class="pf-item set-bg fashion"
									data-setbg="resources/bootstraps/img/testPic.png">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<div class="pf-item large-width set-bg videos"
									data-setbg="resources/bootstraps/img/testPic.png">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<div class="pf-item set-bg fashion"
									data-setbg="resources/bootstraps/img/testPic.png">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
								<div class="pf-item large-width large-height set-bg wedding"
									data-setbg="resources/bootstraps/img/testPic.png">
									<a href="resources/bootstraps/img/testPic.png"
										class="pf-icon image-popup"><span class="icon_plus"></span></a>
									<div class="pf-text">
										<h4>COLORS SPEAK</h4>
										<span>Fashion</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="load-more-btn">
					<a href="#">Load More</a>
				</div>
			</section>
			<!-- Portfolio Section End -->

			<!-- Footer Section Begin -->
			<jsp:include page="include/footerBox.jsp"></jsp:include>
			<!-- Footer Section End -->



			<!-- Js Plugins -->
			<script src="resources/bootstraps/js/jquery-3.3.1.min.js"></script>
			<script src="resources/bootstraps/js/bootstrap.min.js"></script>
			<script src="resources/bootstraps/js/jquery.magnific-popup.min.js"></script>
			<script src="resources/bootstraps/js/isotope.pkgd.min.js"></script>
			<script src="resources/bootstraps/js/masonry.pkgd.min.js"></script>
			<script src="resources/bootstraps/js/jquery.slicknav.js"></script>
			<script src="resources/bootstraps/js/owl.carousel.min.js"></script>
			<script src="resources/bootstraps/js/main.js"></script>
</body>
</html>