<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="../resources/css/include/top_mini.css">
    	<ul id="top_mini_1_ul">
				<!-- <li><a href="/buyTest">테스트페이지</li> -->
				<!-- <li><a href="/purchase/preBuy">테스트페이지</li> -->
				<c:if test="${member.memberAdmin == 1}">
					<!-- <li><a href="/admin/list">관리자페이지</li> -->
					<li><a href="/admin/main">관리자페이지</li>
				</c:if>
				<c:if test="${member != null}">
					<li><strong>${member.memberName}</strong>님 환영합니다</li>
					<li><a id="logout">로그아웃</a></li>
					<script>
							$(document).ready(function(){
								$("#logout").click(function(){
									$.ajax({
										type:"POST",
										url : "member/logout",
										success:function(data){
											alert("로그아웃 되었습니다.");
											document.location.reload();
										}
									});//ajax 끝
								});//function 끝
							});
					</script>
					<li><a href="myRoom/mainPaging">마이룸</a></li>
					<li><a href="cart">장바구니</a></li>
				</c:if>
				
				<!-- <li>고객센터</li> -->
		</ul>