<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <link rel="stylesheet" href="../resources/css/include/top_login.css">
				<c:if test="${member == null}">
					<div id="top_1_login_button"><a href="loginMain"><h1>SJB로그인</h1></a>
					<br>
					<a href="member/joinPage" id="join_buttion">회원가입</a>
					</div>
				</c:if>
				<c:if test="${member != null}">
					<div id="top_1_login_info">
						<div id="top_1_login_info_inwrap">
							<span><strong id="member_strong">  회   원</strong> : ${member.memberName}<!-- 님 환영합니다 --></span>
							<br>
							<span id="top_1_login_info_inwrap_money"><strong>충전금액 </strong>: <fmt:formatNumber value="${member.money}" pattern="#,###"/> 원  </span>
							<span id="top_1_login_info_inwrap_point"><strong>포인트 </strong>: <fmt:formatNumber value="${member.point}" pattern="#,###"/> 원  </span>
						</div>
					</div>
				</c:if>