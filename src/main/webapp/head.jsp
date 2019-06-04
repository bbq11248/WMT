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
	h1{
		text-align: center;
	}
	
	input{
		float: left;
	}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<body>
	<div>
		<h1>WMT</h1>
		<input type="button" value="로그인">
		<input type="button" value="회원가입">
		<input type="button" value="공지 사항">
	</div>
	
	<div>
		<h1>WMT</h1>
		<input type="text" value="마일리지 잔액">
		<input type="button" value="로그아웃">
		<input type="button" value="마이페이지">
		<input type="button" value="마일리지 충전">
		<input type="button" value="영화 예매">
		<input type="button" value="공지 사항">
	</div>
	
	<div>
		<h1>WMT</h1>
		<input type="button" value="로그 아웃">
		<input type="button" value="영화관 관리">
		<input type="button" value="상영관 관리">
		<input type="button" value="영화 관리">
		<input type="button" value="상영중인 영화 관리">
		<input type="button" value="공지 사항">
	</div>
</body>
</html>