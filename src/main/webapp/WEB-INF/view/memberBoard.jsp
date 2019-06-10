<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>


<div>
		<table>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>생년월일</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>이메일</td>
				<td>등급</td>
			</tr>
			<tr>
				<td>${mbDto.id}</td>
				<td>${mbDto.name}</td>
				<td>${mbDto.nickname}</td>
				<td>${mbDto.birthday}</td>
				<td>${mbDto.phone}</td>
				<td>${mbDto.address}</td>
				<td>${mbDto.email}</td>
				<td>${mbDto.auth}</td>
			</tr>
		</table>
</div>


</body>
</html>