<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 수정 페이지</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<body>

<div>
	<h3>회원정보수정</h3>
</div>


	<form action="./updateMyBoard.do">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" value="${id}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value="${name}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>
					<input type="text" name="nickname" value="${nickname}">
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" name="birthday" value="${birthday}">
				</td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td>
					<input type="text" name="phone" value="${phone}">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="address" value="${address}">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email" value="${email}" readonly="readonly">
				</td>
			</tr>
		
		</table>
		<input type="text" >
	</form>


</body>
</html>