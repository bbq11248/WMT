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
	<form action="./updateT.do">
		<table>
			<tr>
				<td>영화관 번호</td>
				<td>영화관 이름</td>
				<td>영화관 주소</td>
			</tr>
			<tr>
				<td>
					<input type="text" readonly="readonly" value="${theater_no}" name="theater_no">
				</td>
				<td>
					<input type="text" <%-- placeholder="${theater_name}"  --%>value="${theater_name}" name="theater_name">
				</td>
				<td>
					<input type="text" <%-- placeholder="${theater_local}" --%> value="${theater_local}" name="theater_local">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>