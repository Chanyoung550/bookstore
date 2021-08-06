<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/include/searchBox.css">
<form action="/search" method="get">				
<div id="top_1_selection_1_search">
	
		<div class="keyword_box">
			<select name="searchType" id="searchType">
				<option value="title">제목 검색</option>
				<option value="content">작가 검색</option>
			</select>
			<input type="text" name="keyword" class="keyword"id="keyword">
			<input type="submit" value="검색" class="key_btn"id="btn_Search">
		
		</div>
	<div class="clearfix"></div>
</div>
</form>
