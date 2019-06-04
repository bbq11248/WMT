<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		width: 1080px;
		height: 990px;
		text-align: center;
		margin-left: 411.5px; 
	}	
	.main{
		width: 1080px;
		height: 70px;
		background-color: yellow;
		margin-bottom: 20px;
	}
	.main_header h1{
		margin: 0px;
	}
	.main_info{
		float: right;
	}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<body>
	<div class="main">
		<div class="main_header">
			<h1>WMT</h1>
		</div>
		<div class="main_info">
			<input type="button" value="로그인">
		<input type="button" value="회원가입">
		<input type="button" value="공지 사항">
		</div>
	</div>
	
	<div class="main">
		<div class="main_header">
			<h1>WMT</h1>
		</div>
		<div class="main_info">
		<input class="headerBtn" type="text" value="마일리지 잔액">
		<input class="headerBtn" type="button" value="로그아웃">
		<input class="headerBtn" type="button" value="마이페이지">
		<input class="headerBtn" type="button" value="마일리지 충전">
		<input class="headerBtn" type="button" value="영화 예매">
		<input class="headerBtn" type="button" value="공지 사항">
		</div>
	</div>
	
	<div class="main">
		<div class="main_header">
			<h1>WMT</h1>
		</div>
		<div class="main_info">
		<input class="headerBtn" type="button" value="로그 아웃">
		<input class="headerBtn" type="button" value="영화관 관리">
		<input class="headerBtn" type="button" value="상영관 관리">
		<input class="headerBtn" type="button" value="영화 관리">
		<input class="headerBtn" type="button" value="상영중인 영화 관리">
		<input class="headerBtn" type="button" value="공지 사항">
		</div>
	</div>
</body>
</html>