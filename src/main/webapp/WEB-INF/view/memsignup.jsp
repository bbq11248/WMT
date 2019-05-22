<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<!--  ID, PW, NAME, NICKNAME, BIRTHDAY, PHONE, ADDRESS, EMAIL, AUTH, REGDATE -->
<div id="CenterInfo">
	<input type="text" id="id" name="id" placeholder="아이디" required="required">
	<br>
	<input type="text" id="pw" name="pw" placeholder="비밀번호" required="required">
	<br>
	<input type="text" id="rePass" name="rePass" placeholder="비밀번호 확인" required="required">
	<br>
	<input type="text" id="name" name="name" placeholder="이름" required="required">
	<br>
	<input type="text" id="birthday" name="birthday" placeholder="생년월일" required="required">
	<br>
	<input type="text" id="phone" name="phone" placeholder="전화번호" required="required">
	<br>
	<input type="text" id="address" name="address" placeholder="이메일" required="required">
</div>

</body>
</html>