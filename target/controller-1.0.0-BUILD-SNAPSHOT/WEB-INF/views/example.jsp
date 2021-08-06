<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome! SJBook Store!</title>
<link rel="stylesheet" href="/resources/css/cart.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="resources/js/cart.js" type="text/javascript"></script>
</head>
<body>

<div id="wrap">
	
	
	<jsp:include page="include/header.jsp"></jsp:include>
	
	<div class="categories-section mt-3">
		<div id="content" class="container">
			<div id="side_menu">
				<jsp:include page="include/mypage_menu.jsp"></jsp:include>
			</div>
			<div id="main_contents">
				
				콘텐트 넣는 곳 
				
				
			</div>
		
		
		</div>
	
		
	</div>
	
	
	<jsp:include page="include/footerBox.jsp"></jsp:include>
	
	
	
</div>
</body>
</html>