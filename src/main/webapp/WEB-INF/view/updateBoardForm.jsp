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
</head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<body>
	<table>
		<tr>
			<td>글제목</td>
			<td>
				<input type="text" readonly="readonly" value="${seq}" name="seq">
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>
				<input type="text" readonly="readonly" value="${id}" name="id">
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" value="${title}" name="title">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<input type="text" value="${content}" name="content">
			</td>
		</tr>
	</table>
</body>
</html>